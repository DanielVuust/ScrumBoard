import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scrumboard_column_event.dart';
part 'scrumboard_column_state.dart';

class ScrumboardColumnBloc
    extends Bloc<ScrumboardColumnAddEvent<int>, ScrumboardColumnState> {
  final _colorChangedStateController = StreamController<List<int>>();

  StreamSink<List<int>> get _currentColor => _colorChangedStateController.sink;

  Stream<List<int>> get color => _colorChangedStateController.stream;

  //Events.
  final _eventStreamController = StreamController<ScrumboardColumnAddEvent>();

  StreamSink<ScrumboardColumnAddEvent> get eventSink =>
      _eventStreamController.sink;

  Stream<ScrumboardColumnAddEvent> get eventStream =>
      _eventStreamController.stream;

  ScrumboardColumnBloc(List<int> list)
      : super(ScrumboardColumnInitial(list: list)) {
    _eventStreamController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ScrumboardColumnEvent event) {
    if (event is ScrumboardColumnAddEvent) {
      print("ScrumboardColumnAddEvent");
      state.list.add(1);
      print(state.list);
    }
    if (event is ScrumboardColumnRemoveEvent) {
      print("ScrumboardColumnRemoveEvent");
    }
  }
}
