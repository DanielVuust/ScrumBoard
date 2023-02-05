import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

part 'scrum_board_column_event.dart';
part 'scrum_board_column_state.dart';

class ScrumboardColumnBloc
    extends Bloc<ScrumBoardColumnEvent, ScrumBoardColumnState> {
  final _columnItemsChangedController = StreamController<ScrumBoardColumn>();

  StreamSink<ScrumBoardColumn> get _currentItems =>
      _columnItemsChangedController.sink;

  Stream<ScrumBoardColumn> get items => _columnItemsChangedController.stream;

  //Events.
  final _eventStreamController = StreamController<ScrumBoardColumnEvent>();

  StreamSink<ScrumBoardColumnEvent> get eventSink =>
      _eventStreamController.sink;

  Stream<ScrumBoardColumnEvent> get eventStream =>
      _eventStreamController.stream;

  ScrumboardColumnBloc(ScrumBoardColumn column)
      : super(ScrumBoardColumnInitial(column)) {
    _eventStreamController.stream.listen(_mapEventToState);
    _currentItems.add(state.column);
  }

  Future<void> _mapEventToState(ScrumBoardColumnEvent event) {
    Future<void> future = Future.delayed(const Duration(seconds: 0), () {
      event.execute(state.column.scrumboardColumnWorkItems!);
      _currentItems.add(state.column);
    });
    return future;
  }
}
