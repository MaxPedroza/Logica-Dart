# map - Transformar Eventos

## Índice
- [O que é map](#o-que-é-map)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [map vs forEach](#map-vs-foreach)

---

## O que é map

O método `map()` transforma cada valor emitido pelo stream usando uma função, retornando um novo stream com os valores transformados.

---

## Sintaxe Básica

```dart
Stream<B> mapeado = stream.map<B>((valor) => transformacao(valor));
```

---

## Exemplos Práticos

### Exemplo 1: Multiplicar Valores

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() async {
  var dobrados = numeros().map((n) => n * 2);
  
  await for (int valor in dobrados) {
    print(valor);  // 2, 4, 6, 8, 10
  }
}
```

### Exemplo 2: Converter Tipo

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  var asString = numeros().map((n) => 'Número: $n');
  
  await for (String valor in asString) {
    print(valor);
    // Número: 1
    // Número: 2
    // Número: 3
  }
}
```

### Exemplo 3: Extrair Propriedade

```dart
Stream<Map<String, dynamic>> usuarios() async* {
  yield {'id': 1, 'nome': 'Ana', 'idade': 28};
  yield {'id': 2, 'nome': 'Bruno', 'idade': 35};
  yield {'id': 3, 'nome': 'Carlos', 'idade': 42};
}

void main() async {
  var nomes = usuarios().map((user) => user['nome']);
  
  await for (String nome in nomes) {
    print('Usuário: $nome');
  }
}
```

### Exemplo 4: Transformação Complexa

```dart
Stream<double> temperaturas() async* {
  yield 20.0;
  yield 25.0;
  yield 30.0;
}

void main() async {
  // Celsius para Fahrenheit: (C * 9/5) + 32
  var emFahrenheit = temperaturas().map((c) => (c * 9 / 5) + 32);
  
  await for (double f in emFahrenheit) {
    print('${f.toStringAsFixed(1)}°F');
    // 68.0°F
    // 77.0°F
    // 86.0°F
  }
}
```

### Exemplo 5: Encadear Maps

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  var transformado = numeros()
    .map((n) => n * 2)      // 2, 4, 6
    .map((n) => n + 10)     // 12, 14, 16
    .map((n) => 'Valor: $n'); // Valor: 12, ...
  
  await for (String valor in transformado) {
    print(valor);
  }
}
```

---

## map vs forEach

### map - Retorna Novo Stream

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  // map retorna um novo stream transformado
  var dobrados = numeros().map((n) => n * 2);
  
  // Pode ser processado depois
  await for (int n in dobrados) {
    print(n);
  }
}
```

### forEach - Executa para Cada Item

```dart
Stream<int> numeros() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

void main() async {
  // forEach executa uma ação, não retorna stream
  numeros().forEach((n) => print(n * 2));
}
```

---

## ✅ Padrões Recomendados

### 1. Use map para Transformações

```dart
// ✅ BOM
var transformado = stream.map((valor) => valor.toUpperCase());
```

### 2. Encadeia Maps Naturalmente

```dart
// ✅ BOM
var resultado = stream
  .map((n) => n * 2)
  .map((n) => n.toString())
  .map((s) => 'Número: $s');
```

### 3. Use Type Safety

```dart
// ✅ BOM
Stream<String> resultado = numeros().map<String>((n) => n.toString());
```

---

## Ver Também
- [Aula 05: where - Filtrar Eventos](aula05-where.md)
- [Aula 09: Combinando Streams](aula09-combinando.md)
