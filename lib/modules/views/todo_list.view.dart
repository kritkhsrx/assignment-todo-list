// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_list/modules/widgets/task_list.widget.dart';
import 'package:todo_list/modules/widgets/welcome_todo_list.widget.dart';
import 'package:todo_list/modules/widgets/progress_container.widget.dart';
import 'package:todo_list/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ProgressCardWidget(
                key: GlobalObjectKey('todo_progress_bar_widget'),
              ),
              const SizedBox(height: 26),
              TaskListWidget(
                key: GlobalObjectKey('task_list_widget'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: Material(
          elevation: 8.0,
          shape: const CircleBorder(),
          shadowColor: const Color(0xFF0575F3).withOpacity(0.42),
          color: const Color(0xFF0575F3),
          child: InkWell(
            onTap: () {
              print('Icon Pressed!');
            },
            customBorder: const CircleBorder(),
            splashColor: Colors.white.withOpacity(0.3),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.addIcon,
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 255, 255, 255),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
