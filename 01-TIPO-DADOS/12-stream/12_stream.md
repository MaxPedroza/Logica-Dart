# Streams em Dart

Um `Stream` é uma sequência de eventos assíncronos que podem ser escutados e processados. Diferente de listas (que têm todos os elementos de uma vez), streams emitem dados ao longo do tempo. Se você vem de outras linguagens, pode conhecê-los como _Observables_, _Event Emitters_ ou _RxJS Streams_.

---

## 📚 Documentação por Aula

> Acesse os arquivos de documentação detalhada para cada tema:

| # | Tema | Arquivo |
|---|------|---------|
| 1 | Introdução a Streams | [aula01-introducao.md](aula01-introducao.md) |
| 2 | Criando Streams | [aula02-criando-streams.md](aula02-criando-streams.md) |
| 3 | Escutando Streams (listen) | [aula03-listen.md](aula03-listen.md) |
| 4 | map - Transformar Eventos | [aula04-map.md](aula04-map.md) |
| 5 | where - Filtrar Eventos | [aula05-where.md](aula05-where.md) |
| 6 | Future vs Stream | [aula06-future-vs-stream.md](aula06-future-vs-stream.md) |
| 7 | Tratamento de Erros | [aula07-erro.md](aula07-erro.md) |
| 8 | Broadcast Streams | [aula08-broadcast.md](aula08-broadcast.md) |
| 9 | Combinando Streams | [aula09-combinando.md](aula09-combinando.md) |
| 10 | StreamController | [aula10-streamcontroller.md](aula10-streamcontroller.md) |
| 11 | Padrões e Boas Práticas | [aula11-padroes.md](aula11-padroes.md) |

---

## Índice

1. [Introdução](#introdução)
2. [Tipos de Streams](#tipos-de-streams)
3. [Criando um Stream](#criando-um-stream)
4. [Escutando um Stream](#escutando-um-stream)
5. [Transformando Streams](#transformando-streams)
6. [Tratamento de Erros](#tratamento-de-erros)
7. [Casos de Uso](#casos-de-uso)
8. [Boas Práticas](#boas-práticas)

---

## Introdução

Um `Stream` em Dart é uma forma elegante de trabalhar com dados que chegam **ao longo do tempo**, em vez de tudo de uma vez. Exemplos:

- Cliques de botão do usuário
- Dados de um sensor
- Respostas de um servidor em tempo real
- Atualizações de localização GPS
- Entrada do usuário

```dart
// Um stream simples que emite números
Stream<int> contagem() async* {
  for (int i = 0; i < 5; i++) {
    yield i;  // Emitir valor
  }
}
```

---

## Tipos de Streams

### Stream Simples

Permite uma única escuta (listener).

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  await for (int n in numeros()) {
    print(n);
  }
}
```

### Broadcast Stream

Permite múltiplas escutas (listeners).

```dart
Stream<int> contagem() async* {
  for (int i = 0; i < 3; i++) {
    yield i;
  }
}

void main() async {
  var stream = contagem().asBroadcastStream();
  
  // Dois listeners podem escutar simultaneamente
  stream.listen((valor) => print('Listener 1: $valor'));
  stream.listen((valor) => print('Listener 2: $valor'));
}
```

---

## Criando um Stream

### Usando async*

```dart
Stream<String> saudacoes() async* {
  yield 'Olá';
  yield 'Mundo';
  yield 'Dart';
}
```

### Usando StreamController

```dart
var controller = StreamController<int>();

controller.sink.add(1);
controller.sink.add(2);
controller.sink.close();
```

### Usando Future.asStream

```dart
Future<String> buscarDados() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dados carregados';
}

void main() async {
  var stream = buscarDados().asStream();
  stream.listen((dados) => print(dados));
}
```

---

## Escutando um Stream

### Usando listen()

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() {
  numeros().listen(
    (valor) => print('Valor: $valor'),
    onError: (erro) => print('Erro: $erro'),
    onDone: () => print('Stream finalizado'),
  );
}
```

### Usando await for

```dart
void main() async {
  await for (int n in numeros()) {
    print('Número: $n');
  }
  print('Finalizado');
}
```

---

## Transformando Streams

### map - Transformar Valores

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  var dobrados = numeros().map((n) => n * 2);
  
  await for (int n in dobrados) {
    print(n);  // 2, 4, 6
  }
}
```

### where - Filtrar Valores

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() async {
  var pares = numeros().where((n) => n % 2 == 0);
  
  await for (int n in pares) {
    print(n);  // 2, 4
  }
}
```

---

## Tratamento de Erros

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro no stream!');
}

void main() async {
  comErro().listen(
    (valor) => print('Valor: $valor'),
    onError: (erro) => print('Capturou erro: $erro'),
    onDone: () => print('Finalizado'),
  );
}
```

---

## Casos de Uso

### 1. Monitorar Cliques de Botão

```dart
// Em Flutter
button.onPressed.listen((evento) {
  print('Botão clicado!');
});
```

### 2. Buscar Dados em Tempo Real

```dart
Stream<String> buscarDadosEnTempo() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'Dado $i recebido';
  }
}
```

### 3. Processar Entrada do Usuário

```dart
Stream<String> entrada() async* {
  // Simular entrada do usuário
  yield 'entrada1';
  yield 'entrada2';
  yield 'entrada3';
}
```

---

## Boas Práticas

1. **Sempre Gerenciar Subscrições:** Cancele listeners quando não precisar mais.
   ```dart
   var subscription = stream.listen((_) {});
   // Depois...
   subscription.cancel();
   ```

2. **Usar await for em Contextos Assíncronos:** Mais legível que listen().
   ```dart
   await for (var evento in stream) {
     processar(evento);
   }
   ```

3. **Tratar Erros:** Sempre implemente `onError`.
   ```dart
   stream.listen(
     (valor) => print(valor),
     onError: (erro) => print('Erro: $erro'),
   );
   ```

4. **Broadcast quando Necessário:** Se múltiplos listeners vão escutar.
   ```dart
   var broadcast = streamSimples.asBroadcastStream();
   ```

5. **Avoid Nested Streams:** Use `flatMap` ou `asyncExpand`.
   ```dart
   stream.asyncExpand((item) => processarAssinc(item));
   ```

---

## Comparação: Stream vs Future vs List

| Característica | List | Future | Stream |
|---|---|---|---|
| **Elementos** | Múltiplos | Um | Múltiplos |
| **Timing** | Imediato | Uma vez | Ao longo do tempo |
| **Sincronismo** | Síncrono | Assíncrono | Assíncrono |
| **Cancelável** | Não | Não | Sim |
| **Valor Padrão** | [] | null/erro | - |

---

## Ver Também
- [Dart Documentation - Streams](https://dart.dev/tutorials/language/streams)
- [Dart Async Programming](https://dart.dev/guides/libraries/async-await)
- [Flutter Streams Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt/streams)
