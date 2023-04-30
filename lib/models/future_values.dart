sealed class FutureValues<T> {}

class Loading<T> extends FutureValues<T> {}

class Success<T> extends FutureValues<T> {
  final T value;

  Success(this.value);
}

class Error<T> extends FutureValues<T> {
  final String message;

  Error(this.message);
}
