part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Map<String, dynamic>> todos;
  final int totalTask;
  final int numberOfDoneTask;
  final int numberOfActiveTask;

  TodoLoaded(this.todos)
      : totalTask = todos.length,
        numberOfDoneTask = todos
            .where((todo) => todo['status'] == ProgressConstants.done)
            .length,
        numberOfActiveTask = todos
            .where((todo) => todo['status'] == ProgressConstants.active)
            .length;
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}
