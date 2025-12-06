// TIPO DOUBLE - Números com ponto flutuante (decimais)
// O tipo 'double' é usado para representar números reais com casas decimais
// Exemplos de notação em diferentes locales:
// 1,00 R$ 10,50 - Portuguese (Brazil) locale (usa vírgula como separador decimal)
// 1.00 $ 10.50 - English (US) locale (usa ponto como separador decimal)
// Em Dart, sempre usamos ponto (.) para escrever números double no código
// Exemplo: var preco = 10.50;

void main() {
  // ========== DECLARANDO NÚMEROS DOUBLE ==========
  
  print("========== DECLARANDO NÚMEROS DOUBLE ==========\n");
  
  // Usando 'var' - Dart infere como double
  var altura = 1.75;
  var peso = 72.5;
  var preco = 99.90;
  
  print("altura: $altura");
  print("peso: $peso");
  print("preco: $preco");
  
  // Usando tipo explícito 'double'
  double temperatura = 36.5;
  double juros = 0.05;
  double pi = 3.14159;
  
  print("\ntemperatura: $temperatura");
  print("juros: $juros");
  print("pi: $pi");
  
  // Números muito pequenos (notação científica)
  double microsegundo = 0.000001;
  double notacaoCientifica = 1.5e-6;  // 1.5 × 10^-6
  
  print("\nmicrosegundo: $microsegundo");
  print("notação científica (1.5e-6): $notacaoCientifica");
  
  // Números muito grandes (notação científica)
  double milhoes = 1.5e6;  // 1.5 × 10^6 = 1.500.000
  double bilhoes = 2.7e9;  // 2.7 × 10^9 = 2.700.000.000
  
  print("\nmilhões (1.5e6): $milhoes");
  print("bilhões (2.7e9): $bilhoes");

  // ========== OPERAÇÕES ARITMÉTICAS COM DOUBLE ==========
  
  print("\n========== OPERAÇÕES ARITMÉTICAS COM DOUBLE ==========\n");
  
  double a = 10.5;
  double b = 3.2;
  
  // Soma
  double soma = a + b;
  print("$a + $b = $soma");  // 13.7
  
  // Subtração
  double subtracao = a - b;
  print("$a - $b = $subtracao");  // 7.3
  
  // Multiplicação
  double multiplicacao = a * b;
  print("$a * $b = $multiplicacao");  // 33.6
  
  // Divisão (retorna double)
  double divisao = a / b;
  print("$a / $b = $divisao");  // 3.28125
  
  // Divisão inteira (retorna int)
  int divisaoInteira = (a ~/ b).toInt();
  print("(int)$a ~/ $b = $divisaoInteira");  // 3

  // ========== OPERADORES DE INCREMENTO E ATRIBUIÇÃO ==========
  
  print("\n========== OPERADORES DE INCREMENTO E ATRIBUIÇÃO ==========\n");
  
  double saldo = 100.0;
  print("Saldo inicial: R\$ $saldo");
  
  saldo += 50.75;  // Adiciona 50.75
  print("Após depósito de R\$ 50.75: R\$ $saldo");
  
  saldo -= 25.30;  // Subtrai 25.30
  print("Após saque de R\$ 25.30: R\$ $saldo");
  
  saldo *= 1.02;   // Aplica 2% de rendimento
  print("Após rendimento de 2%: R\$ $saldo");

  // ========== CONVERSÃO ENTRE INT E DOUBLE ==========
  
  print("\n========== CONVERSÃO ENTRE INT E DOUBLE ==========\n");
  
  // int para double
  int numero = 42;
  double doble = numero.toDouble();
  print("int.toDouble(): $numero convertido = $doble");
  
  // double para int (trunca a parte decimal)
  double valor = 7.9;
  int inteiro = valor.toInt();
  print("double.toInt(): $valor convertido = $inteiro");
  
  // double para int com arredondamento
  double valor2 = 7.9;
  int arredondado = valor2.round();  // Arredonda para o inteiro mais próximo
  print("double.round(): $valor2 arredondado = $arredondado");
  
  // Truncar (remover decimais)
  double valor3 = 7.9;
  int truncado = valor3.truncate();  // Remove decimais
  print("double.truncate(): $valor3 truncado = $truncado");
  
  // Piso (arredonda para baixo)
  double valor4 = 7.9;
  int piso = valor4.floor();
  print("double.floor(): $valor4 arredonda para baixo = $piso");
  
  // Teto (arredonda para cima)
  double valor5 = 7.1;
  int teto = valor5.ceil();
  print("double.ceil(): $valor5 arredonda para cima = $teto");

  // ========== CONVERSÃO DE STRING PARA DOUBLE ==========
  
  print("\n========== CONVERSÃO DE STRING PARA DOUBLE ==========\n");
  
  // Conversão segura com parse
  String precoStr = "19.99";
  double precoParsed = double.parse(precoStr);
  print("double.parse('$precoStr') = $precoParsed");
  
  // Conversão com tratamento de erro (tryParse)
  String precoValido = "29.99";
  String precoInvalido = "abc";
  
  double? preco1 = double.tryParse(precoValido);
  double? preco2 = double.tryParse(precoInvalido);
  
  print("double.tryParse('$precoValido') = $preco1");
  print("double.tryParse('$precoInvalido') = $preco2");
  
  // Usando operador ?? para valor padrão
  double preco3 = double.tryParse(precoInvalido) ?? 0.0;
  print("double.tryParse('$precoInvalido') ?? 0.0 = $preco3");

  // ========== CONVERSÃO DE DOUBLE PARA STRING ==========
  
  print("\n========== CONVERSÃO DE DOUBLE PARA STRING ==========\n");
  
  double numero1 = 3.14159;
  
  // toString() simples
  String str1 = numero1.toString();
  print("3.14159.toString() = '$str1'");
  
  // toStringAsFixed(casas decimais) - Fixa número de casas decimais
  String str2 = numero1.toStringAsFixed(2);
  print("3.14159.toStringAsFixed(2) = '$str2'");
  
  String str3 = numero1.toStringAsFixed(4);
  print("3.14159.toStringAsFixed(4) = '$str3'");
  
  // toStringAsPrecision(dígitos totais) - Total de dígitos significativos
  String str4 = numero1.toStringAsPrecision(3);
  print("3.14159.toStringAsPrecision(3) = '$str4'");

  // ========== MÉTODOS ÚTEIS COM DOUBLE ==========
  
  print("\n========== MÉTODOS ÚTEIS COM DOUBLE ==========\n");
  
  double numero2 = -5.7;
  
  // abs() - Valor absoluto
  print("(-5.7).abs() = ${numero2.abs()}");
  
  // sign - Retorna -1.0, 0.0 ou 1.0
  print("(-5.7).sign = ${numero2.sign}");
  print("(5.7).sign = ${(5.7).sign}");
  
  // isInfinite - Verifica se é infinito
  double infinito = double.infinity;
  print("double.infinity.isInfinite = ${infinito.isInfinite}");
  
  // isNaN - Verifica se é NaN (Not a Number)
  double nan = double.nan;
  print("double.nan.isNaN = ${nan.isNaN}");
  
  // isFinite - Verifica se é finito
  double finito = 3.14;
  print("3.14.isFinite = ${finito.isFinite}");
  print("double.infinity.isFinite = ${infinito.isFinite}");

  // ========== ARREDONDAMENTO ==========
  
  print("\n========== ARREDONDAMENTO ==========\n");
  
  double valor6 = 3.7;
  print("Valor original: $valor6");
  print("round() - Arredonda para inteiro mais próximo: ${valor6.round()}");
  print("floor() - Arredonda para baixo: ${valor6.floor()}");
  print("ceil() - Arredonda para cima: ${valor6.ceil()}");
  print("truncate() - Remove decimais: ${valor6.truncate()}");

  // ========== OPERAÇÕES MATEMÁTICAS COM DOUBLE ==========
  
  print("\n========== OPERAÇÕES MATEMÁTICAS ==========\n");
  
  // Usar a biblioteca math para operações avançadas
  // import 'dart:math' (seria necessário na prática)
  
  double numero3 = 9.0;
  // double raizQuadrada = sqrt(numero3);  // Seria necessário import
  
  print("Para operações avançadas (sqrt, pow, sin, cos), use 'dart:math'");

  // ========== EXEMPLOS PRÁTICOS ==========
  
  print("\n========== EXEMPLOS PRÁTICOS ==========\n");
  
  // 1. Calcular média de notas
  double nota1 = 8.5;
  double nota2 = 7.0;
  double nota3 = 9.5;
  double media = (nota1 + nota2 + nota3) / 3;
  print("Média de notas: ${media.toStringAsFixed(2)}");
  
  // 2. Calcular preço com desconto
  double precoOriginal = 100.0;
  double percentualDesconto = 0.15;  // 15%
  double desconto = precoOriginal * percentualDesconto;
  double precoFinal = precoOriginal - desconto;
  print("Preço com 15% de desconto: R\$ ${precoFinal.toStringAsFixed(2)}");
  
  // 3. Calcular juros compostos
  double capital = 1000.0;
  double taxa = 0.05;  // 5% ao mês
  int meses = 12;
  double juros = 1.0;
  for (int i = 0; i < meses; i++) {
    juros *= (1 + taxa);
  }
  double montante = capital * juros;
  print("Montante após $meses meses: R\$ ${montante.toStringAsFixed(2)}");
  
  // 4. Converter temperaturas
  double fahrenheit = 32.0;
  double celsius = (fahrenheit - 32) * 5 / 9;
  print("$fahrenheit°F = ${celsius.toStringAsFixed(2)}°C");
  
  // 5. Calcular IMC
  double altura2 = 1.75;
  double peso2 = 70.0;
  double imc = peso2 / (altura2 * altura2);
  print("IMC: ${imc.toStringAsFixed(2)}");

  // ========== COMPARAÇÕES COM DOUBLE ==========
  
  print("\n========== COMPARAÇÕES COM DOUBLE ==========\n");
  
  double x = 5.5;
  double y = 5.5;
  double z = 5.500001;
  
  print("$x == $y: ${x == y}");  // true
  print("$x == $z: ${x == z}");  // false
  print("$x < $z: ${x < $z}");   // true
  print("$x > $z: ${x > $z}");   // false

  // ========== PROBLEMAS DE PRECISÃO ==========
  
  print("\n========== PROBLEMAS DE PRECISÃO ==========\n");
  
  // Double usa representação binária, o que pode causar imprecisão
  double resultado = 0.1 + 0.2;
  print("0.1 + 0.2 = $resultado");  // Pode não ser exatamente 0.3!
  print("0.1 + 0.2 == 0.3: ${resultado == 0.3}");
  
  // Para operações financeiras, considere usar int (centavos)
  // ou bibliotecas especializadas como decimal

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Nomes descritivos e significativos
  double salarioMensal = 3500.0;
  double aliquotaImposto = 0.25;
  
  // ✗ RUIM: Nomes genéricos
  double x1 = 3500.0;
  double y1 = 0.25;
  
  // ✓ BOM: Usar toStringAsFixed() para valores monetários
  double valor7 = 199.99;
  print("Valor monetário: R\$ ${valor7.toStringAsFixed(2)}");
  
  // ✓ BOM: Considerar problemas de precisão em comparações
  double a1 = 0.1 + 0.2;
  double b1 = 0.3;
  bool saoIguais = (a1 - b1).abs() < 0.0001;  // Comparação com margem
  print("0.1 + 0.2 ≈ 0.3: $saoIguais");
  
  // ✓ BOM: Use constantes para valores fixos
  const double TAXA_CONVERSAO_USD = 5.15;
  const double RAIO_TERRA = 6371.0;
  
  print("\nBoas práticas aplicadas ao código acima!");
}
