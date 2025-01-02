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
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: _buildBody(context, state),
              ),
            ),
            floatingActionButton: _buildFloatingActionButton(state),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, TodoState state) {
    if (state is TodoLoading || state is TodoInitial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TodoLoaded) {
      return Column(
        children: [
          const WelcomeTodoListWidget(
            key: GlobalObjectKey('welcome_todo_list_widget'),
            initialTitle: WelcomeConstants.defaultWelcome,
            initialName: WelcomeConstants.defaultName,
          ),
          const SizedBox(height: 26),
          const ProgressCardWidget(
            key: GlobalObjectKey('todo_progress_bar_widget'),
          ),
          const SizedBox(height: 26),
          Expanded(
            child: TaskListWidget(
              key: const GlobalObjectKey('task_list_widget'),
              taskItems: state.todos,
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text('Failed to load tasks.'),
      );
    }
  }

  Widget _buildFloatingActionButton(TodoState state) {
    if (state is TodoLoading || state is TodoInitial) {
      return const SizedBox.shrink();
    } else {
      return SizedBox(
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
      );
    }
  }
}
