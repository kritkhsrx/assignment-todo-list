// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/modules/widgets/task_list.widget.dart';
import 'package:todo_list/modules/widgets/welcome_todo_list.widget.dart';
import 'package:todo_list/modules/widgets/progress_container.widget.dart';
import 'package:todo_list/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/bloc/todo_list/todo_bloc.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodosEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                WelcomeTodoListWidget(
                  key: GlobalObjectKey('welcome_todo_list_widget'),
                  initialTitle: WelcomeConstants.defaultWelcome,
                  initialName: WelcomeConstants.defaultName,
                ),
                const SizedBox(height: 26),
                Expanded(
                  child: BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is TodoLoading || state is TodoInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TodoLoaded) {
                        return Column(
                          children: [
                            ProgressCardWidget(
                              key: GlobalObjectKey('todo_progress_bar_widget'),
                            ),
                            const SizedBox(height: 26),
                            TaskListWidget(
                              key: GlobalObjectKey('task_list_widget'),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                            child: Text('Failed to load tasks.'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Material(
          elevation: 8.0,
          shape: const CircleBorder(),
          shadowColor: const Color(0xFF0575F3).withOpacity(0.42),
          child: ClipOval(
            child: Container(
              width: 64,
              height: 64,
              color: const Color(0xFF0575F3),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.addIcon,
                  width: 28,
                  height: 28,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
