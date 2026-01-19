# Broadcast Streams

## Índice
- [O que é Broadcast](#o-que-é-broadcast)
- [Streams Simples vs Broadcast](#streams-simples-vs-broadcast)
- [Criando Broadcast Streams](#criando-broadcast-streams)
- [Exemplos Práticos](#exemplos-práticos)

---

## O que é Broadcast

Um **Broadcast Stream** permite **múltiplos listeners** escutarem simultaneamente. Um stream simples permite apenas um listener.

---

## Streams Simples vs Broadcast

### Stream Simples (Um Listener)

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  var stream = numeros();
  
  // Primeiro listener - FUNCIONA
  await for (int n in stream) {
    print('Listener 1: $n');
  }
  
  // Segundo listener - ERRO!
  // Cannot listen to a broadcast stream again.
  // await for (int n in stream) {
  //   print('Listener 2: $n');
  // }
}
```

### Broadcast Stream (Múltiplos Listeners)

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  var stream = numeros().asBroadcastStream();
  
  // Primeiro listener - FUNCIONA
  stream.listen((n) => print('Listener 1: $n'));
  
  // Segundo listener - FUNCIONA
  stream.listen((n) => print('Listener 2: $n'));
}
```

---

## Criando Broadcast Streams

### Converter para Broadcast

```dart
Stream<int> simples() async* {
  yield 1;
  yield 2;
  yield 3;
}

void main() {
  var broadcast = simples().asBroadcastStream();
  
  // Agora pode ter múltiplos listeners
  broadcast.listen((v) => print('L1: $v'));
  broadcast.listen((v) => print('L2: $v'));
}
```

### StreamController Broadcast

```dart
void main() {
  // Criar como broadcast desde o início
  var controller = StreamController<int>.broadcast();
  
  // Pode adicionar múltiplos listeners
  controller.stream.listen((v) => print('Listener 1: $v'));
  controller.stream.listen((v) => print('Listener 2: $v'));
  
  controller.sink.add(10);
  controller.sink.add(20);
  controller.sink.close();
}
```

---

## Exemplos Práticos

### Exemplo 1: Notificação para Múltiplos Subscribers

```dart
class EventBus {
  late StreamController<String> _controller;
  
  EventBus() {
    _controller = StreamController<String>.broadcast();
  }
  
  Stream<String> get events => _controller.stream;
  
  void emitir(String evento) {
    _controller.sink.add(evento);
  }
  
  void dispose() {
    _controller.close();
  }
}

void main() {
  var bus = EventBus();
  
  // Múltiplos subscribers
  bus.events.listen((evento) => print('Subscriber 1: $evento'));
  bus.events.listen((evento) => print('Subscriber 2: $evento'));
  bus.events.listen((evento) => print('Subscriber 3: $evento'));
  
  bus.emitir('Evento A');
  bus.emitir('Evento B');
  
  bus.dispose();
}
// Output:
// Subscriber 1: Evento A
// Subscriber 2: Evento A
// Subscriber 3: Evento A
// Subscriber 1: Evento B
// Subscriber 2: Evento B
// Subscriber 3: Evento B
```

### Exemplo 2: Chat em Tempo Real

```dart
class ChatRoom {
  final StreamController<String> _messageController = 
    StreamController<String>.broadcast();
  
  Stream<String> get messages => _messageController.stream;
  
  void enviarMensagem(String usuario, String mensagem) {
    _messageController.sink.add('$usuario: $mensagem');
  }
  
  void fechar() {
    _messageController.close();
  }
}

void main() {
  var sala = ChatRoom();
  
  // Três usuários escutando
  sala.messages.listen((msg) => print('Usuário 1 recebeu: $msg'));
  sala.messages.listen((msg) => print('Usuário 2 recebeu: $msg'));
  sala.messages.listen((msg) => print('Usuário 3 recebeu: $msg'));
  
  sala.enviarMensagem('Ana', 'Olá pessoal!');
  sala.enviarMensagem('Bruno', 'Oi Ana!');
  
  sala.fechar();
}
```

### Exemplo 3: Atualização de Estado Compartilhado

```dart
class AppState {
  final StreamController<int> _counterController = 
    StreamController<int>.broadcast();
  
  int _counter = 0;
  
  Stream<int> get counter => _counterController.stream;
  
  void incrementar() {
    _counter++;
    _counterController.sink.add(_counter);
  }
  
  void decrementar() {
    _counter--;
    _counterController.sink.add(_counter);
  }
  
  void dispose() {
    _counterController.close();
  }
}

void main() {
  var app = AppState();
  
  // Múltiplos componentes observando o contador
  app.counter.listen((valor) => print('Componente 1: $valor'));
  app.counter.listen((valor) => print('Componente 2: $valor'));
  app.counter.listen((valor) => print('Componente 3: $valor'));
  
  app.incrementar();  // Todos recebem 1
  app.incrementar();  // Todos recebem 2
  app.decrementar();  // Todos recebem 1
  
  app.dispose();
}
```

### Exemplo 4: Broadcast com Transformação

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() {
  var broadcast = numeros().asBroadcastStream();
  
  // Listener 1: recebe todos
  broadcast.listen((n) => print('L1: $n'));
  
  // Listener 2: recebe apenas pares
  broadcast
    .where((n) => n % 2 == 0)
    .listen((n) => print('L2 (pares): $n'));
  
  // Listener 3: recebe dobrados
  broadcast
    .map((n) => n * 2)
    .listen((n) => print('L3 (dobrados): $n'));
}
```

---

## Diferenças Principais

| Aspecto | Stream Simples | Broadcast |
|---|---|---|
| **Listeners** | Um | Múltiplos |
| **Reutilizável** | Não | Sim |
| **Memória** | Menos | Mais |
| **Síncrono** | Não | Não |
| **Uso** | Casos simples | Sistemas complexos |

---

## ✅ Padrões Recomendados

### 1. Use Broadcast para Múltiplos Listeners

```dart
// ✅ BOM
var broadcast = simpleStream.asBroadcastStream();
broadcast.listen(handler1);
broadcast.listen(handler2);

// ❌ EVITE
var stream = simpleStream;
stream.listen(handler1);  // OK
stream.listen(handler2);  // ERRO
```

### 2. Use StreamController.broadcast() para Novos Streams

```dart
// ✅ BOM (desde o início)
var controller = StreamController<int>.broadcast();
```

### 3. Feche Resources

```dart
// ✅ BOM
void dispose() {
  _controller.close();
}
```

---

## Ver Também
- [Aula 02: Criando Streams](aula02-criando-streams.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
