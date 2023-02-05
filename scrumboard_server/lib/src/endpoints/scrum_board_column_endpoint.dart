import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardColumnEndpoint extends Endpoint {
  Future<List<ScrumBoardColumn>> getScrumBoardColumns(
      Session session, int scrumBoardId) async {
    return await ScrumBoardColumn.find(session,
        where: (t) => t.scrumBoardId.equals(scrumBoardId));
  }

  Future<void> insert(Session session, ScrumBoardColumn column) async {
    //Gets max index and sets the new column to the next.
    if (column.boardIndex == null) {
      var i = await ScrumBoardColumn.findSingleRow(session,
          where: (p0) => p0.scrumBoardId.equals(column.scrumBoardId),
          orderBy: ScrumBoardColumn.t.boardIndex,
          orderDescending: true);
      if (i == null || i.boardIndex == null) {
        column.boardIndex = 0;
      } else {
        session.log(i.boardIndex!.toString());
        column.boardIndex = i.boardIndex! + 1;
      }
    }
    await ScrumBoardColumn.insert(session, column);
  }
}
