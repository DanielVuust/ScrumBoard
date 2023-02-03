import 'package:scrum_board_full__flutter/models/user_dto.dart';

class ScrumBoardWorkItemDTO {
  int id;
  String name;
  String description;
  UserDTO? responsibleUser;
  int index;

  ScrumBoardWorkItemDTO(this.id, this.name, this.description,
      [this.responsibleUser, this.index = 0]);
}
