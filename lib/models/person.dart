import 'dart:math' as math;
import 'package:imc_calculator_dart/enum/status.dart';

class Person {
  late String _name;
  late double _weight;
  late double _height;
  late double _imc;
  late Status _status;
  late String _message;

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

  void setMessage(String message) {
    _message = message;
  }

  String getMessage() => _message;

  void setStatus() {
    switch (getImc()) {
      case < 16:
        _status = Status.severeThinness;
        setMessage(
            'Você possui uma magreza severa, deve procurar um nutricionista imediatamente.');
        break;
      case >= 16 && < 17:
        _status = Status.moderateThinness;
        setMessage(
            'Você possui uma magreza moderada, deve procurar um nutricionista assim que possível.');
        break;
      case >= 17 && < 18.5:
        _status = Status.lightThiness;
        setMessage(
            'Você possui uma leve magreza, deve se atentar à sua alimentação.');
        break;
      case >= 18.5 && < 25:
        _status = Status.healthy;
        setMessage(
            'Parabéns, você é saudável e está com o IMC em um excelente nível.');
        break;
      case >= 25 && < 30:
        _status = Status.overweight;
        setMessage(
            'Você está com sobrepeso, mas nada que uma boa reeducação alimentar, um corte no refri e outro no miojo não resolva');
        break;
      case >= 30 && < 35:
        _status = Status.obesity1;
        setMessage(
            'Você está com obesidade grau 1 e embora não esteja em nível alarmante, é interessante buscar ajuda de um nutricionista assim que possível.');
        break;
      case >= 35 && < 40:
        _status = Status.obesity2;
        setMessage(
            'Sinal amarelo! Você está com obesidade de grau 2 e deve procurar um nutricionista e ajuda médica imediatamente.');
        break;
      case >= 40:
        _status = Status.obesity3;
        setMessage(
            'Sinal VERMELHO! Você está com obesidade de grau 3 e esta é uma situação bastante delicada. Procure um médico imediatamente.');
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

  double calculateImc(double weight, double height) {
    double imc = weight / (math.pow(height, 2));
    String fixedImc = imc.toStringAsFixed(1);
    return double.parse(fixedImc);
  }

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
