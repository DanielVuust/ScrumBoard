part of 'scrum_board_bloc.dart';

abstract class ScrumBoardEvent {
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  execute(ScrumBoardState state);
}

class ScrumBoardAddColumnEvent extends ScrumBoardEvent {
  final ScrumBoardColumn column;

  ScrumBoardAddColumnEvent(this.column);
  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardColumn.insert(column);
    state.scrumBoard =
        await client.scrumBoard.find(state.scrumBoard.id!) as ScrumBoard;
  }
}

class ScrumBoardRemoveColumnEvent extends ScrumBoardEvent {
  @override
  execute(ScrumBoardState state) {}
}

class ScrumBoardMoveColumnItemEvent extends ScrumBoardEvent {
  @override
  execute(ScrumBoardState state) {}
}

class ScrumBoardMoveWorkItemEvent extends ScrumBoardEvent {
  final int workItemId;
  final int movedToColumnId;
  final int movedToWorkItemIndex;
  ScrumBoardMoveWorkItemEvent(
      this.workItemId, this.movedToColumnId, this.movedToWorkItemIndex);
  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.updateColumnWorkItems(
        workItemId, movedToColumnId, movedToWorkItemIndex);
    state.scrumBoard =
        await client.scrumBoard.find(state.scrumBoard.id!) as ScrumBoard;
  }
}

class ScrumBoardDeleteWorkItemEvent extends ScrumBoardEvent {
  final int workItemId;
  ScrumBoardDeleteWorkItemEvent(this.workItemId);
  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.delete(workItemId);
    state.scrumBoard =
        await client.scrumBoard.find(state.scrumBoard.id!) as ScrumBoard;
  }
}

class ScrumBoardAddWorkItemEvent extends ScrumBoardEvent {
  final ScrumBoardWorkItem workItem;
  ScrumBoardAddWorkItemEvent(this.workItem);
  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.insert(workItem);
    state.scrumBoard =
        await client.scrumBoard.find(state.scrumBoard.id!) as ScrumBoard;
  }
}

class ScrumBoardGetInisialValueEvent extends ScrumBoardEvent {
  final int scrumBoardId;
  ScrumBoardGetInisialValueEvent(this.scrumBoardId);
  @override
  execute(ScrumBoardState state) async {
    state.scrumBoard = await client.scrumBoard.find(scrumBoardId) as ScrumBoard;

  }
}
