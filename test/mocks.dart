import 'dart:io';

import 'package:imc_calculator_dart/models/person.dart';
import 'package:mockito/mockito.dart';

Map<String, dynamic> personData = {
  'name': 'Theus',
  'weight': 70.2,
  'height': 1.69,
};

// model person tests

String newName = 'Matheus';
double newWeight = 74.5;
double newHeight = 1.70;

Person person = Person(
  name: personData['name'],
  weight: personData['weight'],
  height: personData['height'],
);

// console tests

class MockStdin extends Mock implements Stdin {}

class MockStdout extends Mock implements Stdout {}

MockStdin mockStdin = MockStdin();
MockStdout mockStdout = MockStdout();

String text = 'Digite o seu nome: ';
String input = personData['name'];
String textDouble = 'Digite um double: ';
String inputDouble = '15.5';
