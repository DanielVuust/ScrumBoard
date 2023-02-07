part of 'scrum_board_bloc.dart';

abstract class ScrumBoardState {
  late ScrumBoard scrumBoard = ScrumBoard();
  late List<User> assignableUsers = [];
}

class ScrumBoardInitial extends ScrumBoardState {
}
