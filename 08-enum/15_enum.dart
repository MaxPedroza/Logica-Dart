// ========== ENUMERAÇÕES (ENUM) EM DART ==========
// Um enum é um tipo de dado que define um conjunto fixo de valores constantes
// Útil para representar estados, categorias ou opções limitadas
// Exemplo: dias da semana, cores, status de pedido, etc.

// ========== ENUM SIMPLES ==========
// Define um enum simples com apenas valores
// Define um enum chamado Cor com as cores básicas
enum Cor {
  vermelho, // Representa a cor vermelha
  verde,    // Representa a cor verde
  azul,     // Representa a cor azul
  amarelo,  // Representa a cor amarela
  preto,    // Representa a cor preta
  branco,   // Representa a cor branca
}

// Define um enum para os dias da semana
enum DiaSemana {
  segunda, // Segunda-feira
  terca,   // Terça-feira
  quarta,  // Quarta-feira
  quinta,  // Quinta-feira
  sexta,   // Sexta-feira
  sabado,  // Sábado
  domingo, // Domingo
}

// Define um enum para os status de um pedido
enum StatusPedido {
  pendente,    // Pedido criado mas não processado
  processando, // Pedido em processamento
  enviado,     // Pedido enviado para entrega
  entregue,    // Pedido entregue ao cliente
  cancelado,   // Pedido cancelado
}

// Define um enum para tamanhos de produtos
enum Tamanho {
  pequeno,     // Tamanho pequeno
  medio,       // Tamanho médio
  grande,      // Tamanho grande
  extraGrande, // Tamanho extra grande
}

// ========== ENUM COM MÉTODOS E PROPRIEDADES ==========
// Enums podem ter métodos e propriedades customizadas
// Define um enum para níveis de usuário com métodos e propriedades
enum Nivel {
  iniciante,     // Nível inicial
  intermediario, // Nível intermediário
  avancado,      // Nível avançado
  expert,        // Nível expert
  
  // O ponto e vírgula é necessário para separar os valores dos membros (métodos/propriedades)
  ;
  
  // Getter que retorna um inteiro representando os pontos necessários
  int get pontosNecessarios {
    // Inicia a estrutura de decisão switch baseada na instância atual (this)
    switch (this) {
      // Verifica se o nível é iniciante
      case Nivel.iniciante:
        // Retorna 0 se for iniciante
        return 0;
      // Verifica se o nível é intermediario
      case Nivel.intermediario:
        // Retorna 100 se for intermediario
        return 100;
      // Verifica se o nível é avancado
      case Nivel.avancado:
        // Retorna 500 se for avancado
        return 500;
      // Verifica se o nível é expert
      case Nivel.expert:
        // Retorna 1000 se for expert
        return 1000;
    }
  }
  
  // Getter que retorna uma descrição textual do nível
  String get descricao {
    // Avalia qual é o nível atual
    switch (this) {
      case Nivel.iniciante:
        return "Você está começando"; // Descrição para iniciante
      case Nivel.intermediario:
        return "Você tem experiência básica"; // Descrição para intermediário
      case Nivel.avancado:
        return "Você é avançado"; // Descrição para avançado
      case Nivel.expert:
        return "Você é um expert"; // Descrição para expert
    }
  }
}

void main() {
  // ========== USANDO ENUMS SIMPLES ==========
  
  print("========== USANDO ENUMS SIMPLES ==========\n");
  
  // Acessar valores do enum diretamente
  Cor corFavorita = Cor.azul; // Atribui o valor azul do enum Cor
  print("Cor favorita: $corFavorita");  // Imprime: Cor.azul
  
  // Acessar apenas o nome do valor (sem o prefixo do enum)
  print("Apenas o nome: ${corFavorita.name}");  // Imprime: azul
  
  // Acessar o índice (posição numérica na definição do enum, começando em 0)
  print("Índice: ${corFavorita.index}");  // Imprime: 2 (terceiro valor)

  // ========== ITERANDO SOBRE VALORES DO ENUM ==========
  
  print("\n========== ITERANDO SOBRE VALORES DO ENUM ==========\n");
  
  print("Todas as cores:");
  // Cor.values retorna uma lista com todos os valores do enum
  for (Cor cor in Cor.values) {
    // Imprime cada cor e seu índice
    print("  - $cor (índice: ${cor.index})");
  }
  
  print("\nTodos os dias da semana:");
  // Itera sobre todos os dias da semana
  for (DiaSemana dia in DiaSemana.values) {
    // Imprime apenas o nome do dia
    print("  - ${dia.name}");
  }

  // ========== COMPARANDO VALORES DE ENUM ==========
  
  print("\n========== COMPARANDO VALORES DE ENUM ==========\n");
  
  Cor cor1 = Cor.vermelho; // Define cor1 como vermelho
  Cor cor2 = Cor.vermelho; // Define cor2 como vermelho
  Cor cor3 = Cor.azul;     // Define cor3 como azul
  
  // Compara se cor1 é igual a cor2 (deve ser true)
  print("cor1 == cor2: ${cor1 == cor2}");  // true
  // Compara se cor1 é igual a cor3 (deve ser false)
  print("cor1 == cor3: ${cor1 == cor3}");  // false
  // Compara se cor1 é diferente de cor3 (deve ser true)
  print("cor1 != cor3: ${cor1 != cor3}");  // true

  // ========== USANDO SWITCH COM ENUM ==========
  
  print("\n========== USANDO SWITCH COM ENUM ==========\n");
  
  DiaSemana dia = DiaSemana.sexta; // Define o dia como sexta
  
  // Usa switch para verificar o valor do enum
  switch (dia) {
    // Agrupa casos para dias úteis (segunda a quinta)
    case DiaSemana.segunda:
    case DiaSemana.terca:
    case DiaSemana.quarta:
    case DiaSemana.quinta:
      print("É dia de semana");
      break; // Sai do switch
    // Caso específico para sexta-feira
    case DiaSemana.sexta:
      print("É sexta-feira (quase fim de semana)");
      break; // Sai do switch
    // Agrupa casos para fim de semana (sábado e domingo)
    case DiaSemana.sabado:
    case DiaSemana.domingo:
      print("É fim de semana");
      break; // Sai do switch
  }

  // ========== BUSCANDO VALOR DO ENUM POR NOME ==========
  
  print("\n========== BUSCANDO VALOR DO ENUM POR NOME ==========\n");
  
  // Obter um valor do enum pelo nome usando firstWhere
  String nomeCor = "verde";
  Cor corBuscada = Cor.values.firstWhere(
    (cor) => cor.name == nomeCor, // Condição de busca
    orElse: () => Cor.preto,  // Valor padrão retornado se não encontrar
  );
  print("Cor buscada (nome='$nomeCor'): $corBuscada");
  
  // Método mais simples usando byName (lança exceção se não encontrar)
  try {
    Cor cor = Cor.values.byName('azul'); // Tenta encontrar 'azul'
    print("Cor obtida por byName: $cor");
  } catch (e) {
    print("Cor não encontrada"); // Captura erro se o nome não existir
  }

  // ========== ENUM COM CONVERSÃO DE STRING ==========
  
  print("\n========== ENUM COM CONVERSÃO DE STRING ==========\n");
  
  // Converter enum para string
  StatusPedido status = StatusPedido.enviado;
  String statusTexto = status.name; // Obtém o nome como string ("enviado")
  print("Status como string: '$statusTexto'");
  
  // Converter string para enum
  String statusString = "entregue";
  // Busca o valor do enum que corresponde à string
  StatusPedido statusParsed = StatusPedido.values.byName(statusString);
  print("Status parseado: $statusParsed");

  // ========== USANDO ENUM EM CONDIÇÕES ==========
  
  print("\n========== USANDO ENUM EM CONDIÇÕES ==========\n");
  
  Tamanho tamanhoEscolhido = Tamanho.grande; // Define tamanho escolhido
  
  // Verifica se é grande ou extra grande
  if (tamanhoEscolhido == Tamanho.grande || tamanhoEscolhido == Tamanho.extraGrande) {
    print("Tamanho grande: requer mais material");
  } else if (tamanhoEscolhido == Tamanho.pequeno) {
    // Verifica se é pequeno
    print("Tamanho pequeno: econômico");
  } else {
    // Caso contrário (médio)
    print("Tamanho médio");
  }

  // ========== ENUM COM PROPRIEDADES E MÉTODOS ==========
  
  print("\n========== ENUM COM PROPRIEDADES E MÉTODOS ==========\n");
  
  Nivel nivelUsuario = Nivel.intermediario; // Define nível do usuário
  
  print("Nível: ${nivelUsuario.name}"); // Imprime nome
  print("Descrição: ${nivelUsuario.descricao}"); // Usa o getter descricao
  print("Pontos necessários: ${nivelUsuario.pontosNecessarios}"); // Usa o getter pontosNecessarios
  
  // Iterar sobre todos os níveis disponíveis
  print("\nTodos os níveis:");
  for (Nivel nivel in Nivel.values) {
    // Imprime informações detalhadas de cada nível
    print("  - ${nivel.name}: ${nivel.descricao} (${nivel.pontosNecessarios} pontos)");
  }

  // ========== LISTANDO VALORES DO ENUM ==========
  
  print("\n========== LISTANDO VALORES DO ENUM ==========\n");
  
  // Mapeia os valores para seus nomes e converte para lista
  print("Cores disponíveis: ${Cor.values.map((e) => e.name).toList()}");
  // Mapeia os valores para seus nomes e junta com vírgula
  print("Status de pedido: ${StatusPedido.values.map((e) => e.name).join(', ')}");

  // ========== USANDO ENUM EM FUNÇÃO ==========
  
  print("\n========== USANDO ENUM EM FUNÇÃO ==========\n");
  
  // Chama função passando valores do enum
  descrevePedido(StatusPedido.processando);
  descrevePedido(StatusPedido.entregue);
  descrevePedido(StatusPedido.cancelado);

  // ========== VALIDANDO VALORES DE ENUM ==========
  
  print("\n========== VALIDANDO VALORES DE ENUM ==========\n");
  
  String cor = "vermelho";
  // Verifica se existe alguma cor com esse nome
  bool corValida = Cor.values.any((c) => c.name == cor);
  print("Cor '$cor' é válida: $corValida");
  
  String dia = "terca";
  // Verifica se existe algum dia com esse nome
  bool diaValido = DiaSemana.values.any((d) => d.name == dia);
  print("Dia '$dia' é válido: $diaValido");
  
  String diaInvalido = "segunda-feira"; // Nome incorreto (deveria ser 'segunda')
  // Verifica se existe algum dia com esse nome
  bool diaInvalidoCheck = DiaSemana.values.any((d) => d.name == diaInvalido);
  print("Dia '$diaInvalido' é válido: $diaInvalidoCheck");

  // ========== CONTAGEM DE VALORES DO ENUM ==========
  
  print("\n========== CONTAGEM DE VALORES DO ENUM ==========\n");
  
  // Obtém a quantidade de valores em cada enum
  int quantidadeCores = Cor.values.length;
  int quantidadeDias = DiaSemana.values.length;
  int quantidadeNiveis = Nivel.values.length;
  
  print("Quantidade de cores: $quantidadeCores");
  print("Quantidade de dias: $quantidadeDias");
  print("Quantidade de níveis: $quantidadeNiveis");

  // ========== ENUM PARA MAPEAMENTO DE VALORES ==========
  
  print("\n========== ENUM PARA MAPEAMENTO DE VALORES ==========\n");
  
  // Cria um mapa onde a chave é o enum e o valor é uma string
  Map<StatusPedido, String> mensagens = {
    StatusPedido.pendente: "Seu pedido está pendente",
    StatusPedido.processando: "Seu pedido está sendo processado",
    StatusPedido.enviado: "Seu pedido foi enviado",
    StatusPedido.entregue: "Seu pedido foi entregue",
    StatusPedido.cancelado: "Seu pedido foi cancelado",
  };
  
  StatusPedido statusAtual = StatusPedido.enviado;
  // Acessa o mapa usando o valor do enum como chave
  print("Mensagem para $statusAtual: ${mensagens[statusAtual]}");

  // ========== EXEMPLO PRÁTICO: SISTEMA DE PERMISSÕES ==========
  
  print("\n========== EXEMPLO PRÁTICO: SISTEMA DE PERMISSÕES ==========\n");
  
  // Testa permissões para diferentes níveis
  verificaPermissao(Nivel.iniciante);
  verificaPermissao(Nivel.expert);

  // ========== EXEMPLO PRÁTICO: TRADUÇÃO COM ENUM ==========
  
  print("\n========== EXEMPLO PRÁTICO: TRADUÇÃO COM ENUM ==========\n");
  
  // Itera sobre as cores e traduz cada uma
  for (Cor cor in Cor.values) {
    String traducao = traduzCor(cor);
    print("$cor = $traducao");
  }

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Usar enum para valores predefinidos em vez de strings mágicas
  StatusPedido statusBom = StatusPedido.entregue;
  print("✓ Usando enum para status bem definido");
  
  // ✓ BOM: Validar se uma string corresponde a um valor do enum antes de usar
  String input = "processando";
  if (StatusPedido.values.any((s) => s.name == input)) {
    print("✓ Input '$input' é válido");
  }
  
  // ✓ BOM: Usar switch para tratar todos os casos do enum (exaustividade)
  demonstraSwitch(Tamanho.pequeno);
  
  // ✓ BOM: Dar nomes significativos e claros aos valores do enum
  print("✓ Nomes claros: pendente, processando, enviado");
  
  print("\nBoas práticas aplicadas ao código acima!");
}

// ========== FUNÇÕES DE SUPORTE ==========

/// Função que descreve o status de um pedido usando switch
void descrevePedido(StatusPedido status) {
  switch (status) {
    case StatusPedido.pendente:
      print("$status - Aguardando processamento");
    case StatusPedido.processando:
      print("$status - Em processamento");
    case StatusPedido.enviado:
      print("$status - A caminho do destino");
    case StatusPedido.entregue:
      print("$status - Entregue com sucesso");
    case StatusPedido.cancelado:
      print("$status - Cancelado pelo cliente");
  }
}

/// Função que verifica permissões baseado no nível do usuário
void verificaPermissao(Nivel nivel) {
  switch (nivel) {
    case Nivel.iniciante:
      print("$nivel - Pode: ler conteúdo básico");
    case Nivel.intermediario:
      print("$nivel - Pode: ler, criar conteúdo");
    case Nivel.avancado:
      print("$nivel - Pode: ler, criar, editar conteúdo");
    case Nivel.expert:
      print("$nivel - Pode: ler, criar, editar, deletar, gerenciar usuários");
  }
}

/// Função que traduz o nome da cor do enum para português (capitalizado)
String traduzCor(Cor cor) {
  switch (cor) {
    case Cor.vermelho:
      return "Vermelho";
    case Cor.verde:
      return "Verde";
    case Cor.azul:
      return "Azul";
    case Cor.amarelo:
      return "Amarelo";
    case Cor.preto:
      return "Preto";
    case Cor.branco:
      return "Branco";
  }
}

/// Função que demonstra o uso de switch exaustivo com enum
void demonstraSwitch(Tamanho tamanho) {
  switch (tamanho) {
    case Tamanho.pequeno:
      print("Tamanho pequeno selecionado");
    case Tamanho.medio:
      print("Tamanho médio selecionado");
    case Tamanho.grande:
      print("Tamanho grande selecionado");
    case Tamanho.extraGrande:
      print("Tamanho extra grande selecionado");
  }
}
