part of 'scrum_board_column_bloc.dart';

abstract class ScrumBoardColumnState {
  final ScrumBoardColumnDTO column;
  ScrumBoardColumnState(this.column);
}

class ScrumBoardColumnInitial extends ScrumBoardColumnState {
  ScrumBoardColumnInitial(ScrumBoardColumnDTO column) : super(column);
}
