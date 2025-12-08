# DateTime em Dart

O `DateTime` é a classe fundamental em Dart para representar um instante no tempo, incluindo data e hora. Ele permite manipular datas, realizar cálculos temporais, formatar saídas e comparar momentos no tempo.

---

## Índice

1. [Introdução](#introdução)
2. [Criando Datas e Horas](#criando-datas-e-horas)
3. [Acessando Componentes](#acessando-componentes)
4. [Operações com Datas](#operações-com-datas)
5. [Comparando Datas](#comparando-datas)
6. [Calculando Diferenças](#calculando-diferenças)
7. [Formatando e Convertendo](#formatando-e-convertendo)
8. [Boas Práticas](#boas-práticas)

---

## Introdução

A classe `DateTime` representa um ponto específico no tempo, com precisão de microssegundos. Ela pode ser usada para representar datas no fuso horário local ou em UTC (Tempo Universal Coordenado).

---

## Criando Datas e Horas

Existem várias formas de instanciar um objeto `DateTime`.

### Data Específica

Você pode criar uma data fornecendo ano, mês, dia, e opcionalmente hora, minuto, segundo, milissegundo e microssegundo.

```dart
void main() {
  // Apenas Data: 5 de dezembro de 2025 (hora será 00:00:00)
  var data = DateTime(2025, 12, 05);
  print("Data: $data");

  // Data e Hora: 5 de dezembro de 2025, às 14:30:45
  var dataHora = DateTime(2025, 12, 05, 14, 30, 45);
  print("Data e Hora: $dataHora");
}
```

### Data e Hora Atual (`now`)

Para obter o momento exato da execução do código, utilize o construtor nomeado `.now()`.

```dart
var agora = DateTime.now();
print("Agora: $agora");
```

### Data em UTC

Para criar uma data em UTC, use o construtor `.utc()`.

```dart
var dataUtc = DateTime.utc(2025, 12, 05);
```

---

## Acessando Componentes

Você pode acessar individualmente cada parte de uma data (ano, mês, dia, etc.) através de suas propriedades.

```dart
void main() {
  var agora = DateTime.now();

  print("Ano: ${agora.year}");
  print("Mês: ${agora.month}");       // 1 a 12
  print("Dia: ${agora.day}");         // 1 a 31
  print("Hora: ${agora.hour}");       // 0 a 23
  print("Minuto: ${agora.minute}");   // 0 a 59
  print("Segundo: ${agora.second}");  // 0 a 59

  // Dia da semana (1 = Segunda-feira, 7 = Domingo)
  print("Dia da semana: ${agora.weekday}");
}
```

---

## Operações com Datas

O `DateTime` trabalha em conjunto com a classe `Duration` para realizar operações de adição e subtração de tempo.

```dart
void main() {
  var hoje = DateTime.now();

  // Adicionar tempo (.add)
  var futuro = hoje.add(Duration(days: 10));
  print("Daqui a 10 dias: $futuro");

  var futuroCompleto = hoje.add(Duration(hours: 2, minutes: 30));
  print("Daqui a 2h 30m: $futuroCompleto");

  // Subtrair tempo (.subtract)
  var passado = hoje.subtract(Duration(days: 5));
  print("Há 5 dias atrás: $passado");
}
```

---

## Comparando Datas

Dart oferece métodos intuitivos para verificar a ordem cronológica das datas.

```dart
void main() {
  var data1 = DateTime(2025, 12, 05);
  var data2 = DateTime(2025, 12, 10);

  // isBefore: Verifica se vem ANTES
  if (data1.isBefore(data2)) {
    print("data1 é anterior a data2"); // Verdadeiro
  }

  // isAfter: Verifica se vem DEPOIS
  if (data2.isAfter(data1)) {
    print("data2 é posterior a data1"); // Verdadeiro
  }

  // isAtSameMomentAs: Verifica se são IGUAIS (mesmo instante)
  var data3 = DateTime(2025, 12, 05);
  if (data1.isAtSameMomentAs(data3)) {
    print("São o mesmo momento");
  }

  // Operadores de comparação também funcionam se as datas forem convertidas ou comparadas de outra forma,
  // mas os métodos acima são mais legíveis e recomendados.
}
```

---

## Calculando Diferenças

Para saber o intervalo de tempo entre duas datas, utilize o método `.difference()`. O retorno será um objeto `Duration`.

```dart
void main() {
  var dataInicio = DateTime(2025, 12, 01);
  var dataFim = DateTime(2025, 12, 25);

  Duration diferenca = dataFim.difference(dataInicio);

  print("Dias de diferença: ${diferenca.inDays}"); // 24
  print("Horas de diferença: ${diferenca.inHours}");
}
```

---

## Formatando e Convertendo

### DateTime para String

O método padrão `.toString()` retorna uma representação legível, mas para formatos padronizados (como para APIs), use `.toIso8601String()`.

```dart
var agora = DateTime.now();

print(agora.toString());        // Ex: 2025-12-08 15:30:00.123456
print(agora.toIso8601String()); // Ex: 2025-12-08T15:30:00.123456
```

### String para DateTime (`parse`)

Você pode converter uma String formatada (ISO 8601) de volta para um objeto `DateTime`.

```dart
// Apenas data
var data = DateTime.parse("2025-12-05");
print(data.year); // 2025

// Data e Hora
var dataHora = DateTime.parse("2025-12-05T14:30:00Z"); // Z indica UTC
print(dataHora);
```

> **Nota:** Se a string não estiver em um formato válido, o método lançará uma exceção. Use `tryParse` se não tiver certeza do formato.

---

## Boas Práticas

1.  **Use UTC para Armazenamento:** Ao salvar datas em banco de dados ou enviar para APIs, prefira usar UTC (`toUtc()`) para evitar problemas com fusos horários. Converta para o horário local (`toLocal()`) apenas na hora de exibir para o usuário.
2.  **Cuidado com `month` e `weekday`:** Lembre-se que em Dart:

    - `month` vai de 1 (Janeiro) a 12 (Dezembro).
    - `weekday` vai de 1 (Segunda) a 7 (Domingo).
    - Isso é diferente de algumas linguagens onde começam com 0.

3.  **Manipulação de Datas:** Sempre use `add` e `subtract` com `Duration` em vez de tentar calcular milissegundos manualmente, pois isso lida corretamente com viradas de mês, ano e anos bissextos.

4.  **Formatação Visual:** Para formatar datas de forma amigável ao usuário (ex: "05/12/2025"), considere usar o pacote `intl` (pacote oficial do Dart), pois o `DateTime` nativo oferece apenas formatos básicos ISO.
