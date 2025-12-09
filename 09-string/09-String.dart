
void main() {
  //========AULA01: INTRODUÇÃO A STRINGS==========
  print("========AULA01: INTRODUÇÃO A STRINGS==========\n");
  
  // Conceito: Strings são sequências de caracteres (letras, números, símbolos)
  // String com aspas simples: 'Sua String' - também válido em Dart
  // String com aspas duplas: "Sua String" - ambas são equivalentes
  // Nota: A escolha entre aspas simples/duplas é questão de estilo
  
  // Exemplo 1: Declaração simples
  String string1 = 'Olá com aspas simples';
  print("Exemplo 1: $string1");
  
  // Exemplo 2: Declaração com aspas duplas
  String string2 = "Olá com aspas duplas";
  print("Exemplo 2: $string2");
  
  // Exemplo 3: String vazia
  String stringVazia = "";
  print("Exemplo 3 (vazia): '$stringVazia'");
  
  // Exercício 1: Declare uma string com seu nome
  String meuNome = "Seu Nome";
  print("Exercício 1: $meuNome");
  print("");

  //========AULA02: TIPOS DE DECLARAÇÃO DE STRINGS==========
  print("========AULA02: TIPOS DE DECLARAÇÃO DE STRINGS==========\n");

  // Type Inference: o tipo pode ser omitido e Dart infere automaticamente
  // var nome = "João"; // Dart infere que é String
  // Object: tipo genérico que aceita qualquer valor
  // String: tipo específico para strings
  // dynamic: tipo genérico que permite atribuição de qualquer tipo depois

  // Exemplo 1: Usando var (tipo inferido)
  var stringVar = "Usando var (tipo inferido)";
  print("Exemplo 1 - var: $stringVar");
  
  // Exemplo 2: Tipo explícito String
  String stringExplicita = "Tipo explícito String (recomendado)";
  print("Exemplo 2 - String: $stringExplicita");
  
  // Exemplo 3: Usando Object
  Object stringObject = "Tipo Object (genérico)";
  print("Exemplo 3 - Object: $stringObject");
  
  // Exemplo 4: Usando dynamic
  dynamic stringDynamic = "Tipo dynamic (pode mudar de tipo depois)";
  print("Exemplo 4 - dynamic: $stringDynamic");
  
  // Exercício 2: Qual é a diferença entre var e String?
  // var infere o tipo, String é explícito
  // String é mais seguro pois garante que será sempre uma string
  print("");

  //========AULA03: BOAS PRÁTICAS COM STRINGS==========
  print("========AULA03: BOAS PRÁTICAS COM STRINGS==========\n");

  // ✅ Boa prática 1: Sempre que possível utilize o tipo explícito para clareza
  String nomeBomPratica = "Max Pedroza"; // Tipo explícito - recomendado
  print("Exemplo 1 (BOA PRÁTICA): $nomeBomPratica");
  
  // ❌ Má prática: Usar tipo dinâmico sem inicialização
  // var nomeMaPratica; // Tipo desconhecido, pode causar problemas
  
  // ✅ Boa prática 2: Sempre inicializar strings ao declarar
  String nomeComValor = "Maria Silva"; // Declaração com valor inicial
  print("Exemplo 2: $nomeComValor");
  
  // ✅ Boa prática 3: Usar nomes descritivos para variáveis
  String nomeMunicipioCompleto = "São Paulo"; // Nome claro e descritivo
  print("Exemplo 3: $nomeMunicipioCompleto");
  
  // Exercício 3: Declare uma variável string usando a melhor prática
  String melhoPratica = "Exemplo de boa prática";
  print("Exercício 3: $melhoPratica");
  print("");

  //========AULA04: CONCATENAÇÃO DE STRINGS==========
  print("========AULA04: CONCATENAÇÃO DE STRINGS==========\n");

  // Concatenação: unir duas ou mais strings em uma única string
  // Forma 1: Usando o operador + (mais)
  
  // Exemplo 1: Concatenação simples
  String primeiroNome = "Max";
  String sobrenome = "Pedroza";
  String nomeCompleto = primeiroNome + " " + sobrenome;
  print("Exemplo 1 (operador +): $nomeCompleto");
  
  // Exemplo 2: Concatenação com múltiplas strings
  String saudacao = "Olá, ";
  String pessoa = "João";
  String mensagem = saudacao + pessoa + "!";
  print("Exemplo 2: $mensagem");
  
  // Exemplo 3: Concatenação com números
  String texto = "Tenho ";
  int idade = 25;
  String frase = texto + idade.toString() + " anos";
  print("Exemplo 3 (com número): $frase");
  
  // Exercício 4: Concatene seu nome completo
  String meuPrimeiroNome = "João";
  String meuSobrenome = "Silva";
  String meuNomeCompleto = meuPrimeiroNome + " " + meuSobrenome;
  print("Exercício 4: $meuNomeCompleto");
  print("");

  //========AULA05: SUBSTRING (EXTRAIR PARTE DE UMA STRING)==========
  print("========AULA05: SUBSTRING (EXTRAIR PARTE DE UMA STRING)==========\n");

  // SubString: Extrair uma parte específica de uma string
  // Índices começam do 0: [0]M [1]a [2]x [3]  [4]P [5]e [6]d [7]r [8]o [9]z [10]a
  // substring(inicio, fim) - extrai do índice inicio até (não inclusivo) fim

  // Exemplo 1: Extrair "Max"
  String nomeExemplo = "Max Pedroza";
  String subString1 = nomeExemplo.substring(0, 3);
  print("Exemplo 1 - substring(0, 3): '$subString1'");
  
  // Exemplo 2: Extrair "Pedroza"
  String subString2 = nomeExemplo.substring(4, 11);
  print("Exemplo 2 - substring(4, 11): '$subString2'");
  
  // Exemplo 3: Extrair a partir de um índice até o final
  String subString3 = nomeExemplo.substring(4);
  print("Exemplo 3 - substring(4): '$subString3'");
  
  // Exercício 5: Extraia apenas as 3 primeiras letras
  String exercicio5 = "Programação";
  String primeirasPalavras = exercicio5.substring(0, 3);
  print("Exercício 5 - primeiras letras: '$primeirasPalavras'");
  print("");

  //========AULA06: SPLIT - DIVIDINDO STRINGS==========
  print("========AULA06: SPLIT - DIVIDINDO STRINGS==========\n");

  // Split: Dividir uma string em uma lista de strings usando um separador
  
  // Exemplo 1: Dividir nome completo por espaço
  String nomeCompleto2 = "Max Souza Pedroza";
  List<String> nomes = nomeCompleto2.split(' ');
  print("Exemplo 1 - split(' '): $nomes");
  print("  Primeiro nome: ${nomes[0]}");
  print("  Segundo nome: ${nomes[1]}");
  print("  Terceiro nome: ${nomes[2]}");
  
  // Exemplo 2: Dividir endereço por vírgula
  String endereco = "Rua A,São Paulo,Brasil";
  List<String> enderecoPartes = endereco.split(',');
  print("Exemplo 2 - split(','): $enderecoPartes");
  
  // Exemplo 3: Dividir por caractere específico
  String data = "01-12-2024";
  List<String> dataPartes = data.split('-');
  print("Exemplo 3 - split('-'): $dataPartes");
  
  // Exercício 6: Divida uma string e acesse o primeiro elemento
  String frutas = "Maçã,Banana,Laranja";
  List<String> frutasSeparadas = frutas.split(',');
  print("Exercício 6 - primeira fruta: ${frutasSeparadas[0]}");
  print("");

  //========AULA07: LENGTH - TAMANHO DE UMA STRING==========
  print("========AULA07: LENGTH - TAMANHO DE UMA STRING==========\n");

  // Length: Propriedade que retorna o número total de caracteres em uma string
  
  // Exemplo 1: Obter tamanho da string
  String minhaString = "Max Pedroza";
  int tamanho = minhaString.length;
  print("Exemplo 1 - length: '$minhaString' tem $tamanho caracteres");
  
  // Exemplo 2: Acessar primeiro caractere
  print("Exemplo 2 - primeiro caractere [0]: '${minhaString[0]}'");
  
  // Exemplo 3: Acessar último caractere
  print("Exemplo 3 - último caractere [${tamanho - 1}]: '${minhaString[tamanho - 1]}'");
  
  // Exemplo 4: Loop através de todos os caracteres
  print("Exemplo 4 - loop (todos os caracteres):");
  String palavra = "DART";
  for (int i = 0; i < palavra.length; i++) {
    print("  Índice $i: '${palavra[i]}'");
  }
  
  // Exercício 7: Conte quantas letras tem seu nome
  String exercicio7nome = "Programação";
  int exercicio7tamanho = exercicio7nome.length;
  print("Exercício 7 - '$exercicio7nome' tem $exercicio7tamanho caracteres");
  print("");

  //========AULA08: INTERPOLAÇÃO DE STRINGS==========
  print("========AULA08: INTERPOLAÇÃO DE STRINGS==========\n");

  // Interpolação: Inserir variáveis e expressões dentro de strings
  // Forma 1: $variavel - para inserir uma variável simples
  // Forma 2: ${expressao} - para inserir expressões mais complexas

  // Exemplo 1: Interpolação simples com $variavel
  String nome = "Maria";
  int idadeEx8 = 30;
  String mensagem1 = "Meu nome é $nome e tenho $idadeEx8 anos";
  print("Exemplo 1: $mensagem1");
  
  // Exemplo 2: Interpolação com expressão ${expressao}
  int anoAtual = 2024;
  int anoNascimento = 1994;
  String mensagem2 = "Nasci em $anoNascimento e em ${anoAtual - anoNascimento} anos terei ${anoAtual + 10} anos";
  print("Exemplo 2: $mensagem2");
  
  // Exemplo 3: Interpolação com método .toUpperCase()
  String fruta = "banana";
  String mensagem3 = "Gosto de ${fruta.toUpperCase()}";
  print("Exemplo 3: $mensagem3");
  
  // Exemplo 4: Interpolação complexa
  String nome4 = "João";
  String sobrenome4 = "Silva";
  String email = "joao.silva@email.com";
  String apresentacao = "Olá, meu nome é ${nome4.toUpperCase()} ${sobrenome4.toUpperCase()}, meu email é $email";
  print("Exemplo 4: $apresentacao");
  
  // Exercício 8: Use interpolação para criar uma mensagem
  String exercicio8nome = "Lucas";
  int exercicio8idade = 25;
  String exercicio8mensagem = "Oi, sou $exercicio8nome e tenho $exercicio8idade anos";
  print("Exercício 8: $exercicio8mensagem");
  print("");

//======AULA09: ISEMPTY============================
  print("========AULA09: ISEMPTY - VERIFICAR STRING VAZIA==========\n");
  final textoVazio = "";
  print("Exemplo 1 - textoVazio.isEmpty: ${textoVazio.isEmpty}"); // true
  final textoComConteudo = "Dart é legal";
  print("Exemplo 2 - textoComConteudo.isEmpty: ${textoComConteudo.isEmpty}"); // false

  String? textoNulo;
  print("Exemplo 3 - textoNulo?.isEmpty: ${textoNulo?.isEmpty}"); // null 

  print("textoVazio.isNotEmpty: ${textoVazio?.isNotEmpty ?? false}"); // false
  print("textoComConteudo.isNotEmpty: ${textoComConteudo?.isNotEmpty}"); // true


//====AULA10: ISNOTEMPTY==========================
  print("\n========AULA10: ISNOTEMPTY - VERIFICAR STRING NÃO VAZIA==========\n");
  final textoNaoVazio2 = "Max Pedroza";
  print("Exemplo 1 - textoNaoVazio2.isNotEmpty: ${textoNaoVazio2.isNotEmpty}"); // true

//========AULA11: CONTAINS==========================
  print("\n========AULA11: CONTAINS - VERIFICAR SE STRING CONTEM UM DETERMINADO TEXTO==========\n");
  final frase = "Dart é uma linguagem de programação incrível";
  print("Exemplo 1 - frase.contains('Dart'): ${frase.contains('Dart')}"); // true
  print("Exemplo 2 - frase.contains('Java'): ${frase.contains('Java')}"); // false

//========AULA12: REPLACE ALL==========================
  print("\n========AULA12: REPLACE ALL - SUBSTITUIR TODAS AS OCORRÊNCIAS DE UM TEXTO NA STRING==========\n");
  final textoOriginal = "Eu gosto de maçã. A maçã é minha fruta favorita.";
  final textoModificado = textoOriginal.replaceAll("maçã", "banana");
  print("Exemplo 1 - textoModificado: $textoModificado"); // "Eu gosto de banana. A banana é minha fruta favorita."

//===========AULA13: REPLACE FIRST==========================
  print("\n========AULA13: REPLACE FIRST - SUBSTITUIR A PRIMEIRA OCORRÊNCIA DE UM TEXTO NA STRING==========\n");
  final textoOriginal2 = "Eu gosto de maçã. A maçã é minha fruta favorita.";
  final textoModificado2 = textoOriginal2.replaceFirst("maçã", "banana");
  print("Exemplo 1 - textoModificado2: $textoModificado2"); // "Eu gosto de banana. A maçã é minha fruta favorita."

  //========AULA14: REPLACE RANGE==========================
  print("\n========AULA14: REPLACE RANGE - SUBSTITUIR UMA FAIXA DE ÍNDICES NA STRING==========\n");
  //                      0123456789101112
  final textoOriginal3 = "Olá, mundo!";
  // Índices 7 a 12 correspondem a "mundo"
  final textoModificado3 = textoOriginal3.replaceRange(7, 12, "Dart");
  print("Exemplo 1 - textoModificado3: $textoModificado3"); // "Olá, Dart!"

  //========ULA15: STARTSWITH==========================
  print("\n========AULA15: STARTSWITH - VERIFICAR SE A STRING COMEÇA COM UM DETERMINADO TEXTO==========\n");
  final saudacao = "Olá, seja bem-vindo!";
  print("Exemplo 1 - saudacao.startsWith('Olá'): ${saudacao.startsWith('Olá')}"); // true
  print("Exemplo 2 - saudacao.startsWith('Seja'): ${saudacao.startsWith('Seja')}"); // false

  //========ULA16:ENDSWITH==========================
  print("\n========AULA16: ENDSWITH - VERIFICAR SE A STRING TERMINA COM UM DETERMINADO TEXTO==========\n");
  final despedida = "Até logo, nos vemos em breve!";
  print("Exemplo 1 - despedida.endsWith('breve!'): ${despedida.endsWith('breve!')}"); // true
  print("Exemplo 2 - despedida.endsWith('olá'): ${despedida.endsWith('olá')}"); // false

  //========AULA17:TRIM==========================
  print("\n========AULA17: TRIM - REMOVER ESPAÇOS EM BRANCO NO INÍCIO E FIM DA STRING==========\n");
  final textoComEspacos = "   Olá, Mundo!   ";
  final textoSemEspacos = textoComEspacos.trim();
  print("Exemplo 1 - textoSemEspacos: '$textoSemEspacos'"); // "Olá, Mundo!"

  //TRIMLEFT==========================
  print("\n========AULA18: TRIMLEFT - REMOVER ESPAÇOS EM BRANCO NO INÍCIO DA STRING==========\n");
  final textoComEspacos2 = "   Olá, Mundo!   ";
  final textoSemEspacosInicio = textoComEspacos2.trimLeft();
  print("Exemplo 1 - textoSemEspacosInicio: '$textoSemEspacosInicio'"); // "Olá, Mundo!   "

  //TRIMRIGHT==========================
  print("\n========AULA19: TRIMRIGHT - REMOVER ESPAÇOS EM BRANCO NO FIM DA STRING==========\n");
  final textoComEspacos3 = "   Olá, Mundo!   ";
  final textoSemEspacosFim = textoComEspacos3.trimRight();
  print("Exemplo 1 - textoSemEspacosFim: '$textoSemEspacosFim'"); // "   Olá, Mundo!"

}