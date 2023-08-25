import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/utils/src/color_text.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:imc_calculator_dart/app/imc_calculator.dart';
import '../mocks.dart';

void main() {
  group('Classe IMCCalculator - Método farewell - ', () {
    test('Exibição correta no console', () async {
      await IMCCalculator.farewell(mockStdout);

      verify(mockStdout.writeln(ColorText.yellow('Bom, é isso.'))).called(1);
      verify(mockStdout.writeln(ColorText.yellow(
              'Muito obrigado por utilizar a ${ColorText.magenta('Calculadora de IMC')}.')))
          .called(1);
      verify(mockStdout
              .writeln(ColorText.yellow('Siga o desenvolvedor no Linkedin:')))
          .called(1);
      verify(mockStdout.writeln(
              ColorText.cyan('https://www.linkedin.com/in/th-matheus/')))
          .called(1);
    });
  });

  group('Classe IMCCalculator - Método showResult - ', () {
    test('Exibição de resultado esperado', () async {
      await IMCCalculator.showResult(person, mockStdout);

      verify(mockStdout.writeln(ColorText.green('Resultado'))).called(1);
      verify(mockStdout.writeln(ColorText.green('=*=') * 10)).called(2);
      verify(mockStdout.writeln(
              '${ColorText.cyan('Nome:')} ${ColorText.yellow(person.getName())}.'))
          .called(1);
      verify(mockStdout.writeln(
              '${ColorText.cyan('Peso:')} ${ColorText.yellow(person.getWeight().toString())}.'))
          .called(1);
      verify(mockStdout.writeln(
              '${ColorText.cyan('Altura:')} ${ColorText.yellow(person.getHeight().toString())}.'))
          .called(1);
      verify(mockStdout.writeln(
              '${ColorText.cyan('IMC:')} ${ColorText.yellow(person.getImc().toString())}.'))
          .called(1);
      verify(mockStdout.writeln(ColorText.magenta(person.getMessage())))
          .called(1);
      verify(mockStdout.writeln('')).called(2);
    });
  });

  group('Classe IMCCalculator - Método form - ', () {
    when(mockStdin.readLineSync()).thenReturnInOrder([
      personData['name'],
      personData['weight'].toString(),
      personData['height'].toString(),
      personData['name'],
      personData['weight'].toString(),
      personData['height'].toString(),
    ]);

    test('Exibição de formulário', () async {
      await IMCCalculator.form(
        mockStdout,
        mockStdin,
      );

      verify(mockStdout.writeln(ColorText.green('=*=') * 10)).called(2);
      verify(mockStdout.writeln(ColorText.green('Olá, ${personData['name']}.')))
          .called(1);
      verify(mockStdout.writeln(ColorText.green('É muito bom ter você aqui.')))
          .called(1);
    });

    test('Retorno correto', () async {
      Person response = await IMCCalculator.form(
        mockStdout,
        mockStdin,
      );

      expect(response.runtimeType, Person);
      expect(response.getName(), person.getName());
      expect(response.getWeight(), person.getWeight());
      expect(response.getHeight(), person.getHeight());
      expect(response.getImc(), person.getImc());
      expect(response.getMessage(), person.getMessage());
      expect(response.getStatus(), person.getStatus());
    });
  });

  group('Classe IMCCalculator - Método hello - ', () {
    test('Exibição correta no console', () async {
      await IMCCalculator.hello(mockStdout);

      verify(mockStdout.writeln(
              'Bem-vindo(a) à ${ColorText.magenta('Calculadora de IMC')}.'))
          .called(1);
      verify(mockStdout.writeln(
              'Eu me chamo ${ColorText.cyan('Theus')} e vou te ajudar neste processo.'))
          .called(1);
      verify(mockStdout.writeln('Para começarmos, pedirei alguns dados a você'))
          .called(1);
      verify(mockStdout.writeln(
              'e é muito importante que você seja o mais exato(a) possível, ok?'))
          .called(1);
      verify(mockStdout.writeln('Vamos começar?')).called(1);
    });
  });
}
