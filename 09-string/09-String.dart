
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

  //========EXERCÍCIOS E DESAFIOS FINAIS==========
  print("========EXERCÍCIOS E DESAFIOS FINAIS==========\n");
  
  // Desafio 1: Crie uma string com nome completo e extraia cada parte
  print("Desafio 1 - Extrair partes do nome:");
  String nomeDesafio1 = "Ana Paula Santos";
  List<String> nomePartes = nomeDesafio1.split(' ');
  print("  Nome completo: $nomeDesafio1");
  print("  Primeira parte: ${nomePartes[0]}");
  print("  Segunda parte: ${nomePartes[1]}");
  print("  Terceira parte: ${nomePartes[2]}");
  print("");
  
  // Desafio 2: Use interpolação e concatenação juntas
  print("Desafio 2 - Combinando técnicas:");
  String primeiraParteDesafio2 = "O número ";
  int numeroDesafio2 = 42;
  String segundaParteDesafio2 = " é especial porque $numeroDesafio2 dividido por 2 é " + (numeroDesafio2 ~/ 2).toString();
  print("  $primeiraParteDesafio2$numeroDesafio2$segundaParteDesafio2");
  print("");
  
  // Desafio 3: Verificar tamanho de string e contar caracteres
  print("Desafio 3 - Análise de string:");
  String stringDesafio3 = "FLUTTER";
  print("  String: '$stringDesafio3'");
  print("  Tamanho: ${stringDesafio3.length}");
  print("  Primeira metade: ${stringDesafio3.substring(0, stringDesafio3.length ~/ 2)}");
  print("  Segunda metade: ${stringDesafio3.substring(stringDesafio3.length ~/ 2)}");
  print("");
  
  // Desafio 4: Formatar dados com interpolação
  print("Desafio 4 - Formatação de dados:");
  String produtoDesafio4 = "Notebook";
  double preco = 3500.50;
  int quantidade = 2;
  double total = preco * quantidade;
  print("  Produto: $produtoDesafio4");
  print("  Preço unitário: R\$ $preco");
  print("  Quantidade: $quantidade");
  print("  Total: R\$ $total");
  print("");
}
