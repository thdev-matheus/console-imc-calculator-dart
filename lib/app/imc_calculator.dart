import 'package:imc_calculator_dart/models/person.dart';

class IMCCalculator {
  static void start() {
    Person p1 = Person(name: 'theus', weight: 74.5, height: 1.69);

    print('Calculando o IMC de ${p1.getName()}...');
    print('O IMC é de ${p1.getImc()}.');
    print('O seu status é ${p1.getStatus()}!');
  }
}
