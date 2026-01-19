# where - Filtrar Eventos

## Índice
- [O que é where](#o-que-é-where)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Combinando Filtros](#combinando-filtros)

---

## O que é where

O método `where()` filtra eventos do stream, emitindo apenas os que atendem a uma condição, retornando um novo stream filtrado.

---

## Sintaxe Básica

```dart
Stream<T> filtrado = stream.where((valor) => condicao(valor));
```

---

## Exemplos Práticos

### Exemplo 1: Filtrar Números Pares

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
  }
}

void main() async {
  var pares = numeros().where((n) => n % 2 == 0);
  
  await for (int numero in pares) {
    print(numero);  // 2, 4, 6, 8, 10
  }
}
```

### Exemplo 2: Filtrar Strings

```dart
Stream<String> nomes() async* {
  yield 'Ana';
  yield 'Bruno';
  yield 'Carlos';
  yield 'Diana';
  yield 'Elvio';
}

void main() async {
  // Nomes que começam com 'A'
  var comA = nomes().where((nome) => nome.startsWith('A'));
  
  await for (String nome in comA) {
    print(nome);  // Ana
  }
}
```

### Exemplo 3: Filtrar por Valor Numérico

```dart
Stream<int> notas() async* {
  yield 75;
  yield 85;
  yield 92;
  yield 68;
  yield 95;
}

void main() async {
  // Apenas notas >= 80 (aprovados)
  var aprovados = notas().where((nota) => nota >= 80);
  
  await for (int nota in aprovados) {
    print('Nota aprovada: $nota');
  }
}
```

### Exemplo 4: Filtrar Objetos

```dart
Stream<Map<String, dynamic>> usuarios() async* {
  yield {'id': 1, 'nome': 'Ana', 'ativo': true};
  yield {'id': 2, 'nome': 'Bruno', 'ativo': false};
  yield {'id': 3, 'nome': 'Carlos', 'ativo': true};
  yield {'id': 4, 'nome': 'Diana', 'ativo': false};
}

void main() async {
  // Apenas usuários ativos
  var ativos = usuarios().where((user) => user['ativo'] == true);
  
  await for (Map<String, dynamic> user in ativos) {
    print('Usuário ativo: ${user['nome']}');
  }
}
```

---

## Combinando Filtros

### where com where

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 20; i++) {
    yield i;
  }
}

void main() async {
  // Números pares E maiores que 10
  var filtrados = numeros()
    .where((n) => n % 2 == 0)      // Pares: 2, 4, 6, ..., 20
    .where((n) => n > 10);          // > 10: 12, 14, 16, 18, 20
  
  await for (int n in filtrados) {
    print(n);
  }
}
```

### where + map

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() async {
  // Pares e depois multiplicar por 10
  var resultado = numeros()
    .where((n) => n % 2 == 0)   // 2, 4
    .map((n) => n * 10);         // 20, 40
  
  await for (int n in resultado) {
    print(n);
  }
}
```

### Exemplo Complexo

```dart
Stream<Map<String, dynamic>> vendas() async* {
  yield {'vendedor': 'Ana', 'valor': 1500, 'status': 'confirmada'};
  yield {'vendedor': 'Bruno', 'valor': 800, 'status': 'pendente'};
  yield {'vendedor': 'Carlos', 'valor': 2500, 'status': 'confirmada'};
  yield {'vendedor': 'Diana', 'valor': 450, 'status': 'cancelada'};
  yield {'vendedor': 'Elvio', 'valor': 3000, 'status': 'confirmada'};
}

void main() async {
  // Vendas confirmadas com valor >= 2000
  var resultado = vendas()
    .where((v) => v['status'] == 'confirmada')
    .where((v) => v['valor'] >= 2000)
    .map((v) => '${v['vendedor']}: R\$ ${v['valor']}');
  
  await for (String venda in resultado) {
    print(venda);
  }
  // Output:
  // Carlos: R$ 2500
  // Elvio: R$ 3000
}
```

---

## ✅ Padrões Recomendados

### 1. Use where para Filtrar

```dart
// ✅ BOM
var filtrado = stream.where((valor) => condicao(valor));
```

### 2. Combine where com map

```dart
// ✅ BOM
var resultado = stream
  .where((n) => n > 0)
  .map((n) => n * 2);
```

### 3. Evite Aninhamento Complexo

```dart
// ✅ BOM (legível)
var resultado = stream
  .where((n) => n > 0)
  .where((n) => n < 100)
  .where((n) => n % 2 == 0);

// ❌ EVITE (difícil ler)
var resultado = stream
  .where((n) => n > 0 && n < 100 && n % 2 == 0);
```

---

## Comparação: where vs map

| Método | Retorna | Uso |
|---|---|---|
| `where()` | Stream filtrado | Selecionar eventos |
| `map()` | Stream transformado | Modificar eventos |

---

## Ver Também
- [Aula 04: map - Transformar Eventos](aula04-map.md)
- [Aula 09: Combinando Streams](aula09-combinando.md)
