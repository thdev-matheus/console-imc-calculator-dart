import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:imc_calculator_dart/utils/utils.dart';

import '../mocks.dart';

void main() {
  group('Classe Console - Método de input de Texto - ', () {
    test('Repete o input quando a entrada é vazia', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder(['', input]);
      await Console.getTextReply(text, mockStdin, mockStdout);

      verify(mockStdout.write(text)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Retorna uma entrada válida', () async {
      when(mockStdin.readLineSync()).thenReturn(input);

      String result = await Console.getTextReply(text, mockStdin, mockStdout);

      verify(mockStdin.readLineSync());
      expect(result, equals(input));
      verify(mockStdout.write(text));
    });
  });

  group('Classe Console - Método de input de double - ', () {
    test('Repete o input quando a entrada é vazia', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder(['', inputDouble]);

      await Console.getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Repete o input quando a entrada é um texto', () async {
      when(mockStdin.readLineSync()).thenReturnInOrder([input, inputDouble]);

      await Console.getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble)).called(2);
      verify(mockStdin.readLineSync()).called(2);
    });

    test('Retorna uma entrada válida', () async {
      when(mockStdin.readLineSync()).thenReturn(inputDouble);

      double result =
          await Console.getDoubleReply(textDouble, mockStdin, mockStdout);

      verify(mockStdout.write(textDouble));
      verify(mockStdin.readLineSync()).called(1);
      expect(result, double.parse(inputDouble));
    });
  });

  group('Classe Console - Método Show Load - ', () {
    test('Saída correta no console', () async {
      await Console.showLoad(text, mockStdout);

      verify(mockStdout.write(ColorText.yellow(text))).called(1);
      verify(mockStdout.write(ColorText.yellow('.'))).called(2);
      verify(mockStdout.writeln(ColorText.yellow('.'))).called(1);
      verify(mockStdout.writeln('')).called(1);
    });
  });
}
