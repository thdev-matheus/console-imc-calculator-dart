import 'package:imc_calculator_dart/models/person.dart';
import 'package:test/test.dart';
import '../mocks.dart';

void main() {
  group('Classe Person', () {
    test('Criação de uma instância Person', () {
      expect(person.runtimeType, equals(Person));
    });

    test('Métodos get da instância Person', () {
      expect(person.getImc(), equals(24.6));
      expect(person.getWeight(), equals(personData['weight']));
      expect(person.getHeight(), equals(personData['height']));
      expect(person.getName(), equals(personData['name']));
      expect(person.getStatus(), equals('Saudável'));
      expect(
          person.getMessage(),
          equals(
              'Parabéns, você é saudável e está com o IMC em um excelente nível.'));
    });

    test('Métodos isolados da instância Person', () {
      expect(
        person.calculateImc(
          person.getWeight(),
          person.getHeight(),
        ),
        equals(24.6),
      );
    });

    test('Métodos set da instância Person', () {
      person.setName(newName);
      person.setWeight(newWeight);
      person.setHeight(newHeight);
      person.setImc();
      person.setStatus();

      expect(person.getName(), equals(newName));
      expect(person.getWeight(), equals(newWeight));
      expect(person.getHeight(), equals(newHeight));
      expect(person.getImc(), equals(25.8));
      expect(
          person.getMessage(),
          equals(
              'Você está com sobrepeso, mas nada que uma boa reeducação alimentar, um corte no refri e outro no miojo não resolva'));
      expect(person.getStatus(), equals('Sobrepeso'));
    });
  });
}
