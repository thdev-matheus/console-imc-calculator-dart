import 'package:test/test.dart';
import 'package:imc_calculator_dart/exceptions/exceptions.dart';

void main() {
  group('Classe DoubleException - ', () {
    test('Retorno correto da mensagem de erro', () {
      String msg = DoubleException().toString();

      expect(msg, 'O valor informado não é do tipo double!');
    });
  });
}
