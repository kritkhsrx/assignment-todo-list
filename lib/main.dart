import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/views/todo_list.view.dart';
import 'constants.dart';
import 'package:todo_list/bloc/todo_list/todo_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodosEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: ColorConstants.primaryColor,
          secondary: ColorConstants.secondaryColor,
          error: ColorConstants.errorColor,
          surface: ColorConstants.surfaceColor,
        ),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      home: const TodoListView(),
    );
  }
}
