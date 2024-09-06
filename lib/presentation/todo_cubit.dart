/*

TO DO CUBIT -> Simple state management
Each cubit is a list of todos.

 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

import '../domain/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // -> Reference todo repo
  final TodoRepo todoRepo;

  // -> Constructor initializes the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // => Load todos
  Future<void> loadTodos() async {
    // -> fetch from DB
    final todoList = await todoRepo.getTodos();

    // -> emit the fetched list as the new state
    emit(todoList);
  }

  // => Add todo
  Future<void> addTodo(String text) async {
    // -> create a new todo with unique ID
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    // -> Save the new todo to repo
    await todoRepo.addTodo(newTodo);

    // -> Re-load
    loadTodos();
  }

  // => Delete todo
  Future<void> deleteTodo(Todo todo) async {
    // -> Delete the provided todo from repo
    await todoRepo.deleteTodo(todo);

    // -> Re-load
    loadTodos();
  }

  // => Toggle todo completion status
  Future<void> toggleCompletion(Todo todo) async {
    final updatedTodo = todo.toggleCompletion();

    // -> update the todo in repo with new completion status
    await todoRepo.updateTodo(updatedTodo);

    // -> Re-load
    loadTodos();
  }
}
