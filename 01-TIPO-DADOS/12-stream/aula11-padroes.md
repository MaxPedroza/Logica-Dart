# Padrões e Boas Práticas

## Índice
- [Boas Práticas](#boas-práticas)
- [Padrões Comuns](#padrões-comuns)
- [Erros Comuns](#erros-comuns)
- [Performance](#performance)

---

## Boas Práticas

### 1. Use await for em vez de listen()

```dart
// ✅ RECOMENDADO
await for (var valor in stream) {
  processar(valor);
}

// ❌ EVITE
stream.listen((valor) {
  processar(valor);
});
```

**Por quê?** `await for` é mais legível e mantém o contexto da função clara.

### 2. Sempre Tratar Erros

```dart
// ✅ BOM
try {
  await for (var valor in stream) {
    processar(valor);
  }
} catch (erro) {
  tratarErro(erro);
}

// ❌ NUNCA IGNORE ERROS
await for (var valor in stream) {
  processar(valor);  // E se lançar erro?
}
```

### 3. Cancelar Subscriptions

```dart
// ✅ BOM
var subscription = stream.listen((valor) {
  processar(valor);
});

// Mais tarde...
subscription.cancel();

// ✅ EM FLUTTER
@override
void dispose() {
  _subscription?.cancel();
  super.dispose();
}
```

### 4. Use Broadcast para Múltiplos Listeners

```dart
// ✅ BOM
var broadcast = stream.asBroadcastStream();
broadcast.listen(handler1);
broadcast.listen(handler2);

// ❌ EVITE
stream.listen(handler1);
stream.listen(handler2);  // Erro!
```

### 5. Feche StreamController

```dart
class MyService {
  final _controller = StreamController<int>();
  
  Stream<int> get stream => _controller.stream;
  
  // ✅ IMPORTANTE
  void dispose() {
    _controller.close();
  }
}
```

---

## Padrões Comuns

### Padrão 1: Repository com Stream

```dart
class UserRepository {
  final StreamController<List<User>> _usersController =
    StreamController<List<User>>();
  
  Stream<List<User>> get users => _usersController.stream;
  
  Future<void> carregarUsuarios() async {
    try {
      var usuarios = await fetchFromAPI();
      _usersController.sink.add(usuarios);
    } catch (e) {
      _usersController.addError(e);
    }
  }
  
  void dispose() {
    _usersController.close();
  }
}
```

### Padrão 2: BLoC (Business Logic Component)

```dart
class CounterBloc {
  final _counterController = StreamController<int>.broadcast();
  
  int _count = 0;
  
  Stream<int> get count => _counterController.stream;
  
  void incrementar() {
    _count++;
    _counterController.sink.add(_count);
  }
  
  void decrementar() {
    _count--;
    _counterController.sink.add(_count);
  }
  
  void dispose() {
    _counterController.close();
  }
}
```

### Padrão 3: Cache com Stream

```dart
class CacheService {
  final Map<String, dynamic> _cache = {};
  final StreamController<dynamic> _updatesController =
    StreamController<dynamic>.broadcast();
  
  Stream<dynamic> get updates => _updatesController.stream;
  
  void setValue(String chave, dynamic valor) {
    _cache[chave] = valor;
    _updatesController.sink.add({'chave': chave, 'valor': valor});
  }
  
  dynamic getValue(String chave) => _cache[chave];
  
  void dispose() {
    _updatesController.close();
  }
}
```

### Padrão 4: Polling com Stream

```dart
Stream<int> obterDadosComPolling(String url) async* {
  while (true) {
    try {
      var dados = await buscarDados(url);
      yield dados;
    } catch (e) {
      print('Erro na busca: $e');
    }
    
    await Future.delayed(Duration(seconds: 30));
  }
}
```

### Padrão 5: Transformação em Cadeia

```dart
// Buscar dados
Stream<User> obterUsuarios() async* {
  yield User(id: 1, nome: 'Ana');
  yield User(id: 2, nome: 'Bruno');
}

void main() async {
  var resultado = obterUsuarios()
    .where((user) => user.nome.startsWith('A'))        // Filtrar
    .map((user) => '${user.id}: ${user.nome}')         // Transformar
    .timeout(Duration(seconds: 10))                     // Timeout
    .handleError((e) => 'Erro: $e');                    // Tratar erro
  
  await for (String valor in resultado) {
    print(valor);
  }
}
```

---

## Erros Comuns

### Erro 1: Tentar Escutar Múltiplas Vezes

```dart
// ❌ ERRO
Stream<int> numeros() async* {
  yield 1;
  yield 2;
}

void main() async {
  var stream = numeros();
  
  await for (int n in stream) {
    print(n);
  }
  
  // Isso falha!
  await for (int n in stream) {
    print(n);
  }
}

// ✅ SOLUÇÃO
var broadcast = numeros().asBroadcastStream();
```

### Erro 2: Não Tratar Erro

```dart
// ❌ ERRO (ignora erro)
await for (var valor in streamComErro()) {
  processar(valor);
}

// ✅ SOLUÇÃO
try {
  await for (var valor in streamComErro()) {
    processar(valor);
  }
} catch (e) {
  tratarErro(e);
}
```

### Erro 3: Não Cancelar Subscription

```dart
// ❌ ERRO (em Flutter widget)
@override
void initState() {
  stream.listen((v) => setState(() { }));
  // Sem cancelamento = memory leak
}

// ✅ SOLUÇÃO
late StreamSubscription _subscription;

@override
void initState() {
  _subscription = stream.listen((v) => setState(() { }));
}

@override
void dispose() {
  _subscription.cancel();  // OBRIGATÓRIO
  super.dispose();
}
```

### Erro 4: Usar await em Non-Async Context

```dart
// ❌ ERRO
void main() {
  var valor = await stream.first;  // Erro! main não é async
}

// ✅ SOLUÇÃO
void main() async {
  var valor = await stream.first;
}
```

### Erro 5: Ignorar Broadcast

```dart
// ❌ ERRO (múltiplos listeners em stream simples)
var stream = numeros();
stream.listen((v) => print('L1: $v'));
stream.listen((v) => print('L2: $v'));  // Erro!

// ✅ SOLUÇÃO
var stream = numeros().asBroadcastStream();
stream.listen((v) => print('L1: $v'));
stream.listen((v) => print('L2: $v'));
```

---

## Performance

### 1. Evitar Streams Infinitos sem Limite

```dart
// ❌ Pode consumir muita memória
Stream<int> infinito() async* {
  int i = 0;
  while (true) {
    yield i++;
  }
}

// ✅ Use take()
infinito().take(100).forEach(print);
```

### 2. Usar takeWhile para Parada Condicional

```dart
// ✅ BOM
infinito().takeWhile((i) => i < 100).forEach(print);
```

### 3. Reutilizar Broadcast Streams

```dart
// ✅ BOM
var broadcast = stream.asBroadcastStream();
broadcast.listen(handler1);
broadcast.listen(handler2);
broadcast.listen(handler3);

// ❌ INEFICIENTE
stream.asBroadcastStream().listen(handler1);
stream.asBroadcastStream().listen(handler2);  // Novo stream cada vez
```

### 4. Usar Transformações Eficientes

```dart
// ✅ BOM (encadeado)
stream
  .where((v) => v > 0)
  .map((v) => v * 2)
  .listen(print);

// ❌ MENOS EFICIENTE (múltiplos streams)
var filtered = stream.where((v) => v > 0);
var mapped = filtered.map((v) => v * 2);
mapped.listen(print);
```

---

## ✅ Checklist de Qualidade

- [ ] Todos os erros são tratados
- [ ] Todas as subscriptions são canceladas
- [ ] Broadcast usado quando necessário
- [ ] Streams finitos ou com limite
- [ ] Resources fechados no dispose/cleanup
- [ ] Código legível e bem estruturado
- [ ] Sem memory leaks
- [ ] Performance otimizada

---

## Exemplo Completo Seguindo Boas Práticas

```dart
class DataService {
  final StreamController<List<String>> _dataController =
    StreamController<List<String>>.broadcast();
  
  Stream<List<String>> get data => _dataController.stream;
  
  StreamSubscription? _internalSubscription;
  
  Future<void> iniciar() async {
    try {
      _internalSubscription = _fetchDataStream().listen(
        (dados) {
          _dataController.sink.add(dados);
        },
        onError: (erro) {
          _dataController.addError(erro);
        },
      );
    } catch (e) {
      _dataController.addError(e);
    }
  }
  
  Stream<List<String>> _fetchDataStream() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield ['Dado $i'];
    }
  }
  
  void dispose() {
    _internalSubscription?.cancel();
    _dataController.close();
  }
}

void main() async {
  var service = DataService();
  
  try {
    await service.iniciar();
    
    await for (var dados in service.data) {
      print('Recebido: $dados');
    }
  } catch (erro) {
    print('Erro: $erro');
  } finally {
    service.dispose();
  }
}
```

---

## Ver Também
- [Aula 07: Tratamento de Erros](aula07-erro.md)
- [Aula 08: Broadcast Streams](aula08-broadcast.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
