import 'package:scrumboard/models/scrum_board_work_item_dto.dart';

class ScrumBoardColumnDTO {
  final int id;
  final List<ScrumBoardWorkItemDTO> workItems;
  final String heading;

  ScrumBoardColumnDTO(this.id, this.workItems, this.heading);
}
