# Introdução a Streams

## Índice
- [O que é um Stream](#o-que-é-um-stream)
- [Stream vs List](#stream-vs-list)
- [Stream vs Future](#stream-vs-future)
- [Características dos Streams](#características-dos-streams)
- [Seu Primeiro Stream](#seu-primeiro-stream)

---

## O que é um Stream

Um **Stream** é uma sequência de eventos assíncronos (dados) que podem ser escutados e processados. Ao invés de receber todos os dados de uma vez, você recebe pedaços de dados ao longo do tempo.

**Analogia:** Se uma `List` é como receber uma caixa com vários itens, um `Stream` é como receber itens em uma corrente transportadora, um a um.

---

## Stream vs List

### List - Tudo de Uma Vez

```dart
void main() {
  List<int> numeros = [1, 2, 3, 4, 5];
  
  for (int n in numeros) {
    print(n);
  }
  // Todos os números já estão disponíveis
}
```

### Stream - Ao Longo do Tempo

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;  // Emitir um valor
  }
}

void main() async {
  await for (int n in numeros()) {
    print(n);  // Recebe um número a cada segundo
  }
}
```

---

## Stream vs Future

### Future - Um Resultado

```dart
Future<String> buscar() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dados recebidos';
}

void main() async {
  var resultado = await buscar();
  print(resultado);  // Uma única resposta
}
```

### Stream - Múltiplos Resultados

```dart
Stream<String> buscarContinuo() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'Atualização $i';
  }
}

void main() async {
  await for (String atualiza in buscarContinuo()) {
    print(atualiza);  // Múltiplas atualizações
  }
}
```

---

## Características dos Streams

### 1. Assíncronos

```dart
Stream<int> contador() async* {
  for (int i = 0; i < 3; i++) {
    print('Emitindo: $i');
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

void main() async {
  print('Iniciando...');
  
  await for (int valor in contador()) {
    print('Recebido: $valor');
  }
  
  print('Finalizado');
}
// Output:
// Iniciando...
// Emitindo: 0
// Recebido: 0
// Emitindo: 1
// Recebido: 1
// ...
```

### 2. Transformáveis

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() async {
  // Transformar: multiplicar por 2
  var dobrados = numeros().map((n) => n * 2);
  
  await for (int n in dobrados) {
    print(n);  // 2, 4, 6, 8, 10
  }
}
```

### 3. Filtráveis

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
  }
}

void main() async {
  // Filtrar: apenas pares
  var pares = numeros().where((n) => n % 2 == 0);
  
  await for (int n in pares) {
    print(n);  // 2, 4, 6, 8, 10
  }
}
```

### 4. Tratáveis de Erros

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro!');
}

void main() async {
  try {
    await for (int n in comErro()) {
      print(n);
    }
  } catch (erro) {
    print('Capturou: $erro');
  }
}
```

---

## Seu Primeiro Stream

### Exemplo 1: Stream Simples

```dart
// Criar um stream que emite 3 números
Stream<int> numeros() async* {
  print('Stream iniciado');
  
  yield 1;
  yield 2;
  yield 3;
  
  print('Stream finalizado');
}

void main() async {
  print('=== Início ===');
  
  await for (int numero in numeros()) {
    print('Valor recebido: $numero');
  }
  
  print('=== Fim ===');
}
// Output:
// === Início ===
// Stream iniciado
// Valor recebido: 1
// Valor recebido: 2
// Valor recebido: 3
// Stream finalizado
// === Fim ===
```

### Exemplo 2: Stream com Atraso

```dart
Stream<String> mensagens() async* {
  for (int i = 1; i <= 3; i++) {
    yield 'Mensagem $i';
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() async {
  print('Aguardando mensagens...');
  
  await for (String msg in mensagens()) {
    print('Recebeu: $msg');
  }
  
  print('Todas as mensagens recebidas');
}
```

### Exemplo 3: Stream com Condição

```dart
Stream<int> ate(int limite) async* {
  for (int i = 0; i <= limite; i++) {
    yield i;
  }
}

void main() async {
  print('Números até 5:');
  
  await for (int n in ate(5)) {
    print(n);
  }
}
```

---

## Diferenças Principais

### List
- ✅ Dados já carregados em memória
- ✅ Acesso rápido
- ❌ Consome memória para muitos itens
- ❌ Não adequado para dados em tempo real

### Stream
- ✅ Dados sob demanda
- ✅ Ideal para tempo real
- ✅ Menos memória
- ❌ Não é possível acessar itens anteriores
- ❌ Mais complexo que List

---

## Casos de Uso

1. **Monitorar eventos:** Cliques, toques, gestos
2. **Dados em tempo real:** GPS, sensores, WebSocket
3. **Paginação:** Carregar dados em chunks
4. **Pesquisa:** Sugestões enquanto o usuário digita
5. **Notificações:** Atualizações contínuas do servidor

---

## ✅ Padrões Recomendados

### 1. Sempre Usar async/await com Streams

```dart
// ✅ BOM
void main() async {
  await for (var valor in stream) {
    processar(valor);
  }
}

// ❌ MENOS CLARO
void main() {
  stream.listen((valor) {
    processar(valor);
  });
}
```

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
```

### 3. Cancelar Subscriptions

```dart
// ✅ BOM
var subscription = stream.listen((valor) {
  processar(valor);
});

// Depois...
subscription.cancel();
```

---

## Ver Também
- [Aula 02: Criando Streams](aula02-criando-streams.md)
- [Aula 03: Escutando Streams](aula03-listen.md)
- [Aula 06: Future vs Stream](aula06-future-vs-stream.md)
