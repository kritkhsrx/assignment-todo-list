import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';

class ProgressBarWidget extends StatelessWidget {
  final int totalTask;
  final int numberOfTask;
  final String status;

  const ProgressBarWidget({
    super.key,
    required this.totalTask,
    required this.numberOfTask,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    double progress = totalTask > 0 ? numberOfTask / totalTask.toDouble() : 0.0;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double columnWidth = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  width: progress * columnWidth,
                  height: 4,
                  decoration: BoxDecoration(
                    color: status == ProgressConstants.active
                        ? colorScheme.primary
                        : colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
