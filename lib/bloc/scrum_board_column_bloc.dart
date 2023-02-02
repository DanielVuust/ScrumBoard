import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scrumboard/models/scrum_board_work_item_dto.dart';

import '../models/scrum_board_column_dto.dart';

part 'scrum_board_column_event.dart';
part 'scrum_board_column_state.dart';

class ScrumboardColumnBloc
    extends Bloc<ScrumBoardColumnEvent, ScrumBoardColumnState> {
  final _columnItemsChangedController = StreamController<ScrumBoardColumnDTO>();

  StreamSink<ScrumBoardColumnDTO> get _currentItems =>
      _columnItemsChangedController.sink;

  Stream<ScrumBoardColumnDTO> get items => _columnItemsChangedController.stream;

  //Events.
  final _eventStreamController = StreamController<ScrumBoardColumnEvent>();

  StreamSink<ScrumBoardColumnEvent> get eventSink =>
      _eventStreamController.sink;

  Stream<ScrumBoardColumnEvent> get eventStream =>
      _eventStreamController.stream;

  ScrumboardColumnBloc(ScrumBoardColumnDTO column)
      : super(ScrumBoardColumnInitial(column)) {
    _eventStreamController.stream.listen(_mapEventToState);
    _currentItems.add(state.column);
  }

  Future<void> _mapEventToState(ScrumBoardColumnEvent event) {
    Future<void> future = Future.delayed(const Duration(seconds: 0), () {
      event.execute(state.column.workItems);
      _currentItems.add(state.column);
    });
    return future;
  }
}
