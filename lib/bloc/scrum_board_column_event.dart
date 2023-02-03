part of 'scrum_board_column_bloc.dart';

abstract class ScrumBoardColumnEvent {
  const ScrumBoardColumnEvent(this.workItem);
  final ScrumBoardWorkItemDTO workItem;

  execute(List<ScrumBoardWorkItemDTO> workItems);
}

class ScrumBoardColumnAddEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnAddEvent(ScrumBoardWorkItemDTO workItem)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItemDTO> workItems) {
    workItems.add(workItem);
  }
}

class ScrumBoardColumnRemoveEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnRemoveEvent(ScrumBoardWorkItemDTO workItem)
      : super(workItem);
  @override
  execute(List<ScrumBoardWorkItemDTO> workItems) {
    workItems.remove(workItem);
  }
}

class ScrumBoardColumnAddNewEvent extends ScrumBoardColumnEvent {
  const ScrumBoardColumnAddNewEvent(ScrumBoardWorkItemDTO workItem)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItemDTO> workItems) {
    workItems.add(workItem);
  }
}

class ScrumBoardColumnReorderItemEvent extends ScrumBoardColumnEvent {
  final int indexToReplace;
  const ScrumBoardColumnReorderItemEvent(
      ScrumBoardWorkItemDTO workItem, this.indexToReplace)
      : super(workItem);

  @override
  execute(List<ScrumBoardWorkItemDTO> workItems) {
    late int currentIndexToReplace = indexToReplace;
    incrementIndexByOne(workItems, indexToReplace);
    workItem.index = indexToReplace;
    workItems.add(workItem);
  }

  incrementIndexByOne(List<ScrumBoardWorkItemDTO> workItems, int currentIndexToReplace) {
    while (workItems.any((x) => x.index == currentIndexToReplace)) {
      final workItemToReplace =
          workItems.singleWhere((x) => x.index == currentIndexToReplace);
      incrementIndexByOne(workItems, currentIndexToReplace + 1);
      workItemToReplace.index++;
    }
  }
}
