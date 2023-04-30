sealed class Either<K, V> {}

class Left<K, V> extends Either<K, V> {
  final K value;

  Left(this.value);
}

class Right<K, V> extends Either<K, V> {
  final V value;

  Right(this.value);
}

Either<K, V> left<K, V>(K value) => Left(value);

Either<K, V> right<K, V>(V value) => Right(value);
