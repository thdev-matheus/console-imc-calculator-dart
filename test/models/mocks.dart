import 'package:imc_calculator_dart/models/person.dart';

Map<String, dynamic> personData = {
  'name': 'Theus',
  'weight': 70.2,
  'height': 1.69,
};

String newName = 'Matheus';
double newWeight = 74.5;
double newHeight = 1.70;

Person person = Person(
  name: personData['name'],
  weight: personData['weight'],
  height: personData['height'],
);
