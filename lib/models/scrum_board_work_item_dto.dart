import 'package:scrumboard/models/user_dto.dart';

class ScrumBoardWorkItemDTO {
  int id;
  String name;
  String description;
  UserDTO? responsibleUser;

  ScrumBoardWorkItemDTO(this.id, this.name, this.description,
      [this.responsibleUser]);
}
