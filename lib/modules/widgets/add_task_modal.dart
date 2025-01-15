import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_list/todo_bloc.dart';
import 'package:todo_list/constants.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(_onTaskNameChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onTaskNameChanged() {
    print('Task Name: ${_taskNameController.text}');
  }

  void _onDescriptionChanged() {
    print('Description: ${_descriptionController.text}');
  }

  Future<void> _handleCreateTask() async {
    if (_taskNameController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Cannot create task with empty fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final newTask = {
      'title': _taskNameController.text,
      'description': _descriptionController.text,
      'createdAt': DateTime.now().toIso8601String(),
      'status': ProgressConstants.active,
    };
    //  "title": "Client feedback",
    // "description": "Gather feedback on the current build",
    // "createdAt": "2024-12-31T13:30:36",
    // "status": "done"

    print(newTask);
    context.read<TodoBloc>().add(AddTodo(newTask));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 80.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 60.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const Spacer(),
          const SizedBox(height: 30),
          _buildTaskNameField(),
          const SizedBox(height: 30),
          _buildDescriptionField(),
          const Spacer(),
          _buildCreateButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Today\'s Task',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          iconSize: 28.0,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      children: [
        TextField(
          controller: _taskNameController,
          cursorColor: const Color(0xFF858585),
          decoration: const InputDecoration(
            hintText: 'Create a new task',
            hintStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF858585),
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 1),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat_Normal',
          ),
        ),
        Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: const Color(0xFF0575F3),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Column(
      children: [
        TextField(
          controller: _descriptionController,
          cursorColor: const Color(0xFF858585),
          decoration: const InputDecoration(
            hintText: 'Add a description',
            hintStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF858585),
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 1),
            fontSize: 20.0,
            fontFamily: 'Montserrat_Normal',
          ),
        ),
        Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: const Color(0xFF0575F3),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 213,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFF0575F3),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0575F3).withOpacity(0.43),
              offset: const Offset(0, 5),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _handleCreateTask,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text(
            'Create Task',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
