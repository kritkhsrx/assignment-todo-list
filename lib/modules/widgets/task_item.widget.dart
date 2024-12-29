import 'package:flutter/material.dart';
import '../../constants.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime createdAt;
  final String status;

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
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
          Container(
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: status == ProgressConstants.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: status == ProgressConstants.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
