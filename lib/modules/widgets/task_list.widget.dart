import 'package:flutter/material.dart';
import 'package:todo_list/modules/widgets/task_item.widget.dart';

class TaskListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> taskItems;

  const TaskListWidget({
    super.key,
    required this.taskItems,
  });

  @override
  Widget build(BuildContext context) {
    if (taskItems.isEmpty) {
      return Center(
        child: Text(
          'No tasks available.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Container(
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
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
