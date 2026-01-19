# Tratamento de Erros

## Índice
- [Capturando Erros](#capturando-erros)
- [Métodos de Tratamento](#métodos-de-tratamento)
- [Recuperação de Erros](#recuperação-de-erros)
- [Exemplos Práticos](#exemplos-práticos)

---

## Capturando Erros

Existem várias formas de capturar e tratar erros em streams.

---

## Métodos de Tratamento

### 1. try/catch com await for

A forma mais comum e recomendada.

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Algo deu errado!');
}

void main() async {
  try {
    await for (int valor in comErro()) {
      print('Valor: $valor');
    }
  } catch (erro) {
    print('Erro capturado: $erro');
  } finally {
    print('Limpeza');
  }
}
// Output:
// Valor: 1
// Valor: 2
// Erro capturado: Exception: Algo deu errado!
// Limpeza
```

### 2. handleError()

Trata o erro e fornece um valor padrão.

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro!');
}

void main() async {
  var tratado = comErro().handleError((erro) {
    print('Tratado: $erro');
    return -1;  // Valor padrão após erro
  });
  
  await for (int valor in tratado) {
    print('Valor: $valor');
  }
}
```

### 3. onError (com listen)

Usar callback onError.

```dart
Stream<int> comErro() async* {
  yield 1;
  yield 2;
  throw Exception('Erro!');
}

void main() {
  comErro().listen(
    (valor) => print('Valor: $valor'),
    onError: (erro) => print('Erro: $erro'),
    onDone: () => print('Finalizado'),
  );
}
```

---

## Recuperação de Erros

### Retomar Após Erro

```dart
Stream<int> comErro() async* {
  yield 1;
  throw Exception('Erro no meio!');
  yield 2;  // Nunca será emitido
}

void main() async {
  try {
    await for (int valor in comErro()) {
      print('Valor: $valor');
    }
  } on Exception catch (e) {
    print('Exceção: $e');
    print('Stream finalizado com erro');
  }
}
```

### Fornecer Valor Padrão

```dart
Stream<int> comErro() async* {
  yield 10;
  yield 20;
  throw Exception('Erro!');
}

void main() async {
  var recuperado = comErro().handleError((erro) {
    print('Erro tratado, usando valor padrão');
    return 0;
  });
  
  int total = 0;
  await for (int valor in recuperado) {
    total += valor;
  }
  
  print('Total: $total');  // 30
}
```

---

## Exemplos Práticos

### Exemplo 1: Requisição com Falha

```dart
Stream<String> buscarDados(String url) async* {
  if (url.isEmpty) {
    throw Exception('URL vazia!');
  }
  
  yield 'Dados de $url';
}

void main() async {
  try {
    await for (String dado in buscarDados('')) {
      print(dado);
    }
  } catch (erro) {
    print('Falha na requisição: $erro');
  }
}
```

### Exemplo 2: Validação com Erro

```dart
Stream<int> somente Positivos(List<int> numeros) async* {
  for (int n in numeros) {
    if (n < 0) {
      throw Exception('Número negativo não permitido: $n');
    }
    yield n;
  }
}

void main() async {
  try {
    await for (int n in somentePositivos([1, 2, -3, 4])) {
      print('Número válido: $n');
    }
  } on Exception catch (e) {
    print('Validação falhou: $e');
  }
}
```

### Exemplo 3: Retry com Delay

```dart
Stream<String> comRetry() async* {
  int tentativas = 0;
  
  while (tentativas < 3) {
    try {
      yield 'Sucesso na tentativa ${tentativas + 1}';
      return;
    } catch (e) {
      tentativas++;
      if (tentativas >= 3) {
        throw Exception('Falhou após 3 tentativas');
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

void main() async {
  try {
    await for (String resultado in comRetry()) {
      print(resultado);
    }
  } catch (e) {
    print('Erro final: $e');
  }
}
```

### Exemplo 4: Múltiplos Tipos de Erro

```dart
Stream<int> processarDados(List<String> dados) async* {
  for (String d in dados) {
    if (d.isEmpty) {
      throw FormatException('Dado vazio');
    }
    if (d == 'parar') {
      throw Exception('Parada solicitada');
    }
    yield int.parse(d);
  }
}

void main() async {
  try {
    await for (int valor in processarDados(['10', '20', '', '30'])) {
      print('Valor: $valor');
    }
  } on FormatException catch (e) {
    print('Erro de formato: $e');
  } on Exception catch (e) {
    print('Erro geral: $e');
  } finally {
    print('Processamento finalizado');
  }
}
```

### Exemplo 5: Usar handleError

```dart
Stream<int> comErro() async* {
  yield 1;
  throw Exception('Erro!');
  yield 2;
}

void main() async {
  print('Processando com tratamento de erro:');
  
  var tratado = comErro()
    .handleError((erro) {
      print('>>> Tratado erro: $erro');
      return -1;  // Valor substituto
    })
    .map((n) => n * 2);
  
  await for (int valor in tratado) {
    print('Valor processado: $valor');
  }
}
// Output:
// Processando com tratamento de erro:
// Valor processado: 2
// >>> Tratado erro: Exception: Erro!
// Valor processado: -2
```

---

## ✅ Padrões Recomendados

### 1. Sempre Tratar Erros

```dart
// ✅ BOM
try {
  await for (var valor in stream) {
    processar(valor);
  }
} catch (erro) {
  tratarErro(erro);
}

// ❌ EVITE (ignorar erro)
await for (var valor in stream) {
  processar(valor);
}
```

### 2. Use try/catch para await for

```dart
// ✅ RECOMENDADO
try {
  await for (var v in stream) { }
} catch (e) {
  // ...
}
```

### 3. Use handleError para Recuperação

```dart
// ✅ BOM (recuperar com valor padrão)
var recuperado = stream.handleError((e) => defaultValue);
```

### 4. Especificar Tipo de Exceção

```dart
// ✅ BOM
try {
  await for (var v in stream) { }
} on FormatException catch (e) {
  print('Erro de formato: $e');
} on Exception catch (e) {
  print('Outro erro: $e');
}
```

---

## Ver Também
- [Aula 03: Escutando Streams](aula03-listen.md)
- [Aula 10: StreamController](aula10-streamcontroller.md)
