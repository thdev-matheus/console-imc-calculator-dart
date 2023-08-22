// imc = peso / altura²
import 'dart:math' as math;
import 'package:imc_calculator_dart/enum/status.dart';

class Person {
  late String _name;
  late double _weight;
  late double _height;
  late double _imc;
  late Status _status;

  void setName(String name) {
    _name = name;
  }

  String getName() => _name;

  void setWeight(double weight) {
    _weight = weight;
  }

  double getWeight() => _weight;

  void setHeight(double height) {
    _height = height;
  }

  double getHeight() => _height;

  void setImc() {
    _imc = calculateImc(getWeight(), getHeight());
  }

  double getImc() => _imc;

// < 16 Magreza grave
// 16 a < 17 Magreza moderada
// 17 a < 18,5 Magreza leve
// 18,5 a < 25 Saudável
// 25 a < 30 Sobrepeso
// 30 a < 35 Obesidade grau 1
// 35 a < 40 Obesidade grau 2 (severa)
// >= 40 Obesidade grau 2 (mórbida)
  void setStatus() {
    switch (_imc) {
      case < 16:
        _status = Status.severeThinness;
        break;
      case >= 16 && < 17:
        _status = Status.moderateThinness;
        break;
      case >= 17 && < 18.5:
        _status = Status.lightThiness;
        break;
      case >= 18.5 && < 25:
        _status = Status.healthy;
        break;
      case >= 25 && < 30:
        _status = Status.overweight;
        break;
      case >= 30 && < 35:
        _status = Status.obesity1;
        break;
      case >= 35 && < 40:
        _status = Status.obesity2;
        break;
      case >= 40:
        _status = Status.obesity3;
        break;
    }
  }

  String getStatus() {
    switch (_status) {
      case Status.severeThinness:
        return 'Magreza Grave';
      case Status.moderateThinness:
        return 'Magreza Moderada';
      case Status.lightThiness:
        return 'Magreza Leve';
      case Status.healthy:
        return 'Saldável';
      case Status.overweight:
        return 'Sobrepeso';
      case Status.obesity1:
        return 'Obesidade Grau 1';
      case Status.obesity2:
        return 'Obesidade Grau 2';
      case Status.obesity3:
        return 'Obesidade Grau 3';
    }
  }

  double calculateImc(double weight, double height) =>
      weight / (math.pow(height, 2));

  Person({
    required String name,
    required double weight,
    required double height,
  }) {
    setName(name);
    setHeight(height);
    setWeight(weight);
    setImc();
    setStatus();
  }
}
