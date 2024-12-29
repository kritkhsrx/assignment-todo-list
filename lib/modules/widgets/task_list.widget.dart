import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/modules/widgets/task_item.widget.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  final List<Map<String, dynamic>> taskItems = [
    {
      'title': 'Meeting with client',
      'description': 'Discuss about the project',
      'createdAt': '2024-12-25T05:05:36',
      'status': ProgressConstants.done,
    },
    {
      'title': 'Design review',
      'description': 'Review the design with the team',
      'createdAt': '2024-12-25T11:04:36',
      'status': ProgressConstants.active,
    },
    {
      'title': 'Development session',
      'description': 'Work on Flutter tasks',
      'createdAt': '2024-12-26T19:44:36',
      'status': ProgressConstants.active,
    },
    {
      'title': 'Submit report',
      'description': 'Complete and send report to manager',
      'createdAt': '2024-12-30T11:07:36',
      'status': ProgressConstants.active,
    },
    {
      'title': 'Brainstorming ideas',
      'description': 'Discuss new marketing strategies',
      'createdAt': '2024-12-28T21:11:36',
      'status': ProgressConstants.done,
    },
  ];

  @override
  Widget build(BuildContext context) {
    taskItems.sort((a, b) {
      const statusPriority = {
        ProgressConstants.active: 1,
        ProgressConstants.done: 2,
      };
      final statusA = statusPriority[a['status']]!;
      final statusB = statusPriority[b['status']]!;

      if (statusA != statusB) {
        return statusA.compareTo(statusB);
      }
      final dateA = DateTime.parse(a['createdAt']);
      final dateB = DateTime.parse(b['createdAt']);
      return dateB.compareTo(dateA);
    });

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('TODAY\'S TASK',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF858585),
                    fontSize: 14)),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
