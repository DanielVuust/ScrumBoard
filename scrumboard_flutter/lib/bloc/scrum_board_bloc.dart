import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'scrum_board_event.dart';
part 'scrum_board_state.dart';

class ScrumBoardBloc extends Bloc<ScrumBoardEvent, ScrumBoardState> {
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
  }

  Future<void> _mapEventToState(ScrumBoardEvent event) async {
    await event.execute(state);
    _currentScrumBoard.add(state.scrumBoard);
    ScrumBoardNotifyOnScrumBoardChange().execute(state);
    ScrumBoardListenToWebSocketEvent().execute(state);
  }
}
