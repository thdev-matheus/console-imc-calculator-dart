import 'package:imc_calculator_dart/utils/utils.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  group('Classe ColorText - ', () {
    test('Retorno correto da string com caracteres de escape para cada cor',
        () {
      String textRed = ColorText.red(text);
      String textGreen = ColorText.green(text);
      String textYellow = ColorText.yellow(text);
      String textBlue = ColorText.blue(text);
      String textMagenta = ColorText.magenta(text);
      String textCyan = ColorText.cyan(text);

      expect(textRed, equals('\x1B[31m$text\x1B[0m'));
      expect(textGreen, equals('\x1B[32m$text\x1B[0m'));
      expect(textYellow, equals('\x1B[33m$text\x1B[0m'));
      expect(textBlue, equals('\x1B[34m$text\x1B[0m'));
      expect(textMagenta, equals('\x1B[35m$text\x1B[0m'));
      expect(textCyan, equals('\x1B[36m$text\x1B[0m'));
    });
  });
}
