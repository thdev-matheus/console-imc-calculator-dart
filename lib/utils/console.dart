import 'dart:io';
import 'package:imc_calculator_dart/exceptions/void.exception.dart';
import 'package:imc_calculator_dart/utils/color_text.dart';
import 'package:imc_calculator_dart/utils/time.dart';
import 'package:imc_calculator_dart/exceptions/double.exception.dart';

class Console {
  static Future<String> getTextReply(String text) async {
    do {
      try {
        stdout.write(text);
        String line = stdin.readLineSync() ?? '';

        if (line.isEmpty) {
          throw VoidException();
        }

        return line;
      } on VoidException {
        print(VoidException().toString());
        await Time.sleep(1);

        print('Vamos tentar novamente...');
        await Time.sleep(2);
      }
    } while (true);
  }

  static Future<double> getDoubleReply(String text) async {
    do {
      try {
        stdout.write(text);
        double? line = double.tryParse(stdin.readLineSync() ?? '');

        if (line == null) {
          throw DoubleException();
        }

        return line;
      } on DoubleException {
        print(DoubleException().toString());
        await Time.sleep(1);

        print('Por exemplo: 68.7');
        await Time.sleep(1);

        print('Vamos tentar novamente...');
        await Time.sleep(2);
      }
    } while (true);
  }

  static Future<void> showLoad(String text) async {
    await Time.sleep(1);
    print(ColorText.yellow(text));
    await Time.sleep(1);
    print(ColorText.yellow('.'));
    await Time.sleep(1);
    print(ColorText.yellow('.'));
    await Time.sleep(1);
    print(ColorText.yellow('.'));
    await Time.sleep(1);
  }

  static void blankSpace(int lines) {
    for (var i = 0; i < lines; i++) {
      print('');
    }
  }
}
