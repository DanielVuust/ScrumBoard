part of 'scrumboard_column_bloc.dart';

@immutable
abstract class ScrumboardColumnEvent {}

class ScrumboardColumnAddEvent<int> extends ScrumboardColumnEvent {}

class ScrumboardColumnRemoveEvent<int> extends ScrumboardColumnEvent {}
