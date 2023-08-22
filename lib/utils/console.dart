import 'dart:io';
import 'package:imc_calculator_dart/utils/time.dart';
import 'package:imc_calculator_dart/exceptions/double.exception.dart';

class Console {
  static String getReply(String text) {
    stdout.write(text);
    String line = stdin.readLineSync() ?? '';

    return line;
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
}
