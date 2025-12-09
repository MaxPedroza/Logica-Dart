//========AULA01: INTRODUÇÃO A STRINGS==========

void main() {
  // String com aspas simples: 'Sua String' - também válido em Dart
  // String com aspas duplas: "Sua String" - ambas são equivalentes
  // Nota: A escolha entre aspas simples/duplas é questão de estilo

//========AULA02: TIPOS DE DECLARAÇÃO DE STRINGS==========

  // ======Diferentes formas de declarar Strings======

  // Tipo dinâmico (sem inicialização) - a variável pode receber qualquer tipo
  var a;

  // Tipo dinâmico com valor inicial - Dart infere que é String
  var b = 'Max Pedroza';

  // Tipo explícito (sem inicialização) - declare o tipo String sem valor
  String c;
  // Atribuição posterior - agora c recebe um valor
  c = "Max Pedroza";

  // Tipo explícito com valor inicial - forma mais clara e recomendada
  String d = "Max Pedroza";

//========AULA03: BOAS PRÁTICAS COM STRINGS==========

  // ======Boas práticas com Strings======

  // ✅ Boa prática 1: Sempre que possível utilize o tipo explícito para clareza
  var nome = 'Max Pedroza'; // Dart infere tipo, mas é menos claro

  // ✅ Boa prática 2: Prefira declaração explícita com inicialização
  String nome3;
  // Atribuir valor imediatamente após declaração
  nome3 = 'Max Pedroza';

  // ❌ Má prática 1: Evite utilizar o tipo dinâmico sem inicialização
  var nome2; // Tipo desconhecido, pode causar problemas
  // Atribuindo valor posteriormente (pode ser de qualquer tipo)
  nome2 = 'Max Pedroza';

  // ✅ Boa prática 3: Declaração explícita com valor inicial (RECOMENDADO)
  String nome4 = 'Max Pedroza'; // Mais seguro e legível


  //========AULA04: CONCATENAÇÃO DE STRINGS==========
  
  //======Diferentes formas de concatenar Strings======

  // Primeira string: 'Max '
  var primeroNome = 'Max ';
  // Segunda string: ' Pedroza'
  var sobrenome = " Pedroza";
  // Concatenação usando operador + (combina as duas strings)
  var nomeCompleto = primeroNome + sobrenome;

  // Imprimir resultado da concatenação na tela
  print("Nome completo: " + nomeCompleto);

//========AULA05: SUBSTRING (EXTRAIR PARTE DE UMA STRING)==========

  //======SubString: Extraindo partes de uma String======

  // Índices (posição de cada caractere em uma String)
  // Exemplo: 'Max Pedroza' = [0]M [1]a [2]x [3]  [4]P [5]e [6]d [7]r [8]o [9]z [10]a
  // Os índices começam do 0 e não do 1

  // String original que usaremos para extrair substrings
  var nomeSub = 'Max Pedroza';

  // Extrair substring do índice 0 ao 3 (não inclusivo) - resultado: 'Max'
  var subString1 = nomeSub.substring(0, 3);
  // Extrair substring do índice 4 ao 11 (não inclusivo) - resultado: 'Pedroza'
  var subString2 = nomeSub.substring(4, 11);

  // Imprimir primeira substring extraída
  print(subString1); // Output: Max
  // Imprimir segunda substring extraída
  print(subString2); // Output: Pedroza

  //========AULA06: SPLIT - DIVIDINDO STRINGS==========
  
  //======String Split: Dividindo uma string em partes======
  // A função split() divide uma string em um array/lista baseado em um separador
  
  // String original com nome completo contendo espaços como separadores
  var nomeCompleto1 = 'Max Souza Pedroza ';
  // Dividir a string usando espaço ' ' como separador - cria uma lista de strings
  var nomeSeparado = nomeCompleto1.split(' ');
  // Exibir a lista completa de nomes separados
  print(nomeSeparado); // Output: [Max, Souza, Pedroza, ]
  // Acessar o primeiro elemento da lista (índice 0) - 'Max'
  print(nomeSeparado[0]); // Output: Max

  print(  "${nomeSeparado[0]} ${nomeSeparado[1]}"  ); // Output: Max Souza
}
