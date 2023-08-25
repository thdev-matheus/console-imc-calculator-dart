class DoubleException implements Exception {
  String error() => 'O valor informado não é do tipo double!';

  @override
  String toString() => error();
}
