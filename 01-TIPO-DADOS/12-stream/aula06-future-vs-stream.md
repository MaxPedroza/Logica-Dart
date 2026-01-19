# Future vs Stream

## Índice
- [Conceitual](#conceitual)
- [Sintaxe Comparada](#sintaxe-comparada)
- [Exemplos Práticos](#exemplos-práticos)
- [Tabela Comparativa](#tabela-comparativa)
- [Quando Usar Cada Um](#quando-usar-cada-um)

---

## Conceitual

### Future

Um `Future` representa um **único valor** que será disponibilizado **em algum momento no futuro** (ou um erro).

```dart
Future<String> buscar() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Um valor';  // Apenas UM valor
}
```

### Stream

Um `Stream` representa **múltiplos valores** que serão emitidos **ao longo do tempo**.

```dart
Stream<String> buscar() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield 'Valor $i';  // MÚLTIPLOS valores
  }
}
```

---

## Sintaxe Comparada

### Criando

```dart
// Future
Future<int> futuro() async {
  return 42;
}

// Stream
Stream<int> stream() async* {
  yield 1;
  yield 2;
  yield 3;
}
```

### Consumindo

```dart
// Future - usar await
void main() async {
  int valor = await futuro();
  print(valor);
}

// Stream - usar await for
void main() async {
  await for (int valor in stream()) {
    print(valor);
  }
}
```

### Tratamento de Erro

```dart
// Future
try {
  var resultado = await futuro();
} catch (erro) {
  print('Erro: $erro');
}

// Stream
try {
  await for (var valor in stream()) {
    processar(valor);
  }
} catch (erro) {
  print('Erro: $erro');
}
```

---

## Exemplos Práticos

### Exemplo 1: Buscar Uma Vez vs Múltiplas Vezes

#### Future (Uma Busca)

```dart
Future<List<int>> buscarDados() async {
  await Future.delayed(Duration(seconds: 2));
  return [1, 2, 3];
}

void main() async {
  print('Buscando...');
  var dados = await buscarDados();
  print('Dados: $dados');
}
// Output:
// Buscando...
// Dados: [1, 2, 3]
```

#### Stream (Múltiplas Buscas)

```dart
Stream<int> buscarDadosContinuo() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print('Buscando continuamente...');
  
  await for (int dado in buscarDadosContinuo()) {
    print('Dado: $dado');
  }
}
// Output:
// Buscando continuamente...
// Dado: 0
// Dado: 1
// Dado: 2
```

### Exemplo 2: Processamento

#### Future

```dart
Future<int> somar(int a, int b) async {
  await Future.delayed(Duration(seconds: 1));
  return a + b;
}

void main() async {
  var resultado = await somar(5, 3);
  print('Resultado: $resultado');  // 8
}
```

#### Stream

```dart
Stream<int> somarContinuo() async* {
  yield 5 + 3;
  yield 10 + 2;
  yield 15 + 5;
}

void main() async {
  await for (int resultado in somarContinuo()) {
    print('Resultado: $resultado');
    // 8
    // 12
    // 20
  }
}
```

### Exemplo 3: Tratamento de Erro

#### Future

```dart
Future<int> comErro() async {
  throw Exception('Erro no Future!');
}

void main() async {
  try {
    var resultado = await comErro();
  } catch (erro) {
    print('Capturou: $erro');
  }
}
```

#### Stream

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro no Stream!');
}

void main() async {
  try {
    await for (int valor in comErro()) {
      print('Valor: $valor');
    }
  } catch (erro) {
    print('Capturou: $erro');
  }
}
```

---

## Tabela Comparativa

| Aspecto | Future | Stream |
|---|---|---|
| **Valores** | Um | Múltiplos |
| **Timing** | Uma vez | Ao longo do tempo |
| **Criação** | `async { ... return }` | `async* { ... yield }` |
| **Consumo** | `await` | `await for` |
| **Cancelável** | Não | Sim (com cancel()) |
| **Memória** | Usa pouca | Pode usar mais |
| **Use Para** | Requisições HTTP | Websockets, sensores |

---

## Quando Usar Cada Um

### Use Future Quando

- ✅ Você espera **um resultado** único
- ✅ Exemplos:
  - Buscar dados de uma API
  - Salvar arquivo
  - Fazer login
  - Fazer cálculo

```dart
// Buscar dados de API
Future<User> buscarUsuario(int id) async {
  var response = await http.get('api/users/$id');
  return User.fromJson(response.body);
}
```

### Use Stream Quando

- ✅ Você espera **múltiplos resultados** ao longo do tempo
- ✅ Exemplos:
  - Monitorar localização GPS
  - Escutar WebSocket
  - Processar cliques de botão
  - Ler sensores
  - Buscar dados paginados

```dart
// Monitorar localização
Stream<Location> obterLocalizacao() async* {
  while (true) {
    var location = await geolocator.getCurrentPosition();
    yield location;
    await Future.delayed(Duration(seconds: 5));
  }
}
```

---

## Conversão

### Future → Stream

```dart
Future<String> futuro() async {
  return 'Valor do Future';
}

void main() async {
  // Converter para Stream
  var stream = futuro().asStream();
  
  await for (String valor in stream) {
    print(valor);
  }
}
```

### Stream → Future

```dart
Stream<int> stream() async* {
  yield 1;
  yield 2;
  yield 3;
}

void main() async {
  // Pegar primeiro valor
  int primeiro = await stream().first;
  print(primeiro);  // 1
  
  // Pegar último valor
  int ultimo = await stream().last;
  print(ultimo);    // 3
  
  // Juntar todos
  List<int> todos = await stream().toList();
  print(todos);     // [1, 2, 3]
}
```

---

## ✅ Padrões Recomendados

### 1. Escolha Correto Desde o Início

```dart
// ✅ BOM (Future para um resultado)
Future<User> getUser(int id) async { ... }

// ✅ BOM (Stream para múltiplos)
Stream<ChatMessage> getMessages() async* { ... }
```

### 2. Use await para Future

```dart
// ✅ BOM
var user = await getUser();

// ❌ EVITE
getUser().then((user) => print(user));
```

### 3. Use await for para Stream

```dart
// ✅ BOM
await for (var msg in getMessages()) {
  print(msg);
}

// ❌ EVITE
getMessages().listen((msg) => print(msg));
```

---

## Exemplo Combinado

```dart
// Future: buscar lista inicial
Future<List<Item>> getInitialItems() async {
  var response = await http.get('api/items');
  return parseItems(response.body);
}

// Stream: buscar atualizações
Stream<Item> getItemUpdates() async* {
  while (true) {
    var response = await http.get('api/updates');
    for (var item in parseItems(response.body)) {
      yield item;
    }
    await Future.delayed(Duration(seconds: 30));
  }
}

void main() async {
  // Buscar dados iniciais
  var items = await getInitialItems();
  print('Items iniciais: ${items.length}');
  
  // Escutar atualizações
  await for (var update in getItemUpdates()) {
    print('Atualização: $update');
  }
}
```

---

## Ver Também
- [Aula 01: Introdução a Streams](aula01-introducao.md)
- [Aula 03: Escutando Streams](aula03-listen.md)
