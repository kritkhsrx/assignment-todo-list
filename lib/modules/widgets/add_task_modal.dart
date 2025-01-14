import 'package:flutter/material.dart';

class AddTaskModal extends StatelessWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 80.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40.0,
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
        const TextField(
          cursorColor: Color(0xFF858585),
          decoration: InputDecoration(
            hintText: 'Create a new task',
            hintStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF858585),
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
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
        const TextField(
          cursorColor: Color(0xFF858585),
          decoration: InputDecoration(
            hintText: 'Add a description',
            hintStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF858585),
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
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
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
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
