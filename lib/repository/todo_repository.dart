import 'dart:convert';
import 'dart:io';

import 'package:dart_3/constants/endpoints.dart';
import 'package:dart_3/models/either.dart';
import 'package:dart_3/models/failure.dart';
import 'package:dart_3/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  final http.Client client = http.Client();

  /// Fetch todos from the server. Uses the `http` package.
  /// [Either] type which we created previously is used to handle errors.
  /// [K] is [Failure] and [V] is [List<Todo>].
  Future<Either<Failure, List<Todo>>> fetchTodos() async {
    try {
      final response = await client.get(Uri.parse(todosUrl));
      if (response.statusCode == 200) {
        final todos = (json.decode(response.body) as List)
            .map((e) => Todo.fromJson(json.encode(e)))
            .toList();
        return right(todos);
      } else {
        return left(Failure("Couldn't find the todo"));
      }
    } on SocketException {
      return left(Failure("No Internet Connection"));
    } on HttpException {
      return left(Failure("Couldn't find the todo"));
    } on FormatException {
      return left(Failure("Bad response format"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
