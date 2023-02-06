import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../logging.dart';

part 'scrum_board_event.dart';
part 'scrum_board_state.dart';

class ScrumBoardBloc extends Bloc<ScrumBoardEvent, ScrumBoardState> {
  var log = logger(ScrumBoardBloc);
  final _scrumBoardChangedController = StreamController<ScrumBoard>();

  StreamSink<ScrumBoard> get _currentScrumBoard =>
      _scrumBoardChangedController.sink;

  Stream<ScrumBoard> get scrumBoard {
    return _scrumBoardChangedController.stream;
  }

  //Events.
  final _eventStreamController = StreamController<ScrumBoardEvent>();

  StreamSink<ScrumBoardEvent> get eventSink => _eventStreamController.sink;

  Stream<ScrumBoardEvent?> get eventStream => _eventStreamController.stream;

  ScrumBoardBloc() : super(ScrumBoardInitial()) {
    _eventStreamController.stream.listen(_mapEventToState);
    _currentScrumBoard.add(state.scrumBoard);
    _test();
  }

  Future<void> _mapEventToState(ScrumBoardEvent event) async {
    await event.execute(state);
    _currentScrumBoard.add(state.scrumBoard);
    if (event.shouldUpdateWebSocketListeners) {
      ScrumBoardNotifyOnScrumBoardChange().execute(state);
    }
  }

  _test() async {
    var client = Client('http://localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor();
    try {
      await client.openStreamingConnection();

      log.i("Streaming connection opened, now waiting for event");

      await for (var message in client.scrumBoardWebSocketEvent.stream) {
        log.d("Websocket evnet hit ");

        if (message is ScrumBoard) {
          log.d("Websocket: Updating scrum board");
          
          state.scrumBoard = message;
          _currentScrumBoard.add(state.scrumBoard);
          
          continue;
        }

        
        log.i("Could not resolve message from web socket");
      }

    } catch (ex) {
      
      log.e(ex);
    
    } finally {
    
      log.wtf("Should not be here");
      client.closeStreamingConnection();
    
    }
  }
}
