void main() {
  // ========== CRIANDO DATAS COM DATETIME ==========
  
  // Cria uma data específica: 5 de dezembro de 2025
  // Parâmetros: DateTime(ano, mês, dia)
  var date = DateTime(2025, 12, 05);
  print("Data: $date");  // Imprime: 2025-12-05 00:00:00.000

  // ========== CRIANDO DATAS E HORAS ==========
  
  // Cria uma data e hora específicas: 5 de dezembro de 2025, às 14:30:45
  // Parâmetros: DateTime(ano, mês, dia, hora, minuto, segundo)
  var dateTime = DateTime(2025, 12, 05, 14, 30, 45);
  print("Data e Hora: $dateTime");  // Imprime: 2025-12-05 14:30:45.000

  // ========== DATA E HORA ATUAL ==========
  
  // Obtém a data e hora atual do sistema
  var now = DateTime.now();
  print("Agora: $now");  // Imprime a data e hora do sistema

  // ========== ACESSANDO COMPONENTES DA DATA ==========
  
  // Obtém apenas o ANO
  print("Ano: ${now.year}");
  
  // Obtém apenas o MÊS (1-12)
  print("Mês: ${now.month}");
  
  // Obtém apenas o DIA do mês (1-31)
  print("Dia: ${now.day}");
  
  // Obtém apenas a HORA (0-23)
  print("Hora: ${now.hour}");
  
  // Obtém apenas o MINUTO (0-59)
  print("Minuto: ${now.minute}");
  
  // Obtém apenas o SEGUNDO (0-59)
  print("Segundo: ${now.second}");
  
  // Obtém o dia da semana (1 = segunda, 7 = domingo)
  print("Dia da semana: ${now.weekday}");

  // ========== OPERAÇÕES COM DATAS ==========
  
  // Adiciona 10 dias à data
  var futuro = now.add(Duration(days: 10));
  print("Daqui a 10 dias: $futuro");
  
  // Subtrai 5 dias da data
  var passado = now.subtract(Duration(days: 5));
  print("Há 5 dias atrás: $passado");
  
  // Adiciona horas, minutos e segundos
  var futuroCompleto = now.add(Duration(hours: 2, minutes: 30, seconds: 45));
  print("Daqui a 2h 30m 45s: $futuroCompleto");

  // ========== COMPARANDO DATAS ==========
  
  var data1 = DateTime(2025, 12, 05);
  var data2 = DateTime(2025, 12, 10);
  
  // Verifica se data1 é antes de data2
  if (data1.isBefore(data2)) {
    print("data1 é anterior a data2");  // Imprime esta linha
  }
  
  // Verifica se data1 é depois de data2
  if (data1.isAfter(data2)) {
    print("data1 é posterior a data2");
  } else {
    print("data1 NÃO é posterior a data2");  // Imprime esta linha
  }
  
  // Verifica se duas datas são iguais
  var data3 = DateTime(2025, 12, 05);
  if (data1.isAtSameMomentAs(data3)) {
    print("data1 e data3 são o mesmo momento");  // Imprime esta linha
  }

  // ========== CALCULANDO DIFERENÇA ENTRE DATAS ==========
  
  // Calcula a diferença entre duas datas (retorna Duration)
  var diferenca = data2.difference(data1);
  print("Diferença: ${diferenca.inDays} dias");  // Imprime: 5 dias
  
  // Converte para diferentes unidades
  print("Diferença em horas: ${diferenca.inHours}");
  print("Diferença em minutos: ${diferenca.inMinutes}");

  // ========== FORMATANDO DATAS ==========
  
  // Convertendo DateTime para String no formato ISO 8601
  var isoString = now.toIso8601String();
  print("Formato ISO: $isoString");
  
  // Convertendo para String simples
  var stringData = now.toString();
  print("Formato padrão: $stringData");

  // ========== CRIANDO DATETIME A PARTIR DE STRING ==========
  
  // Faz parse de uma string no formato ISO 8601 para DateTime
  var dataParsed = DateTime.parse("2025-12-05");
  print("Data parseada: $dataParsed");
  
  // Parse de data e hora completos
  var dateTimeParsed = DateTime.parse("2025-12-05T14:30:45");
  print("Data e hora parseada: $dateTimeParsed");
}