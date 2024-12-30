import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/bloc/todo_list/todo_bloc.dart';
import 'package:todo_list/modules/widgets/task_item.widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoInitial || state is TodoLoading) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        } else if (state is TodoLoaded) {
          final taskItems = state.todos;

          if (taskItems.isEmpty) {
            return const Expanded(
                child: Center(child: (Text('No tasks available.'))));
          }

          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'TODAY\'S TASK',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF858585),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: taskItems.length,
                        itemBuilder: (context, index) {
                          final task = taskItems[index];
                          return TaskItem(
                            key: Key('task_item_$index'),
                            title: task['title'],
                            description: task['description'],
                            createdAt: DateTime.parse(task['createdAt']),
                            status: task['status'],
                            index: index, // ส่ง index ไปยัง TaskItem
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is TodoError) {
          return const Center(child: Text('Failed to load tasks.'));
        } else {
          return const Center(child: Text('Something went wrong.'));
        }
      },
    );
  }
}
