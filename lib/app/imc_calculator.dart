// import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/models/person.dart';
import 'package:imc_calculator_dart/utils/console.dart';
import 'package:imc_calculator_dart/utils/time.dart';

class IMCCalculator {
  static Future<void> start() async {
    // await hello();
    await form();
  }

  static Future<void> hello() async {
    print('Olá!');
    await Time.sleep(1);

    print('Bem-vindo(a) à calculadora de IMC.');
    await Time.sleep(2);

    print('Para começarmos, pedirei alguns dados a você');
    await Time.sleep(1);
    print('e é muito importante que você seja o mais exato(a) possível, ok?');
    await Time.sleep(2);
    print('Vamos começar?');
    await Time.sleep(2);
  }

  static Future<Person> form() async {
    // String name = Console.getReply('Para começar, digite o seu nome: ');
    // await Time.sleep(1);
    // print('Carregando');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);

    // print('=*=' * 10);
    // print('Olá, $name.');
    // await Time.sleep(1);
    // print('É muito bom ter você aqui.');
    // await Time.sleep(2);

    var weight = await Console.getDoubleReply('Digite aqui o seu peso: ');
    print(weight);
    // await Time.sleep(1);
    // print('salvando');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(2);

    // String height = Console.getReply('Ótimo, agora digite a sua altura: ');
    // await Time.sleep(1);
    // print('salvando');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);
    // print('.');
    // await Time.sleep(1);

    return Person(name: 'theus', weight: 74.5, height: 1.69);
  }
}
