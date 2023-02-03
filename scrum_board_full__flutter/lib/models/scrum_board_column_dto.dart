import 'package:scrum_board_full__flutter/models/scrum_board_work_item_dto.dart';

class ScrumBoardColumnDTO {
  final int id;
  late final List<ScrumBoardWorkItemDTO> workItems;
  final String heading;
  final int index;

  ScrumBoardColumnDTO(this.id, this.workItems, this.heading, [this.index = 0]);
}
