part of 'scrumboard_column_bloc.dart';

@immutable
abstract class ScrumboardColumnState {
  List<int> list;
  ScrumboardColumnState({required this.list}) {}
}

@immutable
class ScrumboardColumnInitial extends ScrumboardColumnState {
  ScrumboardColumnInitial({required super.list});
}
