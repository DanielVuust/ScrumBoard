part of 'scrum_board_column_bloc.dart';

abstract class ScrumBoardColumnEvent {
  const ScrumBoardColumnEvent(this.workItem);
  final ScrumBoardWorkItem workItem;

  execute(List<ScrumBoardWorkItem> workItems);
}

class ScrumBoardColumnAddEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnAddEvent(ScrumBoardWorkItem workItem)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItem> workItems) {
    workItems.add(workItem);
  }
}

class ScrumBoardColumnRemoveEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnRemoveEvent(ScrumBoardWorkItem workItem)
      : super(workItem);
  @override
  execute(List<ScrumBoardWorkItem> workItems) {
    workItems.remove(workItem);
  }
}

class ScrumBoardColumnAddNewEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnAddNewEvent(ScrumBoardWorkItem workItem)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItem> workItems) {
    workItems.add(workItem);
  }
}

class ScrumBoardColumnReorderItemEvent extends ScrumBoardColumnEvent {
  final int indexToReplace;
  const ScrumBoardColumnReorderItemEvent(
      ScrumBoardWorkItem workItem, this.indexToReplace)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItem> workItems) {
    late int currentIndexToReplace = indexToReplace;
    workItem.columnIndex = indexToReplace;
    workItems.add(workItem);
  }

  
}
