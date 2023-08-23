class VoidException implements Exception {
  String error() => 'Resposta vazia.';

  @override
  String toString() => error();
}
