part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class UpdateTodoStatusEvent extends TodoEvent {
  final int index;
  final String newStatus;

  UpdateTodoStatusEvent(this.index, this.newStatus);
}

class AddTodo extends TodoEvent {
  final Map<String, dynamic> todo;
  AddTodo(this.todo);
}
