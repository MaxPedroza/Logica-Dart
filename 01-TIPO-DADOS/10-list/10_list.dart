void main() {
  //=================== AULA 01: LISTAS ===================
  print("========== AULA 01: LISTAS ==========");
  
  // ========== DECLARAÇÃO DE LISTAS ==========
  print("========== DECLARAÇÃO DE LISTAS ==========");
  print("Declarando uma lista de inteiros: List<int> myList = [1, 2, 3, 4, 5];");

  // Declaração de uma lista de números inteiros
  // A sintaxe é List<Tipo> nomeDaVariavel;
  // Note que 'List' começa com letra maiúscula
  List<int> myList;

  // Inicialização da lista com valores
  // Os índices começam em 0
  // Índices: 0  1  2  3  4
  myList = [1, 2, 3, 4, 5];
  
  print("Conteúdo da lista: $myList");
  
  // Acessando um elemento específico pelo índice
  // myList[0] acessa o primeiro elemento (o número 1)
  print("Acessando o índice 0 (myList[0]): ${myList[0]}");

  // ========== LISTAS DE STRINGS ==========
  print("\n========== LISTAS DE STRINGS ==========");
  print("Declarando uma lista de Strings: List<String> myStringList = ['A', 'B', 'C', 'D'];");
  
  // Declaração de uma lista de textos (String)
  List<String> myStringList;
  myStringList = ['A', 'B', 'C', 'D'];
  print("Conteúdo da lista: $myStringList");

  // ========== INFERÊNCIA DE TIPOS (VAR) ==========
  print("\n========== INFERÊNCIA DE TIPOS (VAR) ==========");
  print("1. Lista Dinâmica (var listDynamic = []):");
  print("   O Dart infere como List<dynamic>, aceitando qualquer tipo.");
  
  // Lista dinâmica: Quando não especificamos o tipo, o Dart infere como List<dynamic>
  // Isso significa que ela pode aceitar qualquer tipo de dado (não recomendado se puder evitar)
  var listDynamic = [];
  listDynamic.add("Texto"); // Funciona
  listDynamic.add(10);      // Também funciona
  
  print("   Conteúdo após adicionar 'Texto' e 10: $listDynamic");

  print("\n2. Lista Tipada com var (var listTyped = <Map>[]):");
  print("   Especificamos <Map> antes dos colchetes.");
  
  // Lista tipada com var:
  // Aqui usamos <Map> antes dos colchetes para dizer explicitamente que é uma lista de Mapas
  var listTyped = <Map>[];
  print("   Lista de Maps vazia: $listTyped");

  // ========== CONSTRUTORES ==========
  print("\n========== CONSTRUTORES ==========");
  print("Usando List.empty():");
  
  // Criando uma lista vazia usando o construtor List.empty()
  // A palavra-chave 'new' é opcional no Dart moderno
  // Nota: List.empty() cria uma lista de tamanho fixo (growable: false) por padrão.
  // Se você tentar adicionar itens nela (add), vai dar erro.
  var listEmpty = List.empty();
  print("   Lista vazia criada: $listEmpty");
  print("   Nota: Por padrão, List.empty() cria uma lista de tamanho fixo (growable: false).");
  print("   Se tentarmos adicionar itens nela, ocorrerá um erro.");
  
  print("\nUsando List.empty(growable: true):");
  
  // Para permitir adicionar itens, use: List.empty(growable: true)
  var listGrowable = List.empty(growable: true);
  listGrowable.add(100);
  print("   Lista vazia (growable) após adicionar 100: $listGrowable");

//========================AULA02:LIST ADD===============================
  print("\n\n=================== AULA 02: ADICIONANDO ITENS (ADD) ===================");
  print("========== MÉTODO ADD ==========");
  print("O método .add() adiciona um item ao final da lista.");

  // Criando uma lista vazia
  var lista = [];
  print("Lista inicial: $lista");
  
  // Adicionando o número 10
  print("Adicionando 10...");
  lista.add(10); 
  print("Lista atualizada: $lista");

//==================AULA03:LIST ADD ALL===========================
  print("\n\n=================== AULA 03: ADICIONANDO VÁRIOS ITENS (ADD ALL) ===================");
  print("========== MÉTODO ADD ALL ==========");
  print("O método .addAll() adiciona uma lista de itens ao final da lista atual.");

  // Lista inicial
  var lista1 = [1, 2, 3];
  print("Lista inicial: $lista1");
  
  // Adicionando [4, 5, 6]
  print("Adicionando [4, 5, 6]...");
  lista1.addAll([4, 5, 6]);
  print("Lista atualizada: $lista1");

//==================AULA04:LIST REMOVE===========================
  print("\n\n=================== AULA 04: REMOVENDO ITENS (REMOVE) ===================");
  print("========== MÉTODO REMOVE ==========");
  print("O método .remove() remove a primeira ocorrência do item especificado da lista.");

  // Lista inicial
  var lista2 = [1, 2, 3, 2, 4];
  print("Lista inicial: $lista2");
  
  // Removendo o número 2
  print("Removendo o número 2...");
  lista2.remove(2);
  print("Lista atualizada: $lista2");

//==================AULA05:LIST REMOVE AT==============
  print("\n\n=================== AULA 05: REMOVENDO ITENS POR ÍNDICE (REMOVE AT) ===================");
  print("========== MÉTODO REMOVE AT ==========");
  print("O método .removeAt() remove o item no índice especificado.");

  // Lista inicial
  var lista3 = ['A', 'B', 'C', 'D'];
  print("Lista inicial: $lista3");
  
  // Removendo o item no índice 1 (que é 'B')
  print("Removendo o item no índice 1...");
  lista3.removeAt(1);
  print("Lista atualizada: $lista3");

//==================Diferença entre REMOVE E REMOVEAT===========================
  print("\n\n===================  DIFERENÇA ENTRE REMOVE E REMOVEAT ===================");
  print("========== COMPARAÇÃO ==========");
  print("1. .remove(valor): Busca o VALOR na lista e remove a primeira ocorrência.");
  print("2. .removeAt(indice): Vai direto na POSIÇÃO (índice) e remove o que estiver lá.");

  // Exemplo prático da diferença
  // Vamos usar uma lista de inteiros para ficar bem claro
  var listaDiff = [10, 20, 30, 40, 50];
  print("\nLista inicial: $listaDiff");

  // CENÁRIO 1: remove(2)
  // O método remove(2) procura pelo NÚMERO 2 dentro da lista.
  print("Tentando remover o VALOR 2 com .remove(2)...");
  bool removeu = listaDiff.remove(2); 
  print("Removeu? $removeu (Porque não existe o valor 2 na lista, apenas 10, 20...)");
  print("Lista: $listaDiff");

  // CENÁRIO 2: removeAt(2)
  // O método removeAt(2) vai até a POSIÇÃO 2 (0, 1, 2) e remove o item.
  // Índice 0 = 10
  // Índice 1 = 20
  // Índice 2 = 30 (Este será removido)
  print("\nRemovendo o ÍNDICE 2 com .removeAt(2)...");
  var removido = listaDiff.removeAt(2);
  print("Valor removido: $removido");
  print("Lista final: $listaDiff");

//========================AULA06:LIST CLEAR===============================
  print("\n\n=================== AULA 06: LIMPAR LISTA (CLEAR) ===================");
  print("========== MÉTODO CLEAR ==========");
  print("O método .clear() remove todos os itens da lista, deixando-a vazia.");

  // Criando uma lista com alguns itens
  var listaClear = [1, 2, 3, 4, 5];
  print("Lista inicial: $listaClear");
  
  // Limpando a lista
  print("Limpando a lista...");
  listaClear.clear();
  print("Lista após clear(): $listaClear");

//========================AULA07:LIST CONTAINS===============================
  print("\n\n=================== AULA 07: VERIFICAR SE CONTÉM ITENS (CONTAINS) ===================");
  print("========== MÉTODO CONTAINS ==========");
  print("O método .contains(item) verifica se o item especificado está presente na lista, retornando true ou false.");
  // Criando uma lista de usuários
  var users = <String>["Ale", "Ramon", "Vivi", "Max"];
  print("Lista de usuários: $users"); 
  // Verificando se "Ramon" está na lista
  var containsRamon = users.contains("Ramon");
  print("A lista contém 'Ramon'? $containsRamon");

//========================AULA08:LIST ELEMENT AT===============================
  print("\n\n=================== AULA 08: ACESSAR ITENS POR ÍNDICE (ELEMENT AT) ===================");
  print("========== MÉTODO ELEMENT AT ==========");
  print("O método .elementAt(indice) retorna o item no índice especificado.");

  // Criando uma lista de frutas
  var frutas = <String>["Maçã", "Banana", "Laranja", "Uva"];
  print("Lista de frutas: $frutas");
  
  // Acessando o item no índice 2 (Laranja)
  var frutaNoIndice2 = frutas.elementAt(2);
  print("Fruta no índice 2: $frutaNoIndice2");  

//========================AULA09:LIST FIRST WHERE===============================
  print("\n\n=================== AULA 09: ENCONTRAR PRIMEIRO ITEM QUE SATISFAZ UMA CONDIÇÃO (FIRST WHERE) ===================");
  print("========== MÉTODO FIRST WHERE ==========");
  print("O método .firstWhere((item) => condição) retorna o primeiro item que satisfaz a condição especificada.");

  // Criando uma lista de números
  var numeros = <int>[10, 15, 20, 25, 30];
  print("Lista de números: $numeros");
  
  // Encontrando o primeiro número maior que 18
  var primeiroMaiorQue18 = numeros.firstWhere((num) => num > 18);
  print("Primeiro número maior que 18: $primeiroMaiorQue18");

  //Adicionando tratativa para casos onde não encontra o item

  var users = <String>["Ale", "Ramon", "Vivi", "Max"];
  String? item =
    users.firstWhere((e)=> e.contains("QUERTY"), orElse: ()=> "VAZIO");
  print("Item encontrado: $item");
  
//========================AULA10:LIST FOREACH===============================
  print("\n\n=================== AULA 10: ITERANDO ITENS (FOREACH) ===================");
  print("========== MÉTODO FOREACH ==========");
  print("O método .forEach((item) => ação) itera sobre cada item da lista, executando a ação especificada.");

  // Criando uma lista de usuários
  var usuarios = <String>["Alencar", "Gabul", "Letícia", "Ingrid", "Gabriel"];
  print("Lista de usuários: $usuarios");
  
  // Iterando sobre cada usuário e imprimindo
  print("Iterando sobre a lista de usuários:");
  usuarios.forEach((e) {
    print("Alunx: $e");
  });

  // Exemplo com cálculo de soma usando forEach
  var salariosAnual = List.generate(12, (index) => 1000 * (index + 1));
  var totalSalarios = 0;
  salariosAnual.forEach((element) {
    totalSalarios += element;
  });
  print("Total dos salários anuais: $totalSalarios");

  //Exercicio adicional de forEach
  print("\n\n=================== EXERCÍCIO ADICIONAL: FOREACH ===================");
  print("1. Iterando sobre uma lista de nomes:");
  
  var usersEx = <String>["Ale", "Ramon", "Vivi", "Max"];
  print("Lista de usuários: $usersEx");
  
  print("Executando forEach para imprimir cada usuário...");
  usersEx.forEach((e){
    print("   Usuário: $e");
  });

  print("\n2. Calculando total de salários gerados dinamicamente:");
  
  // EXPLICAÇÃO DETALHADA DO CÁLCULO:
  // 1. List.generate(12, ...) cria uma lista com 12 itens (representando 12 meses).
  // 2. O índice (index) começa em 0 e vai até 11.
  // 3. A fórmula aplicada é: 1500 * (index + 1).
  //    - Iteração 1 (index 0): 1500 * 1 = 1500
  //    - Iteração 2 (index 1): 1500 * 2 = 3000
  //    - ...
  //    - Iteração 12 (index 11): 1500 * 12 = 18000
  // 4. O resultado é uma lista progressiva de salários.

  var salariosAnualEx = List.generate(12, (index) => 1500 * (index + 1));
  print("Lista de salários gerada: $salariosAnualEx");
  
  // 5. O forEach percorre cada valor gerado acima e soma à variável acumuladora.
  // EXPLICAÇÃO DA SOMA (ACUMULAÇÃO):
  // A variável 'totalSalariosEx' começa com 0.
  // O loop forEach pega cada valor da lista 'salariosAnualEx' e adiciona ao total.
  // Passo a passo da soma:
  // - Início: total = 0
  // - 1º item (1500): total = 0 + 1500 = 1500
  // - 2º item (3000): total = 1500 + 3000 = 4500
  // - 3º item (4500): total = 4500 + 4500 = 9000
  // ... e assim por diante até somar todos os 12 salários.

  var totalSalariosEx = 0;
  salariosAnualEx.forEach((element) {
    // A linha abaixo é o mesmo que: totalSalariosEx = totalSalariosEx + element;
    totalSalariosEx += element;
  });
  
  print("Cálculo: Soma de todos os elementos da lista.");
  print("Total acumulado: $totalSalariosEx");

//========================AULA11:LIST INDEXOF===============================
  print("\n\n=================== AULA 11: ENCONTRAR ÍNDICE DE UM ITEM (INDEX OF) ===================");
  print("========== MÉTODO INDEX OF ==========");
  print("O método .indexOf(item) retorna o índice da primeira ocorrência do item especificado na lista.");

  // Criando uma lista de letras
  var letras = <String>["A", "B", "C", "D", "B"];
  print("Lista de letras: $letras");
  
  // Encontrando o índice da primeira ocorrência de "B"
  var indiceDeB = letras.indexOf("B");
  print("Índice da primeira ocorrência de 'B': $indiceDeB");  

//========================AULA12:LIST INDEX WHERE===============================
  print("\n\n=================== AULA 12: ENCONTRAR ÍNDICE COM CONDIÇÃO (INDEX WHERE) ===================");
  print("========== MÉTODO INDEX WHERE ==========");
  print("O método .indexWhere((item) => condição) retorna o índice do primeiro item que satisfaz a condição especificada.");

  // Criando uma lista de números
  var numerosEx = <int>[5, 10, 15, 20, 25];
  print("Lista de números: $numerosEx");
  
  // Encontrando o índice do primeiro número maior que 12
  var indiceMaiorQue12 = numerosEx.indexWhere((num) => num > 12);
  print("Índice do primeiro número maior que 12: $indiceMaiorQue12");

  final values = <int>[1, 2, 3, 4, 5];
  final valueIndex = values.indexWhere((e) => e == 3);
  print("Índice do valor 3 na lista values: $valueIndex");

//===================AULA13: LIST INSERT========================
  print("\n\n=================== AULA 13: INSERIR ITENS EM POSIÇÃO ESPECÍFICA (INSERT) ===================");
  print("========== MÉTODO INSERT ==========");
  print("O método .insert(indice, item) insere o item na posição especificada, deslocando os itens subsequentes.");

  // Criando uma lista de números
  var numerosInsert = <int>[1, 2, 4, 5];
  print("Lista inicial: $numerosInsert");
  
  // Inserindo o número 3 na posição índice 2
  print("Inserindo o número 3 na posição índice 2...");
  numerosInsert.insert(2, 3);
  print("Lista atualizada: $numerosInsert");
  
}