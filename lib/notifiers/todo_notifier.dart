import 'package:dart_3/models/either.dart';
import 'package:dart_3/models/future_values.dart';
import 'package:dart_3/models/todo.dart';
import 'package:dart_3/repository/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoNotifier extends ValueNotifier<FutureValues<List<Todo>>> {
  /// Inject [TodoRepository] in the constructor.
  /// calls [super] with [Loading] as the initial value.
  TodoNotifier(this._todoRepository) : super(Loading());

  final TodoRepository _todoRepository;

  /// Fetch todos from the repository.
  /// [Either] type which we created previously is used to handle errors.
  /// changes [value] to [Loading] when the request is in progress.
  /// changes [value] to [Success] with the list of todos when the request is successful.
  /// changes [value] to [Error] with the error message when the request fails.
  void getTodos() async {
    value = Loading();
    final todoStatus = await _todoRepository.fetchTodos();
    switch (todoStatus) {
      case Right():
        value = Success(todoStatus.value);
        break;
      case Left():
        value = Error(todoStatus.value.message);
        break;
    }
  }
}
