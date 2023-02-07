import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardEndpoint extends Endpoint {
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

  Future<List<ScrumBoard>> getAll(Session session) async {
    return await ScrumBoard.find(session);
  }
}
