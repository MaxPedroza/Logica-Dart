// ========== ENUMERAÇÕES (ENUM) EM DART ==========
// Um enum é um tipo de dado que define um conjunto fixo de valores constantes
// Útil para representar estados, categorias ou opções limitadas
// Exemplo: dias da semana, cores, status de pedido, etc.

// ========== ENUM SIMPLES ==========
// Define um enum simples com apenas valores
enum Cor {
  vermelho,
  verde,
  azul,
  amarelo,
  preto,
  branco,
}

enum DiaSemana {
  segunda,
  terca,
  quarta,
  quinta,
  sexta,
  sabado,
  domingo,
}

enum StatusPedido {
  pendente,
  processando,
  enviado,
  entregue,
  cancelado,
}

enum Tamanho {
  pequeno,
  medio,
  grande,
  extraGrande,
}

// ========== ENUM COM MÉTODOS E PROPRIEDADES ==========
// Enums podem ter métodos e propriedades customizadas
enum Nivel {
  iniciante,
  intermediario,
  avancado,
  expert,
  
  // Propriedade: retorna o número de pontos necessários para atingir cada nível
  ;
  
  int get pontosNecessarios {
    switch (this) {
      case Nivel.iniciante:
        return 0;
      case Nivel.intermediario:
        return 100;
      case Nivel.avancado:
        return 500;
      case Nivel.expert:
        return 1000;
    }
  }
  
  // Método: retorna uma descrição do nível
  String get descricao {
    switch (this) {
      case Nivel.iniciante:
        return "Você está começando";
      case Nivel.intermediario:
        return "Você tem experiência básica";
      case Nivel.avancado:
        return "Você é avançado";
      case Nivel.expert:
        return "Você é um expert";
    }
  }
}

void main() {
  // ========== USANDO ENUMS SIMPLES ==========
  
  print("========== USANDO ENUMS SIMPLES ==========\n");
  
  // Acessar valores do enum
  Cor corFavorita = Cor.azul;
  print("Cor favorita: $corFavorita");  // Imprime: Cor.azul
  
  // Acessar apenas o nome (sem o prefixo do enum)
  print("Apenas o nome: ${corFavorita.name}");  // Imprime: azul
  
  // Acessar o índice (posição na definição do enum)
  print("Índice: ${corFavorita.index}");  // Imprime: 2 (terceiro valor)

  // ========== ITERANDO SOBRE VALORES DO ENUM ==========
  
  print("\n========== ITERANDO SOBRE VALORES DO ENUM ==========\n");
  
  print("Todas as cores:");
  for (Cor cor in Cor.values) {
    print("  - $cor (índice: ${cor.index})");
  }
  
  print("\nTodos os dias da semana:");
  for (DiaSemana dia in DiaSemana.values) {
    print("  - ${dia.name}");
  }

  // ========== COMPARANDO VALORES DE ENUM ==========
  
  print("\n========== COMPARANDO VALORES DE ENUM ==========\n");
  
  Cor cor1 = Cor.vermelho;
  Cor cor2 = Cor.vermelho;
  Cor cor3 = Cor.azul;
  
  print("cor1 == cor2: ${cor1 == cor2}");  // true
  print("cor1 == cor3: ${cor1 == cor3}");  // false
  print("cor1 != cor3: ${cor1 != cor3}");  // true

  // ========== USANDO SWITCH COM ENUM ==========
  
  print("\n========== USANDO SWITCH COM ENUM ==========\n");
  
  DiaSemana dia = DiaSemana.sexta;
  
  switch (dia) {
    case DiaSemana.segunda:
    case DiaSemana.terca:
    case DiaSemana.quarta:
    case DiaSemana.quinta:
      print("É dia de semana");
      break;
    case DiaSemana.sexta:
      print("É sexta-feira (quase fim de semana)");
      break;
    case DiaSemana.sabado:
    case DiaSemana.domingo:
      print("É fim de semana");
      break;
  }

  // ========== BUSCANDO VALOR DO ENUM POR NOME ==========
  
  print("\n========== BUSCANDO VALOR DO ENUM POR NOME ==========\n");
  
  // Obter um valor do enum pelo nome
  String nomeCor = "verde";
  Cor corBuscada = Cor.values.firstWhere(
    (cor) => cor.name == nomeCor,
    orElse: () => Cor.preto,  // Valor padrão se não encontrar
  );
  print("Cor buscada (nome='$nomeCor'): $corBuscada");
  
  // Método mais simples com parse
  try {
    Cor cor = Cor.values.byName('azul');
    print("Cor obtida por byName: $cor");
  } catch (e) {
    print("Cor não encontrada");
  }

  // ========== ENUM COM CONVERSÃO DE STRING ==========
  
  print("\n========== ENUM COM CONVERSÃO DE STRING ==========\n");
  
  // Converter enum para string
  StatusPedido status = StatusPedido.enviado;
  String statusTexto = status.name;
  print("Status como string: '$statusTexto'");
  
  // Converter string para enum
  String statusString = "entregue";
  StatusPedido statusParsed = StatusPedido.values.byName(statusString);
  print("Status parseado: $statusParsed");

  // ========== USANDO ENUM EM CONDIÇÕES ==========
  
  print("\n========== USANDO ENUM EM CONDIÇÕES ==========\n");
  
  Tamanho tamanhoEscolhido = Tamanho.grande;
  
  if (tamanhoEscolhido == Tamanho.grande || tamanhoEscolhido == Tamanho.extraGrande) {
    print("Tamanho grande: requer mais material");
  } else if (tamanhoEscolhido == Tamanho.pequeno) {
    print("Tamanho pequeno: econômico");
  } else {
    print("Tamanho médio");
  }

  // ========== ENUM COM PROPRIEDADES E MÉTODOS ==========
  
  print("\n========== ENUM COM PROPRIEDADES E MÉTODOS ==========\n");
  
  Nivel nivelUsuario = Nivel.intermediario;
  
  print("Nível: ${nivelUsuario.name}");
  print("Descrição: ${nivelUsuario.descricao}");
  print("Pontos necessários: ${nivelUsuario.pontosNecessarios}");
  
  // Iterar sobre todos os níveis
  print("\nTodos os níveis:");
  for (Nivel nivel in Nivel.values) {
    print("  - ${nivel.name}: ${nivel.descricao} (${nivel.pontosNecessarios} pontos)");
  }

  // ========== LISTANDO VALORES DO ENUM ==========
  
  print("\n========== LISTANDO VALORES DO ENUM ==========\n");
  
  print("Cores disponíveis: ${Cor.values.map((e) => e.name).toList()}");
  print("Status de pedido: ${StatusPedido.values.map((e) => e.name).join(', ')}");

  // ========== USANDO ENUM EM FUNÇÃO ==========
  
  print("\n========== USANDO ENUM EM FUNÇÃO ==========\n");
  
  descrevePedido(StatusPedido.processando);
  descrevePedido(StatusPedido.entregue);
  descrevePedido(StatusPedido.cancelado);

  // ========== VALIDANDO VALORES DE ENUM ==========
  
  print("\n========== VALIDANDO VALORES DE ENUM ==========\n");
  
  String cor = "vermelho";
  bool corValida = Cor.values.any((c) => c.name == cor);
  print("Cor '$cor' é válida: $corValida");
  
  String dia = "terca";
  bool diaValido = DiaSemana.values.any((d) => d.name == dia);
  print("Dia '$dia' é válido: $diaValido");
  
  String diaInvalido = "segunda-feira";
  bool diaInvalidoCheck = DiaSemana.values.any((d) => d.name == diaInvalido);
  print("Dia '$diaInvalido' é válido: $diaInvalidoCheck");

  // ========== CONTAGEM DE VALORES DO ENUM ==========
  
  print("\n========== CONTAGEM DE VALORES DO ENUM ==========\n");
  
  int quantidadeCores = Cor.values.length;
  int quantidadeDias = DiaSemana.values.length;
  int quantidadeNiveis = Nivel.values.length;
  
  print("Quantidade de cores: $quantidadeCores");
  print("Quantidade de dias: $quantidadeDias");
  print("Quantidade de níveis: $quantidadeNiveis");

  // ========== ENUM PARA MAPEAMENTO DE VALORES ==========
  
  print("\n========== ENUM PARA MAPEAMENTO DE VALORES ==========\n");
  
  // Usar enum como chave em mapa
  Map<StatusPedido, String> mensagens = {
    StatusPedido.pendente: "Seu pedido está pendente",
    StatusPedido.processando: "Seu pedido está sendo processado",
    StatusPedido.enviado: "Seu pedido foi enviado",
    StatusPedido.entregue: "Seu pedido foi entregue",
    StatusPedido.cancelado: "Seu pedido foi cancelado",
  };
  
  StatusPedido statusAtual = StatusPedido.enviado;
  print("Mensagem para $statusAtual: ${mensagens[statusAtual]}");

  // ========== EXEMPLO PRÁTICO: SISTEMA DE PERMISSÕES ==========
  
  print("\n========== EXEMPLO PRÁTICO: SISTEMA DE PERMISSÕES ==========\n");
  
  verificaPermissao(Nivel.iniciante);
  verificaPermissao(Nivel.expert);

  // ========== EXEMPLO PRÁTICO: TRADUÇÃO COM ENUM ==========
  
  print("\n========== EXEMPLO PRÁTICO: TRADUÇÃO COM ENUM ==========\n");
  
  for (Cor cor in Cor.values) {
    String traducao = traduzCor(cor);
    print("$cor = $traducao");
  }

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Usar enum para valores predefinidos
  StatusPedido statusBom = StatusPedido.entregue;
  print("✓ Usando enum para status bem definido");
  
  // ✓ BOM: Validar antes de usar
  String input = "processando";
  if (StatusPedido.values.any((s) => s.name == input)) {
    print("✓ Input '$input' é válido");
  }
  
  // ✓ BOM: Usar switch para todas as cases do enum
  demonstraSwitch(Tamanho.pequeno);
  
  // ✓ BOM: Dar nomes significativos aos valores
  print("✓ Nomes claros: pendente, processando, enviado");
  
  print("\nBoas práticas aplicadas ao código acima!");
}

// ========== FUNÇÕES DE SUPORTE ==========

/// Descreve o status de um pedido
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

/// Verifica permissões baseado no nível
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

/// Traduz a cor para português
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

/// Demonstra o uso de switch exhaustivo com enum
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
