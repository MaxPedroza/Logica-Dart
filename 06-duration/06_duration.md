# Duration em Dart

O `Duration` é um objeto em Dart que representa um intervalo de tempo. Ele é fundamental para trabalhar com operações temporais, como medir tempo de execução, definir timeouts, criar cronômetros, agendar tarefas e calcular diferenças entre datas.

---

## Índice

1. [Introdução](#introdução)
2. [Criando Durações](#criando-durações)
3. [Operações com Durações](#operações-com-durações)
4. [Convertendo Unidades](#convertendo-unidades)
5. [Comparando Durações](#comparando-durações)
6. [Propriedades Úteis](#propriedades-úteis)
7. [Exemplos Práticos](#exemplos-práticos)
8. [Boas Práticas](#boas-práticas)

---

## Introdução

A classe `Duration` é usada para representar uma quantidade de tempo, independente de um momento específico no calendário. Diferente de `DateTime`, que representa um ponto no tempo (uma data e hora específica), `Duration` representa _quanto tempo_ algo dura ou a diferença entre dois momentos.

Ela pode armazenar dias, horas, minutos, segundos, milissegundos e microssegundos.

---

## Criando Durações

Você pode criar uma `Duration` especificando qualquer combinação de unidades de tempo. Se você não especificar uma unidade, ela será considerada zero.

```dart
void main() {
  // Criando uma duração de 100 dias
  final duration = Duration(days: 100);
  print(duration); // Imprime: 2400:00:00.000000 (100 dias em horas)

  // Criando durações com diferentes unidades
  Duration umDia = Duration(days: 1);
  Duration umaHora = Duration(hours: 1);
  Duration trintaMinutos = Duration(minutes: 30);
  Duration quarentaSegundos = Duration(seconds: 40);

  // Combinando múltiplas unidades
  // Exemplo: 2 dias, 3 horas, 30 minutos, 45 segundos e 500 milissegundos
  Duration durationCompleta = Duration(
    days: 2,
    hours: 3,
    minutes: 30,
    seconds: 45,
    milliseconds: 500,
  );
  print(durationCompleta);
}
```

### Durações Constantes (`const`)

Se o valor da duração for conhecido em tempo de compilação, você pode usar `const` para otimizar o código.

```dart
// Duração constante de 45 minutos (ex: tempo de um jogo)
const firstHalf = Duration(minutes: 45);
const secondHalf = Duration(minutes: 45);
```

---

## Operações com Durações

Dart permite realizar operações aritméticas diretamente com objetos `Duration`, tornando o código muito intuitivo.

```dart
void main() {
  Duration dur1 = Duration(hours: 5);
  Duration dur2 = Duration(hours: 3);

  // Soma (+)
  Duration soma = dur1 + dur2;
  print("Soma: $soma"); // 8:00:00.000000

  // Subtração (-)
  Duration subtracao = dur1 - dur2;
  print("Subtração: $subtracao"); // 2:00:00.000000

  // Multiplicação (*)
  Duration vezes2 = dur1 * 2;
  print("Multiplicação: $vezes2"); // 10:00:00.000000

  // Divisão Inteira (~/)
  Duration dividido = dur1 ~/ 2;
  print("Divisão: $dividido"); // 2:30:00.000000

  // Negação (inverte o sinal)
  Duration negado = -dur1;
  print("Negado: $negado"); // -5:00:00.000000
}
```

---

## Convertendo Unidades

A classe `Duration` possui getters (`inDays`, `inHours`, `inMinutes`, etc.) que retornam o valor total da duração naquela unidade específica, arredondado para baixo (truncado).

```dart
void main() {
  Duration duracao = Duration(days: 1, hours: 2, minutes: 30); // Total: 26h 30m

  print("Duração total: $duracao");

  // Converte o TOTAL da duração para a unidade especificada
  print("Em dias: ${duracao.inDays}");           // 1
  print("Em horas: ${duracao.inHours}");         // 26 (1 dia + 2 horas)
  print("Em minutos: ${duracao.inMinutes}");     // 1590 (26 horas * 60 + 30 min)
  print("Em segundos: ${duracao.inSeconds}");    // 95400
  print("Em milissegundos: ${duracao.inMilliseconds}");
}
```

> **Nota:** Os conversores retornam números inteiros. Se você converter 1 hora e 30 minutos para horas (`inHours`), o resultado será `1`, pois a parte fracionária é descartada.

---

## Comparando Durações

Você pode comparar durações usando os operadores de comparação padrão (`<`, `>`, `<=`, `>=`) ou o método `compareTo`.

```dart
void main() {
  Duration d1 = Duration(hours: 2);
  Duration d2 = Duration(minutes: 120); // 2 horas
  Duration d3 = Duration(hours: 3);

  // Igualdade
  print(d1 == d2); // true (2 horas é igual a 120 minutos)

  // Comparadores
  print(d1 < d3);  // true (2h é menor que 3h)
  print(d1 > d3);  // false
  print(d1 <= d2); // true

  // Método compareTo
  // Retorna -1 (menor), 0 (igual) ou 1 (maior)
  print(d1.compareTo(d3)); // -1
}
```

---

## Propriedades Úteis

Existem algumas propriedades estáticas e de instância que facilitam verificações comuns.

```dart
void main() {
  Duration positivo = Duration(hours: 5);
  Duration negativo = Duration(hours: -2);
  Duration zero = Duration(seconds: 0);

  // isNegative: Verifica se a duração é negativa
  print(positivo.isNegative); // false
  print(negativo.isNegative); // true

  // Duration.zero: Uma constante para duração zero
  print(zero == Duration.zero); // true
}
```

---

## Exemplos Práticos

### 1. Medir Tempo de Execução

```dart
DateTime inicio = DateTime.now();

// ... código que demora para executar ...
for (int i = 0; i < 1000000; i++) {}

DateTime fim = DateTime.now();
Duration tempoExecucao = fim.difference(inicio);

print("A operação levou: ${tempoExecucao.inMilliseconds}ms");
```

### 2. Formatar Duração (Ex: Duração de Filme)

```dart
Duration filme = Duration(minutes: 145); // 2h 25m

int horas = filme.inHours;
int minutosRestantes = filme.inMinutes % 60;

print("Duração do filme: ${horas}h ${minutosRestantes}m");
// Saída: Duração do filme: 2h 25m
```

### 3. Calcular Tempo Restante (Countdown)

```dart
DateTime evento = DateTime(2025, 12, 31);
DateTime agora = DateTime.now();

Duration falta = evento.difference(agora);

print("Faltam ${falta.inDays} dias para o evento!");
```

---

## Boas Práticas

1.  **Use Constantes:** Sempre que possível, declare durações fixas como `const` para melhorar a performance.

    ```dart
    const Duration TIMEOUT = Duration(seconds: 30);
    ```

2.  **Seja Explícito:** Ao criar uma duração, use o parâmetro nomeado correto para evitar confusão.

    ```dart
    // Bom
    Duration(seconds: 5);

    // Ruim (se existisse um construtor posicional, seria confuso saber a unidade)
    ```

3.  **Use `Duration.zero`:** Prefira usar a constante `Duration.zero` em vez de `Duration(seconds: 0)` ou `Duration(days: 0)`.

4.  **Cuidado com Conversões:** Lembre-se que `inDays`, `inHours`, etc., retornam valores inteiros truncados. Para cálculos precisos, considere usar unidades menores (como milissegundos) e converter apenas no final.
