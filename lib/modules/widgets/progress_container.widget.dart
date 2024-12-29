// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/modules/widgets/progress_bar.widget.dart';

class ProgressCardWidget extends StatefulWidget {
  const ProgressCardWidget({super.key});

  @override
  _ProgressCardWidgetState createState() => _ProgressCardWidgetState();
}

class _ProgressCardWidgetState extends State<ProgressCardWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ProgressContainer(
              text: ProgressConstants.pendingTitle,
              status: ProgressConstants.active,
              totalTask: 5,
              numberOfTask: 3,
            ),
          ),
          SizedBox(width: 26),
          Expanded(
            child: ProgressContainer(
              text: ProgressConstants.doneTitle,
              status: ProgressConstants.done,
              totalTask: 5,
              numberOfTask: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressContainer extends StatelessWidget {
  final String text;
  final String status;
  final int totalTask;
  final int numberOfTask;

  const ProgressContainer({
    super.key,
    required this.text,
    required this.status,
    required this.totalTask,
    required this.numberOfTask,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor;
    Color textColor;

    backgroundColor = Colors.white;
    textColor = status == ProgressConstants.active
        ? colorScheme.primary
        : colorScheme.secondary;

    return Container(
      height: 90.0,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10.3,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$totalTask ${ProgressConstants.taskLabel}',
            style: const TextStyle(
              color: Color(0xFF858585),
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 30,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          ProgressBarWidget(
            totalTask: totalTask,
            status: status,
            numberOfTask: numberOfTask,
          ),
        ],
      ),
    );
  }
}
