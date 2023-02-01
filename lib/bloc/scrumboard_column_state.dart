part of 'scrumboard_column_bloc.dart';

abstract class ScrumboardColumnState {
  final List<ScrumBoardWorkItemDAO> workItems;
  ScrumboardColumnState(this.workItems);
}

class ScrumboardColumnInitial extends ScrumboardColumnState {
  ScrumboardColumnInitial(List<ScrumBoardWorkItemDAO> workItems)
      : super(workItems);
}
