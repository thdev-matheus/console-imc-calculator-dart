// import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/utils/color_text.dart';
import 'package:imc_calculator_dart/utils/console.dart';
import 'package:imc_calculator_dart/utils/time.dart';

class IMCCalculator {
  static Future<void> start() async {
    await hello();

    Person person = await form();

    await showResult(person);

    await farewell();
  }

  static Future<void> hello() async {
    print('Bem-vindo(a) à calculadora de IMC.');
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
    String name = await Console.getTextReply('Digite o seu nome: ');
    Console.blankSpace(1);
    await Console.showLoad('Carregando...');

    print('=*=' * 10);
    print('Olá, $name.');
    await Time.sleep(1);
    print('É muito bom ter você aqui.');
    print('=*=' * 10);
    await Time.sleep(2);
    Console.blankSpace(2);

    double weight = await Console.getDoubleReply('Digite aqui o seu peso: ');
    Console.blankSpace(1);
    await Console.showLoad('Salvando...');

    double height = await Console.getDoubleReply('Digite a sua altura: ');
    Console.blankSpace(1);
    await Console.showLoad('Salvando...');

    return Person(
      name: name,
      weight: weight,
      height: height,
    );
  }

  static Future<void> showResult(Person person) async {
    print('=*=' * 10);
    await Time.sleep(1);
    print('Nome: ${person.getName()}.');
    await Time.sleep(1);
    print('Peso: ${person.getWeight()}.');
    await Time.sleep(1);
    print('Altura: ${person.getHeight()}.');
    await Time.sleep(1);
    print('IMC: ${person.getImc()}.');
    await Time.sleep(1);
    print(person.getMessage()); //mensagem
    print('=*=' * 10);
    Console.blankSpace(2);
    await Time.sleep(2);
  }

  static Future<void> farewell() async {
    print('Bom, é isso.');
    await Time.sleep(1);
    print('Muito obrigado por utilizar a calculadora IMC');
    await Time.sleep(1);
    print('Siga o desenvolvedor no Linkedin:');
    await Time.sleep(1);
    print('https://www.linkedin.com/in/th-matheus/');
    await Time.sleep(1);
  }
}
