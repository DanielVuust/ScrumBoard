import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scrumboard/models/scrum_board_work_item_dao.dart';

part 'scrumboard_column_event.dart';
part 'scrumboard_column_state.dart';

class ScrumboardColumnBloc
    extends Bloc<ScrumboardColumnEvent, ScrumboardColumnState> {
  final _columnItemsChangedController = StreamController<List<ScrumBoardWorkItemDAO>>();

  StreamSink<List<ScrumBoardWorkItemDAO>> get _currentItems => _columnItemsChangedController.sink;

  Stream<List<ScrumBoardWorkItemDAO>> get items => _columnItemsChangedController.stream;

  //Events.
  final _eventStreamController = StreamController<ScrumboardColumnEvent>();

  StreamSink<ScrumboardColumnEvent> get eventSink =>
      _eventStreamController.sink;

  Stream<ScrumboardColumnEvent> get eventStream =>
      _eventStreamController.stream;

  ScrumboardColumnBloc(List<ScrumBoardWorkItemDAO> workItems)
      : super(ScrumboardColumnInitial(workItems)) {
        _currentItems.add(state.workItems);
    _eventStreamController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ScrumboardColumnEvent event) {
      event.execute(state.workItems);
    _currentItems.add(state.workItems);
  }
}
