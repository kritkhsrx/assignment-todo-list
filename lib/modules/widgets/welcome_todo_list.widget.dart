import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';

class WelcomeTodoListWidget extends StatefulWidget {
  final String initialTitle;
  final String initialName;

  const WelcomeTodoListWidget({
    super.key,
    required this.initialTitle,
    required this.initialName,
  });

  @override
  State<WelcomeTodoListWidget> createState() => _WelcomeTodoListWidgetState();
}

class _WelcomeTodoListWidgetState extends State<WelcomeTodoListWidget> {
  late String title;
  late String name;

  @override
  void initState() {
    super.initState();
    title = widget.initialTitle;
    name = widget.initialName;
    updateName("Krit!");
  }

  void updateName(String newName,
      {String newTitle = WelcomeConstants.welcomeMessage}) {
    setState(() {
      name = newName;
      title = newTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        '$title $name!',
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
