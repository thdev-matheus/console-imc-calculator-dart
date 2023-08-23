import 'dart:async';
import 'dart:io';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:imc_calculator_dart/exceptions/exceptions.dart';
import 'package:imc_calculator_dart/utils/utils.dart';

import '../mocks.dart';

Future<String> getTextReply(String text, Stdin stdin, Stdout stdout) async {
  do {
    try {
      stdout.write(text);
      String line = stdin.readLineSync() ?? '';

      if (line.isEmpty) {
        throw VoidException();
      }

      return line;
    } on VoidException {
      stdout.write(ColorText.red(VoidException().toString()));
      await Time.sleep(1);

      stdout.write(ColorText.red('Vamos tentar novamente...'));
      await Time.sleep(2);
    }
  } while (true);
}

Future<double> getDoubleReply(String text, Stdin stdin, Stdout stdout) async {
  do {
    try {
      stdout.write(text);
      double? line = double.tryParse(stdin.readLineSync() ?? '');

      if (line == null) {
        throw DoubleException();
      }

      return line;
    } on DoubleException {
      stdout.write(ColorText.red(DoubleException().toString()));
      await Time.sleep(1);

      stdout.write(ColorText.red('Por exemplo: 68.7'));
      await Time.sleep(1);

      stdout.write(ColorText.red('Vamos tentar novamente...'));
      await Time.sleep(2);
    }
  } while (true);
}

Future<void> showLoad(String text, Stdout stdout) async {
  await Time.sleep(1);
  stdout.write(ColorText.yellow(text));
  await Time.sleep(1);
  stdout.write(ColorText.yellow('.'));
  await Time.sleep(1);
  stdout.write(ColorText.yellow('.'));
  await Time.sleep(1);
  stdout.write(ColorText.yellow('.'));
  await Time.sleep(1);

  return;
}

void main() {
  group('Método de input de texto do Console', () {
    test('Repete o input quando a entrada é vazia', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder(['', input]);
      await getTextReply(text, mockStdin, mockStdout);

      verify(mockStdout.write(text)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Retorna uma entrada válida', () async {
      when(mockStdin.readLineSync()).thenReturn(input);

      String result = await getTextReply(text, mockStdin, mockStdout);

      verify(mockStdin.readLineSync());
      expect(result, equals(input));
      verify(mockStdout.write(text));
    });
  });

  group('Método de Input de Double do Console', () {
    test('Repete o input quando a entrada é vazia', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder(['', inputDouble]);

      await getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Repete o input quando a entrada é um texto', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder([input, inputDouble]);

      await getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Retorna uma entrada válida', () async {
      when(mockStdin.readLineSync()).thenReturn(inputDouble);

      double result = await getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble));
      verify(mockStdin.readLineSync()).called(1);
      expect(result, double.parse(inputDouble));
    });
  });

  group('Método Show Load', () {
    test('Saída correta no console', () async {
      await showLoad(text, mockStdout);

      verify(mockStdout.write(ColorText.yellow(text))).called(1);
      verify(mockStdout.write(ColorText.yellow('.'))).called(3);
    });
  });
}
