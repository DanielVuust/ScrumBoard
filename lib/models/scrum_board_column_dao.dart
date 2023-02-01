import 'package:scrumboard/models/scrum_board_work_item_dao.dart';

class ScrumBoardColumnDAO {
  final int id;
  final List<ScrumBoardWorkItemDAO> workItems;
  final String heading;

  ScrumBoardColumnDAO(this.id, this.workItems, this.heading);
}
