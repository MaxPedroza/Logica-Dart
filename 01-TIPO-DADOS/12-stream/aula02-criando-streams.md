# Criando Streams

## Índice
- [Formas de Criar Streams](#formas-de-criar-streams)
- [Usando async*](#usando-async)
- [Usando StreamController](#usando-streamcontroller)
- [Usando construtores especiais](#usando-construtores-especiais)
- [Exemplos Práticos](#exemplos-práticos)

---

## Formas de Criar Streams

Existem várias formas de criar streams em Dart, cada uma adequada para diferentes casos.

---

## Usando async*

A forma mais comum e recomendada. Use quando o stream pode ser descrito como uma sequência.

### Sintaxe Básica

```dart
Stream<T> nomeStream() async* {
  yield valor1;
  yield valor2;
  yield valor3;
}
```

### Exemplo 1: Stream Simples

```dart
Stream<int> numeros() async* {
  yield 1;
  yield 2;
  yield 3;
}

void main() async {
  await for (int n in numeros()) {
    print(n);
  }
}
```

### Exemplo 2: Stream com Loop

```dart
Stream<String> nomes() async* {
  List<String> lista = ['Ana', 'Bruno', 'Carlos'];
  
  for (String nome in lista) {
    yield nome;
  }
}

void main() async {
  await for (String nome in nomes()) {
    print('Nome: $nome');
  }
}
```

### Exemplo 3: Stream com Atraso (async*)

```dart
Stream<int> contagem() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print('Iniciando contagem...');
  
  await for (int numero in contagem()) {
    print('$numero...');
  }
  
  print('Contagem finalizada!');
}
```

### Exemplo 4: Stream Infinito

```dart
Stream<int> contador() async* {
  int i = 0;
  while (true) {
    yield i++;
    await Future.delayed(Duration(milliseconds: 500));
  }
}

void main() async {
  var limitado = contador().take(5);  // Pegar apenas 5 valores
  
  await for (int numero in limitado) {
    print(numero);  // 0, 1, 2, 3, 4
  }
}
```

---

## Usando StreamController

Use quando você precisa controlar manualmente quando emitir valores.

### Sintaxe Básica

```dart
var controller = StreamController<T>();

// Adicionar valores
controller.sink.add(valor);

// Fechar o stream
controller.sink.close();

// Escutar
controller.stream.listen((valor) {
  print(valor);
});
```

### Exemplo 1: StreamController Simples

```dart
void main() async {
  var controller = StreamController<int>();
  
  // Adicionar valores
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.close();
  
  // Escutar
  await for (int numero in controller.stream) {
    print('Número: $numero');
  }
}
```

### Exemplo 2: StreamController com Entrada do Usuário

```dart
void simulaEntradaUsuario(StreamController<String> controller) async {
  List<String> entradas = ['entrada1', 'entrada2', 'entrada3'];
  
  for (String entrada in entradas) {
    await Future.delayed(Duration(seconds: 1));
    controller.sink.add(entrada);
  }
  
  controller.sink.close();
}

void main() async {
  var controller = StreamController<String>();
  
  simulaEntradaUsuario(controller);
  
  await for (String entrada in controller.stream) {
    print('Usuário digitou: $entrada');
  }
}
```

### Exemplo 3: StreamController Broadcast

```dart
void main() async {
  var controller = StreamController<int>.broadcast();
  
  // Dois listeners
  controller.stream.listen((valor) {
    print('Listener 1: $valor');
  });
  
  controller.stream.listen((valor) {
    print('Listener 2: $valor');
  });
  
  controller.sink.add(10);
  controller.sink.add(20);
  controller.sink.close();
}
```

---

## Usando Construtores Especiais

### Future.asStream()

Converter um Future em Stream.

```dart
Future<String> buscar() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dados carregados';
}

void main() async {
  var stream = buscar().asStream();
  
  await for (String dados in stream) {
    print(dados);
  }
}
```

### Stream.fromIterable()

Converter uma coleção em Stream.

```dart
void main() async {
  List<int> lista = [10, 20, 30, 40];
  var stream = Stream.fromIterable(lista);
  
  await for (int numero in stream) {
    print(numero);
  }
}
```

### Stream.periodic()

Criar stream que emite valores periodicamente.

```dart
void main() async {
  var stream = Stream<int>.periodic(
    Duration(seconds: 1),
    (contador) => contador
  );
  
  var limitado = stream.take(5);
  
  await for (int numero in limitado) {
    print('Emissão $numero');
  }
}
```

### Stream.value()

Stream com um único valor.

```dart
void main() async {
  var stream = Stream<String>.value('Única mensagem');
  
  await for (String msg in stream) {
    print(msg);
  }
}
```

### Stream.error()

Stream que emite um erro.

```dart
void main() async {
  var stream = Stream<int>.error(Exception('Erro intencional'));
  
  try {
    await for (int numero in stream) {
      print(numero);
    }
  } catch (erro) {
    print('Capturou: $erro');
  }
}
```

### Stream.empty()

Stream vazio (não emite nada).

```dart
void main() async {
  var stream = Stream<int>.empty();
  
  var count = 0;
  await for (int numero in stream) {
    count++;
  }
  
  print('Total de elementos: $count');  // 0
}
```

---

## Exemplos Práticos

### Exemplo 1: Stream de Temperatura

```dart
Stream<double> sensoresTemperatura() async* {
  double temp = 20.0;
  
  for (int i = 0; i < 5; i++) {
    temp += (i + 1) * 0.5;
    await Future.delayed(Duration(seconds: 1));
    yield temp;
  }
}

void main() async {
  print('Lendo temperatura...');
  
  await for (double temp in sensoresTemperatura()) {
    print('Temperatura: ${temp.toStringAsFixed(1)}°C');
  }
}
```

### Exemplo 2: Stream de Posição GPS

```dart
Stream<Map<String, double>> localizacao() async* {
  List<Map<String, double>> posicoes = [
    {'latitude': -23.5505, 'longitude': -46.6333},  // São Paulo
    {'latitude': -22.9068, 'longitude': -43.1729},  // Rio
    {'latitude': -19.9167, 'longitude': -43.9167},  // BH
  ];
  
  for (var pos in posicoes) {
    await Future.delayed(Duration(seconds: 1));
    yield pos;
  }
}

void main() async {
  await for (var pos in localizacao()) {
    print('Lat: ${pos['latitude']}, Long: ${pos['longitude']}');
  }
}
```

### Exemplo 3: Stream de Requisições HTTP (Simulado)

```dart
Stream<String> buscarDados(String url) async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'Dados da requisição $i para $url';
  }
}

void main() async {
  await for (String dados in buscarDados('https://api.exemplo.com')) {
    print(dados);
  }
}
```

---

## ✅ Padrões Recomendados

### 1. Para Sequências Simples: Use async*

```dart
// ✅ BOM
Stream<int> numeros() async* {
  for (int i = 0; i < 5; i++) {
    yield i;
  }
}
```

### 2. Para Controle Manual: Use StreamController

```dart
// ✅ BOM
var controller = StreamController<int>();
controller.sink.add(1);
```

### 3. Para Conversão de Iterable: Use Stream.fromIterable()

```dart
// ✅ BOM
var stream = Stream.fromIterable([1, 2, 3]);
```

### 4. Para Valores Periódicos: Use Stream.periodic()

```dart
// ✅ BOM
var stream = Stream<int>.periodic(Duration(seconds: 1), (i) => i);
```

---

## Tabela Comparativa

| Forma | Uso | Vantagem |
|---|---|---|
| `async*` | Sequências simples | Legível, natural |
| `StreamController` | Controle manual | Flexibilidade |
| `Stream.fromIterable()` | Converter coleção | Simples |
| `Stream.periodic()` | Valores periódicos | Automático |
| `Future.asStream()` | Converter Future | Integração |

---

## Ver Também
- [Aula 01: Introdução a Streams](aula01-introducao.md)
- [Aula 03: Escutando Streams](aula03-listen.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
