import 'package:todo_bloc/domain/models/todo_model.dart';

abstract class TodoRepo {
  // -> Get list of todos
  Future<List<Todo>> getTodos();

  // -> Add a new todo
  Future<void> addTodo(Todo newTodo);

  // -> Update an existing todo
  Future<void> updateTodo(Todo todo);

  // -> Delete a todo
  Future<void> deleteTodo(Todo todo);
}

/* 
Notes: 
-> The repo in the domain layer outlines what operations the app can do,
but doesn't worry about the specific implementation details. That's for the data layer.

-> Technology agnostic: independent of any technology or framework
*/