// import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/utils/utils.dart';

class IMCCalculator {
  static Future<void> start() async {
    await hello();

    Person person = await form();

    await showResult(person);

    await farewell();
  }

  static Future<void> hello() async {
    print('Bem-vindo(a) à ${ColorText.magenta('Calculadora de IMC')}.');
    await Time.sleep(1);
    print(
        'Eu me chamo ${ColorText.cyan('Theus')} e vou te ajudar neste processo.');
    await Time.sleep(2);
    Console.blankSpace(2);

    print('Para começarmos, pedirei alguns dados a você');
    await Time.sleep(1);
    print('e é muito importante que você seja o mais exato(a) possível, ok?');
    await Time.sleep(2);
    print('Vamos começar?');
    await Time.sleep(2);
    Console.blankSpace(2);
  }

  static Future<Person> form() async {
    String name = await Console.getTextReply(
        'Digite o seu ${ColorText.yellow('nome')}: ');
    Console.blankSpace(1);
    await Console.showLoad('Carregando...');

    print(ColorText.green('=*=') * 10);
    print(ColorText.green('Olá, $name.'));
    await Time.sleep(1);
    print(ColorText.green('É muito bom ter você aqui.'));
    print(ColorText.green('=*=') * 10);
    await Time.sleep(2);
    Console.blankSpace(2);

    double weight = await Console.getDoubleReply(
        'Digite aqui o seu ${ColorText.yellow('peso')}: ');
    Console.blankSpace(1);
    await Console.showLoad('Salvando...');

    double height = await Console.getDoubleReply(
        'Digite a sua ${ColorText.yellow('altura')}: ');
    Console.blankSpace(1);
    await Console.showLoad('Salvando...');

    return Person(
      name: name,
      weight: weight,
      height: height,
    );
  }

  static Future<void> showResult(Person person) async {
    print(ColorText.green('Resultado'));
    await Time.sleep(1);

    print(ColorText.green('=*=') * 10);
    await Time.sleep(1);

    print('${ColorText.cyan('Nome:')} ${ColorText.yellow(person.getName())}.');
    await Time.sleep(1);

    print(
        '${ColorText.cyan('Peso:')} ${ColorText.yellow(person.getWeight().toString())}.');
    await Time.sleep(1);

    print(
        '${ColorText.cyan('Altura:')} ${ColorText.yellow(person.getHeight().toString())}.');
    await Time.sleep(1);

    print(
        '${ColorText.cyan('IMC:')} ${ColorText.yellow(person.getImc().toString())}.');
    await Time.sleep(1);

    print(ColorText.magenta(person.getMessage()));

    print(ColorText.green('=*=') * 10);

    Console.blankSpace(2);
    await Time.sleep(2);
  }

  static Future<void> farewell() async {
    print(ColorText.yellow('Bom, é isso.'));
    await Time.sleep(1);
    print(ColorText.yellow(
        'Muito obrigado por utilizar a ${ColorText.magenta('Calculadora de IMC')}.'));
    await Time.sleep(1);
    print(ColorText.yellow('Siga o desenvolvedor no Linkedin:'));
    await Time.sleep(1);
    print(ColorText.cyan('https://www.linkedin.com/in/th-matheus/'));
    await Time.sleep(1);
  }
}
