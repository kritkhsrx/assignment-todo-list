import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart'; // สำหรับอ่านไฟล์ JSON
import 'package:meta/meta.dart';
import 'package:todo_list/constants.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<UpdateTodoStatusEvent>(_onUpdateTodoStatus);
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final String response =
          await rootBundle.loadString('assets/todo_mock_data.json');
      final List<dynamic> data = json.decode(response);

      final List<Map<String, dynamic>> taskItems =
          data.cast<Map<String, dynamic>>();
      TaskSorter.sortTasks(taskItems);

      emit(TodoLoaded(taskItems));
    } catch (error) {
      emit(TodoError('Failed to load todos: $error'));
    }
  }

  void _onUpdateTodoStatus(
      UpdateTodoStatusEvent event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final updatedTodos = List<Map<String, dynamic>>.from(currentState.todos);
      updatedTodos[event.index]['status'] = event.newStatus;

      TaskSorter.sortTasks(updatedTodos);

      emit(TodoLoaded(updatedTodos));
    }
  }
}

class TaskSorter {
  static void sortTasks(List<Map<String, dynamic>> taskItems) {
    taskItems.sort((a, b) {
      // const statusPriority = {
      //   ProgressConstants.active: 1,
      //   ProgressConstants.done: 2,
      // };
      // final statusA = statusPriority[a['status']]!;
      // final statusB = statusPriority[b['status']]!;

      // if (statusA != statusB) {
      //   return statusA.compareTo(statusB);
      // }
      final dateA = DateTime.parse(a['createdAt']);
      final dateB = DateTime.parse(b['createdAt']);
      return dateB.compareTo(dateA);
    });
  }
}
