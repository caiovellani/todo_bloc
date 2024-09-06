import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';
import 'package:todo_bloc/pages/todo_view.dart';
import 'package:todo_bloc/presentation/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({
    super.key,
    required this.todoRepo,
  });

  final TodoRepo todoRepo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
