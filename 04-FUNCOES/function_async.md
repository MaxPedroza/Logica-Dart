# Funções Assíncronas em Dart

Este documento detalha o funcionamento, Futures, async/await e aplicações práticas de funções assíncronas na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é Função Assíncrona?](#2-o-que-é-função-assíncrona)
- [3. Conceito de Future](#3-conceito-de-future)
- [4. Sintaxe async/await](#4-sintaxe-asyncawait)
- [5. Exemplos Básicos](#5-exemplos-básicos)
- [6. Tratamento de Erros](#6-tratamento-de-erros)
- [7. Executar Múltiplas Tarefas](#7-executar-múltiplas-tarefas)
- [8. Casos Práticos](#8-casos-práticos)
- [9. Boas Práticas](#9-boas-práticas)

---

## 1. Introdução

Uma **função assíncrona** é aquela que **não bloqueia** a execução do código. Ela retorna um `Future` que será resolvido posteriormente.

```dart
Future<void> functionAsync() async {
  for (var i = 0; i < 300000; i++) {
    print("$i");
  }
  print("FINALIZOU");
}

void main() async {
  await Future.wait([functionAsync(), functionAsync()]);
}
```

## 2. O que é Função Assíncrona?

Funções assíncronas executam **em paralelo** e **não bloqueiam** a execução:

- 📌 Execução **não-bloqueante**
- 📌 Retorna uma **Future** (promessa de resultado)
- 📌 Código **após** a chamada continua executando
- 📌 Ideal para operações **demoradas** (I/O, rede, banco de dados)
- 📌 Essencial para **aplicações responsivas**

### Fluxo de Execução

```
main()
  ↓
chamar funcaoAsync()
  ↓
retorna Future (não bloqueia)
  ↓
continua main() (não aguarda)
  ↓
(no background) funcaoAsync() executa
  ↓
Future completa com resultado
```

### Síncrona vs Assíncrona

```
SÍNCRONA:
Inicio → Bloqueado → Bloqueado → Resultado → Continua
         ↑─────────────────────↑
         Aplicação travada!

ASSÍNCRONA:
Inicio → Continua → Continua → Continua
                              ↓
                      (background) resultado chega
```

## 3. Conceito de Future

Um **Future** representa um valor que estará disponível **no futuro**.

```dart
// Future<tipo> representa um valor futuro
Future<String> buscarDado() async {
  await Future.delayed(Duration(seconds: 2));
  return "Dados carregados!";
}

void main() async {
  // Aguarda o resultado
  String resultado = await buscarDado();
  print(resultado);
}
```

### Estados de uma Future

```
┌─────────────────────────────────────┐
│         STATES OF A FUTURE          │
├─────────────────────────────────────┤
│ 1. PENDING (Aguardando)             │
│    - Future foi criada              │
│    - Resultado ainda não disponível │
│                                     │
│ 2. COMPLETED - SUCCESS (Sucesso)    │
│    - Future completou               │
│    - Retornou um resultado          │
│                                     │
│ 3. COMPLETED - ERROR (Erro)         │
│    - Future completou com erro      │
│    - Lançou uma exceção             │
└─────────────────────────────────────┘
```

## 4. Sintaxe async/await

### Palavra-chave async

A palavra-chave `async` marca uma função como assíncrona:

```dart
Future<String> minhaFuncaoAsync() async {
  // Código assíncrono
  return "Resultado";
}
```

### Palavra-chave await

A palavra-chave `await` pausa a execução até que a Future seja resolvida:

```dart
Future<void> main() async {
  String resultado = await minhaFuncaoAsync();
  print(resultado);
}
```

## 5. Exemplos Básicos

### Exemplo 1: Operação Simples com Delay

```dart
Future<String> buscarDado() async {
  print("Iniciando busca...");
  await Future.delayed(Duration(seconds: 2));
  print("Busca concluída!");
  return "Dados carregados";
}

void main() async {
  print("Antes");
  String dados = await buscarDado();
  print(dados);
  print("Depois");
}

// Output:
// Antes
// Iniciando busca...
// (aguarda 2 segundos)
// Busca concluída!
// Dados carregados
// Depois
```

### Exemplo 2: Múltiplas Operações Sequenciais

```dart
Future<void> etapa1() async {
  print("Etapa 1 iniciada");
  await Future.delayed(Duration(seconds: 1));
  print("Etapa 1 completa");
}

Future<void> etapa2() async {
  print("Etapa 2 iniciada");
  await Future.delayed(Duration(seconds: 1));
  print("Etapa 2 completa");
}

Future<void> main() async {
  await etapa1();
  await etapa2();
  print("Todas as etapas concluídas!");
}

// Output:
// Etapa 1 iniciada
// (aguarda 1 segundo)
// Etapa 1 completa
// Etapa 2 iniciada
// (aguarda 1 segundo)
// Etapa 2 completa
// Todas as etapas concluídas!
```

### Exemplo 3: Operações em Paralelo

```dart
Future<void> tarefa1() async {
  await Future.delayed(Duration(seconds: 2));
  print("Tarefa 1 completa");
}

Future<void> tarefa2() async {
  await Future.delayed(Duration(seconds: 1));
  print("Tarefa 2 completa");
}

Future<void> main() async {
  await Future.wait([tarefa1(), tarefa2()]);
  print("Todas as tarefas concluídas!");
}

// Output (executa em paralelo, total ~2 segundos):
// (aguarda 1 segundo)
// Tarefa 2 completa
// (aguarda mais 1 segundo)
// Tarefa 1 completa
// Todas as tarefas concluídas!
```

## 6. Tratamento de Erros

### Try/Catch com Async

```dart
Future<String> buscarDado() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("Erro ao buscar dados!");
}

void main() async {
  try {
    String dados = await buscarDado();
    print(dados);
  } catch (e) {
    print("Erro capturado: $e");
  }
}

// Output:
// Erro capturado: Exception: Erro ao buscar dados!
```

### .catchError()

```dart
Future<String> buscarDado() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("Erro!");
}

void main() {
  buscarDado()
    .then((dados) => print("Sucesso: $dados"))
    .catchError((erro) => print("Erro: $erro"));
}
```

### Finally

```dart
Future<void> exemplo() async {
  try {
    print("Executando...");
    await Future.delayed(Duration(seconds: 1));
    print("Sucesso!");
  } catch (e) {
    print("Erro: $e");
  } finally {
    print("Limpeza finalizada");
  }
}

void main() async {
  await exemplo();
}
```

## 7. Executar Múltiplas Tarefas

### Future.wait() - Espera Todas

```dart
Future<void> main() async {
  await Future.wait([
    functionAsync(),
    functionAsync(),
  ]);
  print("Todas as funções completaram!");
}
```

### Future.race() - Primeira a Completar

```dart
Future<void> tarefa1() async {
  await Future.delayed(Duration(seconds: 2));
  return "Tarefa 1";
}

Future<void> tarefa2() async {
  await Future.delayed(Duration(seconds: 1));
  return "Tarefa 2";
}

void main() async {
  var resultado = await Future.race([tarefa1(), tarefa2()]);
  print(resultado); // "Tarefa 2" (mais rápida)
}
```

### Executar Sem Aguardar

```dart
Future<void> tarefaBg() async {
  await Future.delayed(Duration(seconds: 2));
  print("Tarefa background completa");
}

void main() {
  tarefaBg(); // Não aguarda! (fire and forget)
  print("Main completa imediatamente");
}

// Output:
// Main completa imediatamente
// (aguarda 2 segundos)
// Tarefa background completa
```

## 8. Casos Práticos

### Caso 1: Simular Requisição HTTP

```dart
Future<Map<String, dynamic>> buscarUsuario(int id) async {
  print("Buscando usuário $id...");
  await Future.delayed(Duration(seconds: 2));
  return {
    'id': id,
    'nome': 'João Silva',
    'email': 'joao@email.com',
  };
}

void main() async {
  try {
    Map<String, dynamic> usuario = await buscarUsuario(1);
    print("Usuário encontrado: ${usuario['nome']}");
  } catch (e) {
    print("Erro: $e");
  }
}
```

### Caso 2: Processar Lista de Dados

```dart
Future<int> processarItem(int numero) async {
  await Future.delayed(Duration(milliseconds: 500));
  return numero * 2;
}

Future<void> main() async {
  List<int> numeros = [1, 2, 3, 4, 5];
  List<Future<int>> futures = numeros.map(processarItem).toList();
  
  List<int> resultados = await Future.wait(futures);
  print("Resultados: $resultados"); // [2, 4, 6, 8, 10]
}
```

### Caso 3: Retry com Tentativas

```dart
Future<String> buscarComRetry({int tentativas = 3}) async {
  for (int i = 1; i <= tentativas; i++) {
    try {
      print("Tentativa $i...");
      await Future.delayed(Duration(seconds: 1));
      
      if (i < 3) {
        throw Exception("Falha na tentativa $i");
      }
      return "Sucesso!";
    } catch (e) {
      print("Erro: $e");
      if (i == tentativas) rethrow;
    }
  }
  return "Falhou após $tentativas tentativas";
}

void main() async {
  String resultado = await buscarComRetry();
  print(resultado);
}
```

### Caso 4: Timeout

```dart
Future<String> buscarComTimeout() async {
  try {
    return await Future<String>(() async {
      await Future.delayed(Duration(seconds: 5));
      return "Dados";
    }).timeout(
      Duration(seconds: 2),
      onTimeout: () => throw Exception("Timeout!"),
    );
  } catch (e) {
    return "Erro: $e";
  }
}

void main() async {
  String resultado = await buscarComTimeout();
  print(resultado); // "Erro: Exception: Timeout!"
}
```

### Caso 5: Executar Múltiplas Requisições

```dart
Future<void> main() async {
  print("Iniciando carregamento...");
  
  Future<String> user = buscarUsuario();
  Future<String> posts = buscarPosts();
  Future<String> comentarios = buscarComentarios();
  
  // Executa as 3 em paralelo
  var resultados = await Future.wait([user, posts, comentarios]);
  
  print("Usuário: ${resultados[0]}");
  print("Posts: ${resultados[1]}");
  print("Comentários: ${resultados[2]}");
  print("Tudo carregado!");
}

Future<String> buscarUsuario() async {
  await Future.delayed(Duration(seconds: 1));
  return "João Silva";
}

Future<String> buscarPosts() async {
  await Future.delayed(Duration(seconds: 2));
  return "5 posts";
}

Future<String> buscarComentarios() async {
  await Future.delayed(Duration(seconds: 1));
  return "12 comentários";
}
```

## 9. Boas Práticas

### ✅ Recomendado

```dart
// Use async/await ao invés de callbacks
Future<String> buscar() async {
  String resultado = await delay();
  return resultado;
}

// Sempre aguarde Futures
void main() async {
  await minhaFuncaoAsync();
}

// Trate erros apropriadamente
Future<void> exemplo() async {
  try {
    await operacaoDemorada();
  } catch (e) {
    print("Erro: $e");
  }
}

// Use Future.wait para paralelizar
Future<void> main() async {
  await Future.wait([
    tarefa1(),
    tarefa2(),
    tarefa3(),
  ]);
}

// Nomes claros para funções async
Future<Map> buscarDadosDoServidor() async {
  // ...
}
```

### ❌ Evite

```dart
// ❌ Fire and forget sem bom motivo
minhaFuncaoAsync(); // Erro não detectado!

// ❌ Não aguardar Futures
void main() async {
  buscarDado(); // Continua sem esperar
}

// ❌ Callbacks aninhados (callback hell)
buscar().then((x) {
  return buscar2(x).then((y) {
    return buscar3(y).then((z) {
      // Muito aninhado!
    });
  });
});

// ❌ Fazer requisições sequenciais quando poderia ser paralelo
Future<void> main() async {
  var user = await buscarUsuario();   // Aguarda
  var posts = await buscarPosts();     // Depois aguarda
  // Total: 2+ segundos (sequencial)
}

// ✅ Melhor: paralelo
Future<void> main() async {
  var resultados = await Future.wait([
    buscarUsuario(),
    buscarPosts(),
  ]);
  // Total: ~1 segundo (paralelo)
}
```

## Resumo

| Aspecto | Síncrona | Assíncrona |
|:-------:|:--------:|:----------:|
| **Retorno** | Valor direto | Future |
| **Syntax** | `tipo nome() { }` | `Future<tipo> nome() async { }` |
| **Aguardar** | Automático | `await` |
| **Bloqueante** | Sim | Não |
| **Melhor para** | Rápido | I/O, rede, banco de dados |

---

**Veja também:**
- [Funções Síncronas](function-sync.md) - Funções convencionais
- [Funções](function.md) - Conceitos gerais de funções