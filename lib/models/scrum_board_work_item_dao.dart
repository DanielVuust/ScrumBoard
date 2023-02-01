import 'package:scrumboard/models/user_dao.dart';

class ScrumBoardWorkItemDAO {
  final int id;
  final String name;
  final String description;
  final UserDAO? responsibleUser;

  ScrumBoardWorkItemDAO(
      this.id, this.name, this.description, [this.responsibleUser]);
}
