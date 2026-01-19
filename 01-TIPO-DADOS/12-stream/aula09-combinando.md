# Combinando Streams

## Índice
- [Métodos de Combinação](#métodos-de-combinação)
- [merge](#merge)
- [Zip](#zip)
- [CombineLatest](#combinelatest)
- [Exemplos Práticos](#exemplos-práticos)

---

## Métodos de Combinação

Dart oferece várias formas de combinar múltiplos streams em um único stream.

---

## merge

Combina múltiplos streams em um, emitindo valores de qualquer um deles.

### Sintaxe

```dart
Stream<T> merged = StreamGroup.merge([stream1, stream2, stream3]);
```

### Exemplo 1: Combinar Dois Streams

```dart
Stream<String> stream1() async* {
  yield 'A1';
  yield 'A2';
}

Stream<String> stream2() async* {
  yield 'B1';
  yield 'B2';
}

void main() async {
  var merged = StreamGroup.merge([stream1(), stream2()]);
  
  await for (String valor in merged) {
    print('Valor: $valor');
  }
  // Output (ordem pode variar):
  // Valor: A1
  // Valor: B1
  // Valor: A2
  // Valor: B2
}
```

### Exemplo 2: Merge com Tipos Diferentes

```dart
Stream<int> numeros() async* {
  yield 1;
  yield 2;
}

Stream<int> pares() async* {
  yield 10;
  yield 20;
}

void main() async {
  var merged = StreamGroup.merge([numeros(), pares()]);
  
  var soma = 0;
  await for (int valor in merged) {
    soma += valor;
    print('Soma parcial: $soma');
  }
}
```

---

## Zip

Combina streams emitindo quando **todos** emitirem simultaneamente.

```dart
Stream<String> nomes() async* {
  yield 'Ana';
  yield 'Bruno';
}

Stream<int> idades() async* {
  yield 25;
  yield 30;
}

void main() async {
  var zipped = StreamZip([nomes(), idades()]);
  
  await for (var lista in zipped) {
    print('${lista[0]}: ${lista[1]} anos');
  }
  // Output:
  // Ana: 25 anos
  // Bruno: 30 anos
}
```

---

## CombineLatest

Combina os últimos valores emitidos de cada stream.

```dart
// Nota: CombineLatest não está na biblioteca padrão
// Você precisa criar manualmente ou usar um package

Stream<int> valores1() async* {
  yield 1;
  yield 2;
  yield 3;
}

Stream<String> valores2() async* {
  yield 'A';
  yield 'B';
  yield 'C';
}

Stream<dynamic> combineLatest2<T1, T2>(
  Stream<T1> s1,
  Stream<T2> s2,
) async* {
  late T1 v1;
  late T2 v2;
  bool hasV1 = false, hasV2 = false;
  
  var merged = StreamGroup.merge([
    s1.map((v) {
      v1 = v;
      hasV1 = true;
      if (hasV1 && hasV2) yield [v1, v2];
    }),
    s2.map((v) {
      v2 = v;
      hasV2 = true;
      if (hasV1 && hasV2) yield [v1, v2];
    }),
  ]);
  
  yield* merged;
}
```

---

## Exemplos Práticos

### Exemplo 1: Sistema de Chat com Múltiplos Usuários

```dart
class Usuario {
  final String id;
  final StreamController<String> messageController;
  
  Usuario(this.id) : messageController = StreamController<String>();
  
  Stream<String> get mensagens => messageController.stream;
  
  void enviarMensagem(String msg) {
    messageController.sink.add('$id: $msg');
  }
}

void main() async {
  var ana = Usuario('Ana');
  var bruno = Usuario('Bruno');
  var carlos = Usuario('Carlos');
  
  // Combinar todos os streams
  var todasMensagens = StreamGroup.merge([
    ana.mensagens,
    bruno.mensagens,
    carlos.mensagens,
  ]);
  
  ana.enviarMensagem('Oi!');
  bruno.enviarMensagem('Olá!');
  carlos.enviarMensagem('E aí!');
  
  // Processar todas as mensagens
  await for (String msg in todasMensagens) {
    print('Chat: $msg');
  }
}
```

### Exemplo 2: Monitorar Múltiplos Sensores

```dart
Stream<double> sensorTemperatura() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield 20.0 + i;
  }
}

Stream<double> sensorUmidade() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(milliseconds: 700));
    yield 60.0 + i;
  }
}

Stream<int> sensorPressao() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(milliseconds: 600));
    yield 1000 + i;
  }
}

void main() async {
  print('Lendo sensores...');
  
  var todosSensores = StreamGroup.merge([
    sensorTemperatura().map((t) => 'Temp: $t°C'),
    sensorUmidade().map((u) => 'Umidade: $u%'),
    sensorPressao().map((p) => 'Pressão: $p hPa'),
  ]);
  
  await for (String leitura in todosSensores) {
    print(leitura);
  }
}
```

### Exemplo 3: Combinar Requisições API

```dart
Future<String> buscarDadosUser() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dados do Usuário';
}

Future<String> buscarDadosPosto() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dados do Posi';
}

Future<String> buscarNotificacoes() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Notificações';
}

void main() async {
  var todosFluxos = StreamGroup.merge([
    buscarDadosUser().asStream(),
    buscarDadosPosto().asStream(),
    buscarNotificacoes().asStream(),
  ]);
  
  await for (String dados in todosFluxos) {
    print('Carregado: $dados');
  }
}
```

### Exemplo 4: Zip com Sincronização

```dart
Stream<int> ids() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(milliseconds: 100));
    yield i;
  }
}

Stream<String> nomes() async* {
  for (String nome in ['Ana', 'Bruno', 'Carlos']) {
    await Future.delayed(Duration(milliseconds: 100));
    yield nome;
  }
}

void main() async {
  print('Combinando com zip:');
  
  var zipped = StreamZip([ids(), nomes()]);
  
  await for (var item in zipped) {
    print('ID: ${item[0]}, Nome: ${item[1]}');
  }
}
```

---

## Casos de Uso

| Método | Use Quando | Exemplo |
|---|---|---|
| **merge** | Múltiplas fontes, qualquer ordem | Logs de múltiplos servidores |
| **zip** | Sincronizar streams | IDs com nomes |
| **combineLatest** | Últimos valores importantes | Dashboard com dados |

---

## ✅ Padrões Recomendados

### 1. Use StreamGroup para Merge

```dart
// ✅ BOM
var merged = StreamGroup.merge([stream1, stream2, stream3]);
```

### 2. Use StreamZip para Sincronização

```dart
// ✅ BOM
var zipped = StreamZip([ids, nomes]);
```

### 3. Transformar Antes de Combinar

```dart
// ✅ BOM
var merged = StreamGroup.merge([
  stream1.map((v) => transformar(v)),
  stream2.map((v) => transformar(v)),
]);
```

---

## Necessário Importar

```dart
import 'dart:async';

// Para usar StreamGroup
StreamGroup<T>.merge([...])
StreamZip([...])
```

---

## Ver Também
- [Aula 04: map - Transformar Eventos](aula04-map.md)
- [Aula 05: where - Filtrar Eventos](aula05-where.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
