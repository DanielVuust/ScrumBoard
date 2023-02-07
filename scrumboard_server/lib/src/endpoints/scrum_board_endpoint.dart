import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardEndpoint extends Endpoint {
  Future<List<ScrumBoardColumn>> addMockData(Session session) async {
    var user = User(firstName: "Daniel", lastName: "Vuust");
    User.insert(session, user);

    var scrumBoard = ScrumBoard(boardNickname: "Scumr board 1");
    await ScrumBoard.insert(session, scrumBoard);

    for (int i = 0; i < 3; i++) {
      var scrumBoardColumn = ScrumBoardColumn(
          scrumBoardId: scrumBoard.id,
          boardIndex: i,
          heading: "Column $i",
          scrumboardColumnWorkItems: []);
      await ScrumBoardColumn.insert(session, scrumBoardColumn);
      for (int j = 0; j < 3; j++) {
        var workitem = ScrumBoardWorkItem(
            columnIndex: j,
            description: "Description",
            name: "WorkItem $j $i",
            scurmBoardColumnId: scrumBoardColumn.id,
            responsibleUserId: (await User.findById(session, 1))!.id);
        await ScrumBoardWorkItem.insert(session, workitem);
      }
    }

    var test = await ScrumBoardColumn.find(session);
    return test;
  }

  Future<ScrumBoard?> find(Session session, int scrumBoadId) async {
    session.log("Calling find in ScrumBoardEndpoint");

    //SERVERPOD 1.0.0 DOESN'T SUPPORT AUTOMATIC JOINS ON TABLES, SO WE NEED TO CALL EACH TABLE WE WANT TO GET FROM THE DB.
    //TODO WHEN SERVERPOD SUPPORTS AUTOMATIC JOINS CHANGE THIS.

    var scrumBoard = await ScrumBoard.findById(session, scrumBoadId);
    if (scrumBoard == null) {
      return null;
    }
    scrumBoard.scrumBoardColumns = await ScrumBoardColumn.find(session,
        where: (t) => t.scrumBoardId.equals(scrumBoard.id),
        orderBy: ScrumBoardColumn.t.boardIndex);

    if (scrumBoard.scrumBoardColumns == null) {
      return scrumBoard;
    }

    for (int i = 0; i < scrumBoard.scrumBoardColumns!.length; i++) {
      scrumBoard.scrumBoardColumns![i].scrumboardColumnWorkItems =
          await ScrumBoardWorkItem.find(session,
              where: (t) => t.scurmBoardColumnId
                  .equals(scrumBoard.scrumBoardColumns![i].id),
              orderBy: ScrumBoardWorkItem.t.columnIndex);
    }
    return scrumBoard;
  }
}
