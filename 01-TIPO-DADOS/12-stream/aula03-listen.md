# Escutando Streams (listen)

## Índice
- [Formas de Escutar](#formas-de-escutar)
- [Usando listen()](#usando-listen)
- [Usando await for](#usando-await-for)
- [Tratamento de Erros](#tratamento-de-erros)
- [Cancelando Subscriptions](#cancelando-subscriptions)

---

## Formas de Escutar

Existem duas principais formas de escutar um stream em Dart.

---

## Usando listen()

O método `listen()` cria uma subscription e executa callbacks quando eventos chegam.

### Sintaxe Básica

```dart
StreamSubscription subscription = stream.listen(
  (valor) {
    // onData: quando valor é emitido
  },
  onError: (erro) {
    // quando um erro ocorre
  },
  onDone: () {
    // quando o stream finaliza
  },
);
```

### Exemplo 1: Listen Simples

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() {
  numeros().listen(
    (valor) => print('Recebido: $valor'),
  );
}
// Output:
// Recebido: 1
// Recebido: 2
// Recebido: 3
```

### Exemplo 2: Listen Completo

```dart
Stream<String> saudacoes() async* {
  yield 'Olá';
  await Future.delayed(Duration(milliseconds: 500));
  yield 'Mundo';
  await Future.delayed(Duration(milliseconds: 500));
  yield 'Dart';
}

void main() {
  print('Iniciando...');
  
  saudacoes().listen(
    (valor) {
      print('onData: $valor');
    },
    onError: (erro) {
      print('onError: $erro');
    },
    onDone: () {
      print('onDone: Stream finalizado');
    },
  );
  
  print('Listen configurado');
}
// Output:
// Iniciando...
// Listen configurado
// onData: Olá
// onData: Mundo
// onData: Dart
// onDone: Stream finalizado
```

### Exemplo 3: Listen com Processamento

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() {
  int soma = 0;
  
  numeros().listen(
    (numero) {
      soma += numero;
      print('Soma parcial: $soma');
    },
    onDone: () {
      print('Soma total: $soma');
    },
  );
}
```

---

## Usando await for

A forma mais moderna e legível. Use em funções async.

### Sintaxe Básica

```dart
void main() async {
  await for (var valor in stream) {
    // Processar valor
  }
}
```

### Exemplo 1: await for Simples

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  await for (int numero in numeros()) {
    print('Número: $numero');
  }
}
```

### Exemplo 2: await for com Lógica

```dart
Stream<String> tarefas() async* {
  yield 'Tarefa 1';
  yield 'Tarefa 2';
  yield 'Tarefa 3';
}

void main() async {
  print('Processando tarefas...');
  
  int contador = 0;
  await for (String tarefa in tarefas()) {
    contador++;
    print('$contador - $tarefa');
  }
  
  print('Total de tarefas: $contador');
}
```

### Exemplo 3: await for com Break/Continue

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
  }
}

void main() async {
  print('Números até encontrar 5:');
  
  await for (int n in numeros()) {
    if (n == 5) {
      print('Encontrou $n, parando...');
      break;
    }
    print(n);
  }
}
```

---

## Tratamento de Erros

### Com listen()

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Algo deu errado!');
}

void main() {
  comErro().listen(
    (valor) => print('Valor: $valor'),
    onError: (erro) {
      print('Erro capturado: $erro');
    },
    onDone: () => print('Finalizado'),
  );
}
// Output:
// Valor: 1
// Valor: 2
// Erro capturado: Exception: Algo deu errado!
// Finalizado
```

### Com await for

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro no stream!');
}

void main() async {
  try {
    await for (int valor in comErro()) {
      print('Valor: $valor');
    }
  } catch (erro) {
    print('Capturou erro: $erro');
  } finally {
    print('Limpeza final');
  }
}
```

### Recuperar de Erro com handleError()

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro!');
}

void main() async {
  var recuperado = comErro().handleError((erro) {
    print('Erro tratado: $erro');
    return 0;  // Valor padrão após erro
  });
  
  await for (int valor in recuperado) {
    print('Valor: $valor');
  }
}
```

---

## Cancelando Subscriptions

### Guardar Referência

```dart
void main() {
  var subscription = stream.listen((valor) {
    print(valor);
  });
  
  // Depois, cancelar
  subscription.cancel();
}
```

### Exemplo 1: Cancelar Após Tempo

```dart
Stream<int> contador() async* {
  int i = 0;
  while (true) {
    yield i++;
    await Future.delayed(Duration(milliseconds: 500));
  }
}

void main() async {
  var sub = contador().listen((valor) {
    print('Valor: $valor');
  });
  
  // Cancelar após 3 segundos
  await Future.delayed(Duration(seconds: 3));
  await sub.cancel();
  print('Subscription cancelada');
}
```

### Exemplo 2: Cancelar com Condição

```dart
Stream<int> numeros() async* {
  for (int i = 0; i < 100; i++) {
    yield i;
  }
}

void main() {
  var subscription;
  
  subscription = numeros().listen((valor) {
    print('Número: $valor');
    
    if (valor >= 5) {
      print('Chegou a 5, cancelando...');
      subscription.cancel();
    }
  });
}
```

---

## Comparação: listen() vs await for

| Aspecto | listen() | await for |
|---|---|---|
| **Sintaxe** | Callback | Loop |
| **Legibilidade** | Menos clara | Mais clara |
| **Controle** | Total | Padrão |
| **Erro** | onError callback | try/catch |
| **Recomendação** | Casos especiais | Padrão |

---

## ✅ Padrões Recomendados

### 1. Preferir await for quando Possível

```dart
// ✅ BOM (mais legível)
await for (var valor in stream) {
  processar(valor);
}

// ❌ MENOS CLARO
stream.listen((valor) {
  processar(valor);
});
```

### 2. Sempre Implementar onError

```dart
// ✅ BOM
await for (var valor in stream) {
  processar(valor);
} catch (erro) {
  tratarErro(erro);
}
```

### 3. Cancelar em Widget Flutter

```dart
// ✅ BOM
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamSubscription subscription;
  
  @override
  void initState() {
    super.initState();
    subscription = stream.listen((valor) {
      setState(() {
        // atualizar
      });
    });
  }
  
  @override
  void dispose() {
    subscription.cancel();  // IMPORTANTE!
    super.dispose();
  }
}
```

---

## Exemplos Avançados

### Exemplo: Monitorar Múltiplos Streams

```dart
Stream<String> stream1() async* {
  yield 'S1 - V1';
}

Stream<String> stream2() async* {
  yield 'S2 - V1';
}

void main() async {
  // Listen em ambos
  stream1().listen((v) => print('Stream 1: $v'));
  stream2().listen((v) => print('Stream 2: $v'));
  
  // Aguardar ambos completarem
  await Future.delayed(Duration(seconds: 2));
  print('Ambos finalizados');
}
```

### Exemplo: Timeout

```dart
Stream<int> lento() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  try {
    await for (int valor in lento().timeout(Duration(seconds: 1))) {
      print(valor);
    }
  } catch (erro) {
    print('Stream demorou muito: $erro');
  }
}
```

---

## Ver Também
- [Aula 02: Criando Streams](aula02-criando-streams.md)
- [Aula 07: Tratamento de Erros](aula07-erro.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
