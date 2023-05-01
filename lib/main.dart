import 'package:dart_3/models/todo.dart';
import 'package:dart_3/notifiers/todo_notifier.dart';
import 'package:dart_3/repository/todo_repository.dart';
import 'package:flutter/material.dart';

import 'models/future_values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _todoNotifier = TodoNotifier(TodoRepository());
  @override
  void initState() {
    _todoNotifier.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart 3 : Todo app"),
      ),
      body: ValueListenableBuilder<FutureValues<List<Todo>>>(
          valueListenable: _todoNotifier,
          builder: (context, value, child) {
            // switch will automatically ask you to cover all the cases of [FutureValues]
            switch (value) {
              // This is how we can use pattern matching in Dart, will be covered in coming blogs.
              // Loading() => _buildLoading(),
              // Error(message: var error) => _buildError(error),
              // Success(value: var value) => _buildSuccess(value),
              case Loading():
                return _buildLoading();
              case Error():
                return _buildError(value.message);
              case Success():
                return _buildSuccess(value.value);
            }
          }),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildSuccess(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            todos[index].title,
            style: TextStyle(
              decoration: todos[index].completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: todos[index].completed ? Colors.green : Colors.black,
            ),
          ),
        );
      },
    );
  }
}
