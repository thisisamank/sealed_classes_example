import 'package:dart_3/models/either.dart';
import 'package:dart_3/models/future_values.dart';
import 'package:dart_3/repository/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoNotifier extends ValueNotifier<FutureValues> {
  TodoNotifier(this._todoRepository) : super(Loading());

  final TodoRepository _todoRepository;

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
