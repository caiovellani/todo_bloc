/*
  DATABASE REPO
  -> This implements the todo repo and handles storing, retrieving, updating, deleting
  in the isar Database.

*/

import 'package:isar/isar.dart';
import 'package:todo_bloc/data/models/isar_todo.dart';
import 'package:todo_bloc/domain/models/todo_model.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;
  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    // -> fetch from DB
    final todos = await db.todoIsars.where().findAll();

    // -> Return as a list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) {
    // -> Convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    // -> So that we can store it in Isar
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // -> Convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    // -> So that we can store it in Isar
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
