import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/bloc/todo_list/todo_bloc.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime createdAt;
  final String status;
  final int index;

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.surfaceColor.withOpacity(0.25),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.read<TodoBloc>().add(UpdateTodoStatusEvent(
                  index,
                  status == ProgressConstants.done
                      ? ProgressConstants.active
                      : ProgressConstants.done));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                status == ProgressConstants.done
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: status == ProgressConstants.done
                    ? ColorConstants.secondaryColor
                    : ColorConstants.primaryColor,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat_Normal',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: status == ProgressConstants.done
                        ? Colors.grey
                        : Colors.black,
                    decoration: status == ProgressConstants.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Montserrat_Normal',
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: status == ProgressConstants.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
