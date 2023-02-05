import 'package:scrumboard_flutter/models/scrum_board_column_dto.dart';

class ScrumBoardDTO {
  final int id;
  late final List<ScrumBoardColumnDTO>? columns;
  final String boardNickname;

  ScrumBoardDTO(this.id, this.columns, this.boardNickname);
}
