import 'dart:io' as io;
import 'package:imc_calculator_dart/exceptions/exceptions.dart';
import 'package:imc_calculator_dart/utils/utils.dart';

class Console {
  static Future<String> getTextReply(
    String text,
    io.Stdin stdin,
    io.Stdout stdout,
  ) async {
    do {
      try {
        stdout.write(text);
        String line = stdin.readLineSync() ?? '';

        if (line.isEmpty) {
          throw VoidException();
        }

        return line;
      } on VoidException {
        stdout.writeln(ColorText.red(VoidException().toString()));
        await Time.sleep(1);

        stdout.writeln(ColorText.red('Vamos tentar novamente...'));
        await Time.sleep(2);
      }
    } while (true);
  }

  static Future<double> getDoubleReply(
    String text,
    io.Stdin stdin,
    io.Stdout stdout,
  ) async {
    do {
      try {
        stdout.write(text);
        double? line = double.tryParse(stdin.readLineSync() ?? '');

        if (line == null) {
          throw DoubleException();
        }

        return line;
      } on DoubleException {
        stdout.writeln(ColorText.red(DoubleException().toString()));
        await Time.sleep(1);

        stdout.writeln(ColorText.red('Por exemplo: 68.7'));
        await Time.sleep(1);

        stdout.writeln(ColorText.red('Vamos tentar novamente...'));
        await Time.sleep(2);
      }
    } while (true);
  }

  static Future<void> showLoad(
    String text,
    io.Stdout stdout,
  ) async {
    await Time.sleep(1);
    stdout.write(ColorText.yellow(text));
    await Time.sleep(1);
    stdout.write(ColorText.yellow('.'));
    await Time.sleep(1);
    stdout.write(ColorText.yellow('.'));
    await Time.sleep(1);
    stdout.writeln(ColorText.yellow('.'));
    await Time.sleep(1);
    stdout.writeln('');
  }

  static void blankSpace(int lines, io.Stdout stdout) {
    for (var i = 0; i < lines; i++) {
      stdout.writeln('');
    }
  }
}
