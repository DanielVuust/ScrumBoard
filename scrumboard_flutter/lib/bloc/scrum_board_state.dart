part of 'scrum_board_bloc.dart';

abstract class ScrumBoardState {
  late ScrumBoard scrumBoard;
}

class ScrumBoardInitial extends ScrumBoardState {
@override
  late ScrumBoard scrumBoard = ScrumBoard();
}
