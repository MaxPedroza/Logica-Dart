// REPRESENTAÇÃO DE NÚMERO INTEIRO EM DART
// Este arquivo demonstra as diferentes formas de declarar variáveis do tipo inteiro

// ========== FORMA IMPLÍCITA ==========
// Usar 'var' deixa o Dart inferir o tipo automaticamente

// Declaração sem inicialização - numeroInteiro será null (não inicializado)
var numeroInteiro;

// Declaração com inicialização - Dart infere que é um 'int' baseado no valor 10
var numeroInteiro1 = 10;

// ========== FORMA EXPLÍCITA ==========
// Declarar explicitamente o tipo 'int' deixa claro que a variável é um número inteiro

// Declaração sem inicialização - numeroInteiro2 será null (não inicializado)
int numeroInteiro2;

// Declaração com inicialização - A variável recebe explicitamente o tipo 'int' e valor 42
int numeroInteiro3 = 42;


void main() {
  // Imprime a variável numeroInteiro1 (valor: 10) usando interpolação de string
  // A sintaxe $variavel insere o valor da variável dentro da string
  print("O número inteiro é: $numeroInteiro1");
  
  // Imprime a variável numeroInteiro2 (valor: null, pois não foi inicializada)
  print("O número inteiro é: $numeroInteiro2");

  // ========== DECLARANDO NÚMEROS INTEIROS ==========
  
  print("\n========== DECLARANDO NÚMEROS INTEIROS ==========\n");
  
  // Números positivos
  int numero1 = 100;
  int numero2 = 999;
  
  // Números negativos
  int numero3 = -50;
  int numero4 = -1000;
  
  // Zero
  int numero5 = 0;
  
  print("Positivos: $numero1, $numero2");
  print("Negativos: $numero3, $numero4");
  print("Zero: $numero5");

  // ========== LIMITES DE INTEIROS ==========
  
  print("\n========== LIMITES DE INTEIROS ==========\n");
  
  // Dart suporta inteiros de qualquer tamanho (pode ser muito grande)
  int numeroGrande = 9223372036854775807;  // Maior valor de int de 64 bits
  int numeroMuitoGrande = 999999999999999999999999999999;
  
  print("Número grande: $numeroGrande");
  print("Número muito grande: $numeroMuitoGrande");

  // ========== OPERAÇÕES ARITMÉTICAS COM INTEIROS ==========
  
  print("\n========== OPERAÇÕES ARITMÉTICAS COM INTEIROS ==========\n");
  
  int a = 20;
  int b = 3;
  
  // Soma
  int soma = a + b;
  print("$a + $b = $soma");  // 23
  
  // Subtração
  int subtracao = a - b;
  print("$a - $b = $subtracao");  // 17
  
  // Multiplicação
  int multiplicacao = a * b;
  print("$a * $b = $multiplicacao");  // 60
  
  // Divisão (retorna double)
  var divisao = a / b;
  print("$a / $b = $divisao");  // 6.666...
  
  // Divisão inteira (retorna int, trunca o decimal)
  int divisaoInteira = a ~/ b;
  print("$a ~/ $b = $divisaoInteira");  // 6
  
  // Resto da divisão (módulo)
  int resto = a % b;
  print("$a % $b = $resto");  // 2

  // ========== OPERADORES DE INCREMENTO E DECREMENTO ==========
  
  print("\n========== OPERADORES DE INCREMENTO E DECREMENTO ==========\n");
  
  int contador = 10;
  print("Valor inicial: $contador");
  
  // Pré-incremento (++contador)
  print("++contador = ${++contador}");  // 11 (incrementa e depois retorna)
  
  // Pós-incremento (contador++)
  print("contador++ = ${contador++}");  // 11 (retorna e depois incrementa)
  print("Valor após: $contador");       // 12
  
  // Pré-decremento (--contador)
  print("--contador = ${--contador}");  // 11 (decrementa e depois retorna)
  
  // Pós-decremento (contador--)
  print("contador-- = ${contador--}");  // 11 (retorna e depois decrementa)
  print("Valor após: $contador");       // 10

  // ========== OPERADORES DE ATRIBUIÇÃO COMPOSTOS ==========
  
  print("\n========== OPERADORES DE ATRIBUIÇÃO COMPOSTOS ==========\n");
  
  int valor = 100;
  print("Valor inicial: $valor");
  
  valor += 50;  // valor = valor + 50
  print("Após += 50: $valor");  // 150
  
  valor -= 30;  // valor = valor - 30
  print("Após -= 30: $valor");  // 120
  
  valor *= 2;   // valor = valor * 2
  print("Após *= 2: $valor");   // 240
  
  valor ~/= 3;  // valor = valor ~/ 3 (divisão inteira)
  print("Após ~/= 3: $valor");  // 80

  // ========== OPERADORES BITWISE ==========
  
  print("\n========== OPERADORES BITWISE ==========\n");
  
  int num1 = 5;      // 0101 em binário
  int num2 = 3;      // 0011 em binário
  
  // AND (&)
  print("$num1 & $num2 = ${num1 & num2}");  // 1 (0001)
  
  // OR (|)
  print("$num1 | $num2 = ${num1 | num2}");  // 7 (0111)
  
  // XOR (^)
  print("$num1 ^ $num2 = ${num1 ^ num2}");  // 6 (0110)
  
  // NOT (~) - Inverte todos os bits
  print("~$num1 = ${~num1}");  // -6

  // ========== CONVERSÃO DE TIPOS ==========
  
  print("\n========== CONVERSÃO DE TIPOS ==========\n");
  
  // String para int
  String texto = "42";
  int numero = int.parse(texto);
  print("int.parse('$texto') = $numero");
  
  // Conversão com tratamento de erro
  String textoInvalido = "abc";
  int? numeroOpcional = int.tryParse(textoInvalido);
  print("int.tryParse('$textoInvalido') = $numeroOpcional");  // null
  
  // int para String
  int inteiro = 123;
  String stringNumero = inteiro.toString();
  print("$inteiro.toString() = '$stringNumero'");
  
  // double para int
  double decimal = 7.9;
  int convertido = decimal.toInt();
  print("7.9.toInt() = $convertido");  // 7 (trunca, não arredonda)
  
  // int para double
  int inteiro2 = 10;
  double convertidoDouble = inteiro2.toDouble();
  print("10.toDouble() = $convertidoDouble");

  // ========== MÉTODOS ÚTEIS ==========
  
  print("\n========== MÉTODOS ÚTEIS ==========\n");
  
  int numero = 42;
  
  // abs() - Valor absoluto
  int negativo = -15;
  print("(-15).abs() = ${negativo.abs()}");  // 15
  
  // sign - Retorna -1, 0 ou 1
  print("42.sign = ${numero.sign}");        // 1
  print("(-15).sign = ${negativo.sign}");   // -1
  print("0.sign = ${0.sign}");              // 0
  
  // isEven - Verifica se é par
  print("42.isEven = ${numero.isEven}");    // true
  
  // isOdd - Verifica se é ímpar
  print("42.isOdd = ${numero.isOdd}");      // false
  
  // gcd() - Maior divisor comum
  int a1 = 12;
  int b1 = 8;
  print("$a1.gcd($b1) = ${a1.gcd(b1)}");   // 4
  
  // toString() - Converte para string
  print("42.toString() = '${numero.toString()}'");

  // ========== COMPARAÇÕES COM INTEIROS ==========
  
  print("\n========== COMPARAÇÕES COM INTEIROS ==========\n");
  
  int x = 10;
  int y = 20;
  
  print("$x == $y: ${x == y}");    // false
  print("$x != $y: ${x != y}");    // true
  print("$x < $y: ${x < y}");      // true
  print("$x > $y: ${x > y}");      // false
  print("$x <= $y: ${x <= $y}");   // true
  print("$x >= $y: ${x >= y}");    // false

  // ========== EXEMPLOS PRÁTICOS ==========
  
  print("\n========== EXEMPLOS PRÁTICOS ==========\n");
  
  // Calcular idade
  int anoNascimento = 1995;
  int anoAtual = 2025;
  int idade = anoAtual - anoNascimento;
  print("Idade em $anoAtual: $idade anos");
  
  // Calcular fatorial
  int n = 5;
  int fatorial = 1;
  for (int i = 1; i <= n; i++) {
    fatorial *= i;
  }
  print("Fatorial de $n: $fatorial");
  
  // Calcular série de Fibonacci
  print("Série de Fibonacci (primeiros 5 números):");
  int fib1 = 0, fib2 = 1;
  print("$fib1, $fib2");
  for (int i = 2; i < 5; i++) {
    int proximo = fib1 + fib2;
    print("$proximo");
    fib1 = fib2;
    fib2 = proximo;
  }

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Nomes descritivos
  int idadeUsuario = 25;
  int quantidadeProdutos = 10;
  
  // ✗ RUIM: Nomes genéricos
  int x1 = 25;
  int y1 = 10;
  
  // ✓ BOM: Usar constantes para valores fixos
  const int MAIORIDADE = 18;
  const int LIMITE_TRANSACAO = 5000;
  
  // ✓ BOM: Verificar limites antes de operações
  int numero1Final = 1000000;
  int numero2Final = 2000000;
  if (numero1Final > 0 && numero2Final > 0) {
    int resultado = numero1Final + numero2Final;
    print("Resultado: $resultado");
  }
  
  print("\nBoas práticas aplicadas ao código acima!");
}