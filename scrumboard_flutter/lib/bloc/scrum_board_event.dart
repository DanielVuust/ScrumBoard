part of 'scrum_board_bloc.dart';

abstract class ScrumBoardEvent {
  //Client that connects frontend to backend.
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  var log = logger(ScrumBoardEvent);

  bool shouldUpdateWebSocketListeners() {
    return false;
  }

  execute(ScrumBoardState state);
}

class ScrumBoardAddColumnEvent extends ScrumBoardEvent {
  final ScrumBoardColumn column;
  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  ScrumBoardAddColumnEvent(this.column);
  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardColumn.insert(column);
  }
}

class ScrumBoardDeleteColumnEvent extends ScrumBoardEvent {
  final int columnId;
  ScrumBoardDeleteColumnEvent(this.columnId);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardColumn.delete(columnId);
  }
}

class ScrumBoardMoveColumnItemEvent extends ScrumBoardEvent {
  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) {}
}

class ScrumBoardEditColumnEvent extends ScrumBoardEvent {
  final ScrumBoardColumn column;
  ScrumBoardEditColumnEvent(this.column);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardColumn.update(column);
  }
}

class ScrumBoardMoveWorkItemEvent extends ScrumBoardEvent {
  final int workItemId;
  final int movedToColumnId;
  final int movedToWorkItemIndex;
  ScrumBoardMoveWorkItemEvent(
      this.workItemId, this.movedToColumnId, this.movedToWorkItemIndex);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.updateColumnWorkItems(
        workItemId, movedToColumnId, movedToWorkItemIndex);
  }
}

class ScrumBoardDeleteWorkItemEvent extends ScrumBoardEvent {
  final int workItemId;
  ScrumBoardDeleteWorkItemEvent(this.workItemId);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.delete(workItemId);
  }
}

class ScrumBoardAddWorkItemEvent extends ScrumBoardEvent {
  final ScrumBoardWorkItem workItem;
  ScrumBoardAddWorkItemEvent(this.workItem);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.insert(workItem);
  }
}

class ScrumBoardEditWorkItemEvent extends ScrumBoardEvent {
  final ScrumBoardWorkItem workItem;
  ScrumBoardEditWorkItemEvent(this.workItem);

  @override
  bool shouldUpdateWebSocketListeners() {
    return true;
  }

  @override
  execute(ScrumBoardState state) async {
    await client.scrumBoardWorkItem.update(workItem);
  }
}

class ScrumBoardWorkItemChangeResposibleUser extends ScrumBoardEvent {
  final ScrumBoardWorkItem workItem;
  final int userId;
  ScrumBoardWorkItemChangeResposibleUser(this.workItem, this.userId);

  @override
  execute(ScrumBoardState state) async {
    workItem.responsibleUserId = userId;
    await client.scrumBoardWorkItem.update(workItem);
  }
}

class ScrumBoardGetInitialValueEvent extends ScrumBoardEvent {
  final int scrumBoardId;
  ScrumBoardGetInitialValueEvent(this.scrumBoardId);

  @override
  execute(ScrumBoardState state) async {
    state.scrumBoard = await client.scrumBoard.find(scrumBoardId) as ScrumBoard;

    state.assignableUsers = await client.user.getAllUsers();
  }
}

class ScrumBoardNotifyOnScrumBoardChange extends ScrumBoardEvent {
  @override
  execute(ScrumBoardState state) async {
    await client.openStreamingConnection();
    await client.scrumBoardWebSocketEvent
        .sendStreamMessage(User(firstName: '', lastName: ''));
    log.i("Streamed Notification");
    await client.closeStreamingConnection();
  }
}
