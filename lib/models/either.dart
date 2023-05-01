/// [Either] is a type that can be either [Left] or [Right].
/// It is used to represent a value of one of two possible types (a disjoint union).
/// It has two generic type parameters [K] and [V].
sealed class Either<K, V> {}

/// [Left] is a type of [Either] that can hold a value of type [K].
class Left<K, V> extends Either<K, V> {
  final K value;

  Left(this.value);
}

/// [Right] is a type of [Either] that can hold a value of type [V].
class Right<K, V> extends Either<K, V> {
  final V value;

  Right(this.value);
}

/// [left] is a helper function that returns an instance of [Left].
Either<K, V> left<K, V>(K value) => Left(value);

/// [right] is a helper function that returns an instance of [Right].
Either<K, V> right<K, V>(V value) => Right(value);
