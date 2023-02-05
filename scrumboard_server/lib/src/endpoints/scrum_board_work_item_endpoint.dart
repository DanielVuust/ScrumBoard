import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardWorkItemEndpoint extends Endpoint {
  Future<void> delete(Session session, int id) async {
    await ScrumBoardWorkItem.delete(session, where: (x) => x.id.equals(id));
  }

  Future<void> insert(Session session, ScrumBoardWorkItem workItem) async {
    await ScrumBoardWorkItem.insert(session, workItem);
  }

  Future<void> updateColumnWorkItems(Session session, int workItemId,
      int movedToColumnId, int movedToColumnIndex) async {
    var result = await session.db.transaction((transaction) async {
      var workItem = await ScrumBoardWorkItem.findById(session, workItemId);
      if (workItem == null) {
        return null;
      }

      var workItems = await ScrumBoardWorkItem.find(session, where: (t) {
        return ((t.columnIndex >= movedToColumnIndex) & (t.scurmBoardColumnId.equals(movedToColumnId)));
      });
      for (var element in workItems) {
        element.setColumn("columnIndex", element.columnIndex! + 1);
        await session.db.update(element);
      }

      workItem.setColumn("scurmBoardColumnId", movedToColumnId);
      workItem.setColumn("columnIndex", movedToColumnIndex);

      await session.db.update(workItem);
    });
    return result;
  }
  
}
