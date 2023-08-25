import 'package:test/test.dart';
import 'package:imc_calculator_dart/exceptions/exceptions.dart';

void main() {
  group('Classe VoidException - ', () {
    test('Retorno correto da mensagem de erro', () {
      String msg = VoidException().toString();

      expect(msg, 'Resposta vazia.');
    });
  });
}
