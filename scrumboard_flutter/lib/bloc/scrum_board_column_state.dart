part of 'scrum_board_column_bloc.dart';

abstract class ScrumBoardColumnState {
  final ScrumBoardColumn column;
  ScrumBoardColumnState(this.column);
}

class ScrumBoardColumnInitial extends ScrumBoardColumnState {
  ScrumBoardColumnInitial(ScrumBoardColumn column) : super(column);
}
