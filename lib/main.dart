import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc/data/models/isar_todo.dart';
import 'package:todo_bloc/data/repository/isar_todo_repo.dart';

import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // -> Get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  // -> open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // -> Initialize the repo with Isar database
  final isarTodoRepo = IsarTodoRepo(isar);
  runApp(
    App(
      todoRepo: isarTodoRepo,
    ),
  );
}
