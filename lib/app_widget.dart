import 'package:flutter/material.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';
import 'package:todo_bloc/pages/todo_page.dart';

class App extends StatelessWidget {
  final TodoRepo todoRepo;
  const App({
    super.key,
    required this.todoRepo,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
