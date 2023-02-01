part of 'scrumboard_column_bloc.dart';

abstract class ScrumboardColumnEvent {
  const ScrumboardColumnEvent(this.workItem);
  final ScrumBoardWorkItemDAO workItem;

  execute(List<ScrumBoardWorkItemDAO> workItems);
}

class ScrumboardColumnAddEvent extends ScrumboardColumnEvent {
  const ScrumboardColumnAddEvent(ScrumBoardWorkItemDAO workItem)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItemDAO> workItems) {
    workItems.add(workItem);
  }
}

class ScrumboardColumnRemoveEvent extends ScrumboardColumnEvent {
  const ScrumboardColumnRemoveEvent(ScrumBoardWorkItemDAO workItem)
      : super(workItem);
  @override
  execute(List<ScrumBoardWorkItemDAO> workItems) {
    workItems.remove(workItem);
  }
}
