# StreamController

## Índice
- [O que é StreamController](#o-que-é-streamcontroller)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [StreamController.broadcast](#streamcontrollerbroadcast)
- [Boas Práticas](#boas-práticas)

---

## O que é StreamController

Um `StreamController` permite criar e controlar manualmente um stream, decidindo quando emitir valores, erros e quando finalizar.

---

## Sintaxe Básica

```dart
// Criar
var controller = StreamController<T>();

// Adicionar valores
controller.sink.add(valor);

// Adicionar erro
controller.sink.addError(erro);

// Finalizar
controller.sink.close();

// Escutar
controller.stream.listen((valor) {
  // processar
});
```

---

## Exemplos Práticos

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
  await for (int valor in controller.stream) {
    print('Valor: $valor');
  }
}
```

### Exemplo 2: StreamController com Atraso

```dart
void main() {
  var controller = StreamController<String>();
  
  // Simular entrada de dados
  simulaEntrada(controller);
  
  // Escutar
  controller.stream.listen(
    (valor) => print('Recebido: $valor'),
    onDone: () => print('Stream finalizado'),
  );
}

void simulaEntrada(StreamController<String> controller) async {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    controller.sink.add('Mensagem ${i + 1}');
  }
  controller.sink.close();
}
```

### Exemplo 3: StreamController com Erro

```dart
void main() {
  var controller = StreamController<int>();
  
  processarComErro(controller);
  
  controller.stream.listen(
    (valor) => print('Valor: $valor'),
    onError: (erro) => print('Erro: $erro'),
    onDone: () => print('Finalizado'),
  );
}

void processarComErro(StreamController<int> controller) async {
  controller.sink.add(1);
  controller.sink.add(2);
  
  await Future.delayed(Duration(seconds: 1));
  
  controller.sink.addError(Exception('Erro intencional!'));
  controller.sink.close();
}
```

### Exemplo 4: Service com StreamController

```dart
class DataService {
  final StreamController<List<String>> _controller =
    StreamController<List<String>>();
  
  Stream<List<String>> get data => _controller.stream;
  
  Future<void> carregarDados() async {
    try {
      for (int i = 0; i < 3; i++) {
        await Future.delayed(Duration(seconds: 1));
        _controller.sink.add(['Item ${i + 1}']);
      }
    } catch (e) {
      _controller.sink.addError(e);
    } finally {
      _controller.sink.close();
    }
  }
  
  void dispose() {
    _controller.close();
  }
}

void main() async {
  var service = DataService();
  
  service.carregarDados();
  
  try {
    await for (var dados in service.data) {
      print('Dados: $dados');
    }
  } finally {
    service.dispose();
  }
}
```

---

## StreamController.broadcast

Permite múltiplos listeners.

### Sintaxe

```dart
var controller = StreamController<T>.broadcast();
```

### Exemplo 1: Broadcast Simples

```dart
void main() {
  var controller = StreamController<int>.broadcast();
  
  // Múltiplos listeners
  controller.stream.listen((v) => print('L1: $v'));
  controller.stream.listen((v) => print('L2: $v'));
  
  controller.sink.add(10);
  controller.sink.add(20);
  controller.sink.close();
}
// Output:
// L1: 10
// L2: 10
// L1: 20
// L2: 20
```

### Exemplo 2: Event Bus com Broadcast

```dart
class EventBus {
  final StreamController<Event> _controller =
    StreamController<Event>.broadcast();
  
  Stream<Event> get events => _controller.stream;
  
  void emitir(Event evento) {
    _controller.sink.add(evento);
  }
  
  void dispose() {
    _controller.close();
  }
}

class Event {
  final String tipo;
  final dynamic dados;
  
  Event(this.tipo, this.dados);
}

void main() {
  var bus = EventBus();
  
  // Múltiplos subscribers
  bus.events.listen((e) => print('Handler 1: ${e.tipo}'));
  bus.events.listen((e) => print('Handler 2: ${e.tipo}'));
  
  bus.emitir(Event('click', {'x': 100, 'y': 200}));
  bus.emitir(Event('hover', {'elemento': 'botao'}));
  
  bus.dispose();
}
```

---

## Exemplo Completo: Sistema de Notificações

```dart
class NotificationService {
  final StreamController<String> _controller =
    StreamController<String>.broadcast();
  
  Stream<String> get notifications => _controller.stream;
  
  void notificar(String mensagem) {
    if (!_controller.isClosed) {
      _controller.sink.add(mensagem);
    }
  }
  
  void fechar() {
    _controller.close();
  }
}

void main() {
  var service = NotificationService();
  
  // Subscriber 1: log
  service.notifications.listen(
    (msg) => print('[LOG] $msg'),
  );
  
  // Subscriber 2: alerta
  service.notifications.listen(
    (msg) => print('[ALERTA] $msg'),
  );
  
  // Subscriber 3: salvar em BD
  service.notifications.listen(
    (msg) => print('[BD] Salvando: $msg'),
  );
  
  // Enviar notificações
  service.notificar('Usuário fez login');
  service.notificar('Dados atualizados');
  service.notificar('Novo arquivo criado');
  
  service.fechar();
}
```

---

## Propriedades Úteis

### sink

Acesso para adicionar valores/erros.

```dart
controller.sink.add(valor);
controller.sink.addError(erro);
```

### stream

O stream para escutar.

```dart
controller.stream.listen((valor) { });
```

### isClosed

Verificar se está fechado.

```dart
if (!controller.isClosed) {
  controller.sink.add(valor);
}
```

### onListen/onCancel

Callbacks quando listener é adicionado/removido.

```dart
var controller = StreamController<int>(
  onListen: () => print('Listener adicionado'),
  onCancel: () => print('Listener removido'),
);
```

---

## ✅ Boas Práticas

### 1. Sempre Fechar

```dart
// ✅ BOM
@override
void dispose() {
  _controller.close();
}
```

### 2. Verificar isClosed

```dart
// ✅ BOM
if (!_controller.isClosed) {
  _controller.sink.add(valor);
}
```

### 3. Use broadcast para Múltiplos Listeners

```dart
// ✅ BOM
final _controller = StreamController<int>.broadcast();

// ❌ EVITE
final _controller = StreamController<int>();
```

### 4. Tratar Erros Adequadamente

```dart
// ✅ BOM
try {
  _controller.sink.add(valor);
} catch (e) {
  _controller.sink.addError(e);
}
```

### 5. Limpar Recursos em dispose/cleanup

```dart
// ✅ BOM
class MyService {
  late StreamController<int> _controller;
  
  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
```

---

## Comparação: async* vs StreamController

| Aspecto | async* | StreamController |
|---|---|---|
| **Criação** | Simples | Mais verboso |
| **Controle** | Limitado | Total |
| **Múltiplos Listeners** | Broadcast necessário | .broadcast() |
| **Caso de Uso** | Sequências | Eventos |
| **Legibilidade** | Melhor | Mais complexo |

---

## Ver Também
- [Aula 02: Criando Streams](aula02-criando-streams.md)
- [Aula 08: Broadcast Streams](aula08-broadcast.md)
- [Aula 11: Padrões e Boas Práticas](aula11-padroes.md)
