// import 'package:imc_calculator_dart/models/person.dart';
import 'dart:io' as io;

import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/utils/utils.dart';

class IMCCalculator {
  static Future<void> start(io.Stdin stdin, io.Stdout stdout) async {
    await hello(stdout);

    Person person = await form(stdout, stdin);

    await showResult(person, stdout);

    await farewell(stdout);
  }

  static Future<void> hello(io.Stdout stdout) async {
    stdout
        .writeln('Bem-vindo(a) à ${ColorText.magenta('Calculadora de IMC')}.');
    await Time.sleep(1);
    stdout.writeln(
        'Eu me chamo ${ColorText.cyan('Theus')} e vou te ajudar neste processo.');
    await Time.sleep(2);
    Console.blankSpace(2, stdout);

    stdout.writeln('Para começarmos, pedirei alguns dados a você');
    await Time.sleep(1);
    stdout.writeln(
        'e é muito importante que você seja o mais exato(a) possível, ok?');
    await Time.sleep(2);
    stdout.writeln('Vamos começar?');
    await Time.sleep(2);
    Console.blankSpace(2, stdout);
  }

  static Future<Person> form(io.Stdout stdout, io.Stdin stdin) async {
    String name = await Console.getTextReply(
        'Digite o seu ${ColorText.yellow('nome')}: ', stdin, stdout);
    Console.blankSpace(1, stdout);
    await Console.showLoad('Carregando', stdout);

    stdout.writeln(ColorText.green('=*=') * 10);
    stdout.writeln(ColorText.green('Olá, $name.'));
    await Time.sleep(1);
    stdout.writeln(ColorText.green('É muito bom ter você aqui.'));
    stdout.writeln(ColorText.green('=*=') * 10);
    await Time.sleep(2);
    Console.blankSpace(2, stdout);

    double weight = await Console.getDoubleReply(
        'Digite aqui o seu ${ColorText.yellow('peso')}: ', stdin, stdout);
    Console.blankSpace(1, stdout);
    await Console.showLoad('Salvando', stdout);

    double height = await Console.getDoubleReply(
        'Digite a sua ${ColorText.yellow('altura')}: ', stdin, stdout);
    Console.blankSpace(1, stdout);
    await Console.showLoad('Salvando', stdout);

    return Person(
      name: name,
      weight: weight,
      height: height,
    );
  }

  static Future<void> showResult(Person person, io.Stdout stdout) async {
    stdout.writeln(ColorText.green('Resultado'));
    await Time.sleep(1);

    stdout.writeln(ColorText.green('=*=') * 10);
    await Time.sleep(1);

    stdout.writeln(
        '${ColorText.cyan('Nome:')} ${ColorText.yellow(person.getName())}.');
    await Time.sleep(1);

    stdout.writeln(
        '${ColorText.cyan('Peso:')} ${ColorText.yellow(person.getWeight().toString())}.');
    await Time.sleep(1);

    stdout.writeln(
        '${ColorText.cyan('Altura:')} ${ColorText.yellow(person.getHeight().toString())}.');
    await Time.sleep(1);

    stdout.writeln(
        '${ColorText.cyan('IMC:')} ${ColorText.yellow(person.getImc().toString())}.');
    await Time.sleep(1);

    stdout.writeln(ColorText.magenta(person.getMessage()));

    stdout.writeln(ColorText.green('=*=') * 10);

    Console.blankSpace(2, stdout);
    await Time.sleep(2);
  }

  static Future<void> farewell(io.Stdout stdout) async {
    stdout.writeln(ColorText.yellow('Bom, é isso.'));
    await Time.sleep(1);
    stdout.writeln(ColorText.yellow(
        'Muito obrigado por utilizar a ${ColorText.magenta('Calculadora de IMC')}.'));
    await Time.sleep(1);
    stdout.writeln(ColorText.yellow('Siga o desenvolvedor no Linkedin:'));
    await Time.sleep(1);
    stdout.writeln(ColorText.cyan('https://www.linkedin.com/in/th-matheus/'));
    await Time.sleep(1);
  }
}
