import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart'; // สำหรับอ่านไฟล์ JSON
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
  }

  Future<void> _onLoadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await Future.delayed(const Duration(seconds: 3)); // หน่วงเวลา 3 วินาที
      final String response =
          await rootBundle.loadString('assets/todo_mock_data.json');
      final List<dynamic> data = json.decode(response);

      emit(TodoLoaded(data.cast<Map<String, dynamic>>()));
    } catch (error) {
      emit(TodoError('Failed to load todos: $error'));
    }
  }
}
