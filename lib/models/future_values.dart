/// FutureValue is a sealed class that can be used to represent the state of a
/// Future. It has three subtypes: [Loading], [Success], and [Error].
sealed class FutureValues<T> {}

/// [Loading] is used to repsent the state of a Future when it is in progress.
class Loading<T> extends FutureValues<T> {}

/// [Success] is used to repsent the state of a Future when it is completed
class Success<T> extends FutureValues<T> {
  final T value;

  Success(this.value);
}

/// [Error] is used to repsent the state of a Future when it has failed.
class Error<T> extends FutureValues<T> {
  final String message;

  Error(this.message);
}
