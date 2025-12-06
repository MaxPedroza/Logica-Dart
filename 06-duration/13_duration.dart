void main() {
  // ========== CRIANDO DURAÇÕES ==========
  
  // Cria uma Duration de 100 dias
  // 'final' significa que a variável não pode ser reatribuída após inicialização
  final duration = Duration(days: 100);
  print(duration);  // Imprime: 100 days

  // ========== DURAÇÕES COM CONST (valores constantes em tempo de compilação) ==========
  
  // Cria uma Duration constante de 45 minutos (primeiro tempo de um jogo)
  // 'const' é como 'final', mas é avaliada em tempo de compilação
  const firstHalf = Duration(minutes: 45);
  
  // Cria uma Duration constante de 45 minutos (segundo tempo de um jogo)
  const secondHalf = Duration(minutes: 45);
  
  // Cria uma Duration final de 30 minutos (tempo extra)
  final overTime = Duration(minutes: 30);
  
  // ========== SOMANDO DURAÇÕES ==========
  
  // Soma as três durações: 45 + 45 + 30 = 120 minutos
  final totalDuration = firstHalf + secondHalf + overTime;

  // ========== CONVERTENDO DURAÇÕES PARA DIFERENTES UNIDADES ==========
  
  // Converte e imprime a duração total em SEGUNDOS: 120 * 60 = 7200 segundos
  print(totalDuration.inSeconds);  // Imprime: 7200
  
  // Converte e imprime a duração total em MINUTOS: 120 minutos
  print(totalDuration.inMinutes);  // Imprime: 120
  
  // Converte e imprime a duração total em HORAS: 2 horas
  print(totalDuration.inHours);    // Imprime: 2
  
  // Converte e imprime a duração total em DIAS: 0 dias (120 minutos é menor que 1 dia)
  print(totalDuration.inDays);     // Imprime: 0

  // ========== COMPARANDO DURAÇÕES ==========
  
  // compareTo() compara duas durações:
  // Retorna 0 se são iguais
  // Retorna -1 se a primeira é menor que a segunda
  // Retorna 1 se a primeira é maior que a segunda
  
  // Compara firstHalf (45 min) com secondHalf (45 min) - iguais
  var resultado = firstHalf.compareTo(secondHalf);
  print(resultado);  // Imprime: 0 (iguais)

  // Compara overTime (30 min) com firstHalf (45 min) - overTime é menor
  resultado = overTime.compareTo(firstHalf);
  print(resultado);  // Imprime: -1 (overTime < firstHalf)

  // Compara secondHalf (45 min) com overTime (30 min) - secondHalf é maior
  resultado = secondHalf.compareTo(overTime);
  print(resultado);  // Imprime: 1 (secondHalf > overTime)

  // ========== CRIANDO DURAÇÕES COM DIFERENTES UNIDADES ==========
  
  print("\n========== CRIANDO DURAÇÕES COM DIFERENTES UNIDADES ==========\n");
  
  // Durações podem ser criadas especificando diferentes unidades
  Duration duracao1 = Duration(days: 1);
  Duration duracao2 = Duration(hours: 24);
  Duration duracao3 = Duration(minutes: 1440);
  Duration duracao4 = Duration(seconds: 86400);
  Duration duracao5 = Duration(milliseconds: 86400000);
  Duration duracao6 = Duration(microseconds: 86400000000);
  
  print("1 dia = $duracao1");
  print("24 horas = $duracao2");
  print("1440 minutos = $duracao3");
  print("86400 segundos = $duracao4");
  print("86400000 milissegundos = $duracao5");
  print("86400000000 microssegundos = $duracao6");
  
  // Combinando múltiplas unidades
  Duration durationCompleta = Duration(
    days: 2,
    hours: 3,
    minutes: 30,
    seconds: 45,
    milliseconds: 500,
  );
  print("\nDuração completa (2d 3h 30m 45s 500ms): $durationCompleta");

  // ========== OPERAÇÕES COM DURAÇÕES ==========
  
  print("\n========== OPERAÇÕES COM DURAÇÕES ==========\n");
  
  Duration dur1 = Duration(hours: 5);
  Duration dur2 = Duration(hours: 3);
  
  // Soma de durações
  Duration soma = dur1 + dur2;
  print("$dur1 + $dur2 = $soma");  // 8 hours
  
  // Subtração de durações
  Duration subtracao = dur1 - dur2;
  print("$dur1 - $dur2 = $subtracao");  // 2 hours
  
  // Multiplicação de durações
  Duration vezes2 = dur1 * 2;
  print("$dur1 * 2 = $vezes2");  // 10 hours
  
  // Divisão de durações
  Duration dividido = dur1 ~/ 2;
  print("$dur1 ~/ 2 = $dividido");  // 2 hours (parte inteira)
  
  // Negação
  Duration negado = -dur1;
  print("-$dur1 = $negado");

  // ========== CONVERTENDO ENTRE UNIDADES ==========
  
  print("\n========== CONVERTENDO ENTRE UNIDADES ==========\n");
  
  Duration duracao = Duration(days: 3, hours: 4, minutes: 30);
  
  print("Duração: $duracao");
  print("Em dias: ${duracao.inDays}");
  print("Em horas: ${duracao.inHours}");
  print("Em minutos: ${duracao.inMinutes}");
  print("Em segundos: ${duracao.inSeconds}");
  print("Em milissegundos: ${duracao.inMilliseconds}");
  print("Em microssegundos: ${duracao.inMicroseconds}");

  // ========== COMPARANDO DURAÇÕES ==========
  
  print("\n========== COMPARANDO DURAÇÕES ==========\n");
  
  Duration d1 = Duration(hours: 2);
  Duration d2 = Duration(minutes: 120);
  Duration d3 = Duration(hours: 3);
  
  // Igualdade
  print("$d1 == $d2: ${d1 == d2}");  // true (2 horas = 120 minutos)
  print("$d1 == $d3: ${d1 == d3}");  // false
  
  // Comparação com <, >, <=, >=
  print("$d1 < $d3: ${d1 < d3}");    // true
  print("$d1 > $d3: ${d1 > d3}");    // false
  print("$d1 <= $d3: ${d1 <= d3}");  // true
  print("$d1 >= $d3: ${d1 >= d3}");  // false

  // ========== VERIFICANDO PROPRIEDADES ==========
  
  print("\n========== VERIFICANDO PROPRIEDADES ==========\n");
  
  Duration duracao7 = Duration(hours: 5);
  Duration duracao8 = Duration(hours: -2);
  Duration duracao9 = Duration(seconds: 0);
  
  // isNegative - Verifica se a duração é negativa
  print("Duration(hours: 5).isNegative: ${duracao7.isNegative}");      // false
  print("Duration(hours: -2).isNegative: ${duracao8.isNegative}");     // true
  print("Duration(seconds: 0).isNegative: ${duracao9.isNegative}");    // false
  
  // Verificar se é zero
  print("Duration(seconds: 0) == Duration.zero: ${duracao9 == Duration.zero}");  // true

  // ========== EXEMPLOS PRÁTICOS ==========
  
  print("\n========== EXEMPLOS PRÁTICOS ==========\n");
  
  // 1. Medir tempo de execução
  print("1. Medir tempo de execução:");
  DateTime inicio = DateTime.now();
  // Simular processamento
  for (int i = 0; i < 100000; i++) {
    // fazer algo
  }
  DateTime fim = DateTime.now();
  Duration tempoExecucao = fim.difference(inicio);
  print("Tempo de execução: ${tempoExecucao.inMilliseconds}ms");
  
  // 2. Cronômetro
  print("\n2. Cronômetro:");
  Duration tempoRestante = Duration(minutes: 5);
  print("Tempo restante: ${tempoRestante.inMinutes}:${(tempoRestante.inSeconds % 60).toString().padLeft(2, '0')}");
  
  // 3. Intervalo de repouso
  print("\n3. Intervalo de repouso:");
  Duration tempoTreino = Duration(minutes: 30);
  Duration intervaloRepouso = Duration(minutes: 2);
  print("Tempo de treino: ${tempoTreino.inMinutes} minutos");
  print("Intervalo de repouso: ${intervaloRepouso.inSeconds} segundos");
  
  // 4. Duração de filme
  print("\n4. Duração de filme:");
  Duration durationFilme = Duration(hours: 2, minutes: 30);
  int horas = durationFilme.inHours;
  int minutos = durationFilme.inMinutes % 60;
  print("Duração do filme: ${horas}h ${minutos}m");
  
  // 5. Tempo até evento
  print("\n5. Tempo até evento:");
  Duration tempoAte2025 = DateTime(2025, 12, 31).difference(DateTime.now());
  print("Dias até fim do ano: ${tempoAte2025.inDays}");

  // ========== OPERADOR MULTIPLICATIVO ==========
  
  print("\n========== OPERADOR MULTIPLICATIVO ==========\n");
  
  Duration duracao10 = Duration(minutes: 30);
  
  print("Duração original: $duracao10");
  print("Duração * 2: ${duracao10 * 2}");      // 1 hour
  print("Duração * 0.5: ${duracao10 * 0.5}");  // 15 minutes
  print("Duração * 3: ${duracao10 * 3}");      // 1.5 hours

  // ========== DURAÇÕES ESPECIAIS ==========
  
  print("\n========== DURAÇÕES ESPECIAIS ==========\n");
  
  // Duration.zero - Duração de zero
  Duration zero = Duration.zero;
  print("Duration.zero: $zero");
  
  // Duração negativa (tempo no passado)
  Duration passado = Duration(hours: -2);
  print("Duração negativa: $passado");
  
  // Máxima duração
  Duration maxima = Duration(days: 1000000);  // Um número grande
  print("Duração máxima (1 milhão de dias): $maxima");

  // ========== UTILIZANDO DURATION COM SLEEP ==========
  
  print("\n========== UTILIZANDO DURATION COM ASYNC/AWAIT ==========\n");
  
  // Duration é comumente usada com Future.delayed para esperas
  // Future.delayed(Duration(seconds: 2), () => print("Após 2 segundos"));
  print("(Exemplo de uso com Future.delayed requer async)");
  print("Exemplo: await Future.delayed(Duration(seconds: 2));");

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Usar constantes para durações fixas
  const Duration TIMEOUT_PADRAO = Duration(seconds: 30);
  const Duration INTERVALO_ATUALIZACAO = Duration(milliseconds: 500);
  
  // ✓ BOM: Ser específico com a unidade
  Duration espera = Duration(seconds: 5);  // Claro: 5 segundos
  
  // ✗ RUIM: Usar valores abstratos sem unidade clara
  Duration x = Duration(seconds: 5000);  // Pouco claro: é muito tempo?
  
  // ✓ BOM: Combinar múltiplas unidades para clareza
  Duration duracaoLonga = Duration(days: 1, hours: 2, minutes: 30);
  
  // ✓ BOM: Usar conversão apropriada para exibição
  Duration tempo = Duration(seconds: 3661);  // 1h 1m 1s
  int h = tempo.inHours;
  int m = (tempo.inMinutes % 60);
  int s = (tempo.inSeconds % 60);
  print("Tempo formatado: ${h}h ${m}m ${s}s");
  
  print("\nBoas práticas aplicadas ao código acima!");
}


