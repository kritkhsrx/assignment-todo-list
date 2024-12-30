part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class UpdateTodoStatusEvent extends TodoEvent {
  final int index;
  final String newStatus;

  UpdateTodoStatusEvent(this.index, this.newStatus);
}
