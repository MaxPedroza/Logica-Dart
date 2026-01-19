# Métodos Avançados

## Índice
- [Métodos de Transformação](#métodos-de-transformação)
- [Métodos de Busca](#métodos-de-busca)
- [Métodos de Conversão](#métodos-de-conversão)
- [Exemplos Práticos](#exemplos-práticos)

---

## Métodos de Transformação

### map() - Transformar Pares

Transforma cada par chave-valor em um novo par, retornando um `Iterable<MapEntry>`.

```dart
void main() {
  var numeros = {'a': 1, 'b': 2, 'c': 3};

  // Transformar valores (multiplicar por 2)
  var dobrados = numeros.map((chave, valor) => MapEntry(chave, valor * 2));

  print("Numeros: $numeros");
  print("Dobrados: ${dobrados.toList()}");
  // Output:
  // Numeros: {a: 1, b: 2, c: 3}
  // Dobrados: [MapEntry(a: 2), MapEntry(b: 4), MapEntry(c: 6)]
}
```

### Exemplo Prático: Converter Valores

```dart
void main() {
  var precos = {
    'notebook': 3000.00,
    'mouse': 50.00,
    'teclado': 150.00
  };

  // Aumentar preços em 10%
  var precosAumentados = precos
    .map((chave, valor) => MapEntry(chave, valor * 1.1))
    .toList();

  print("Preços aumentados em 10%:");
  precosAumentados.forEach((entry) {
    print("${entry.key}: ${entry.value.toStringAsFixed(2)}");
  });
}
```

---

### removeWhere() - Remover com Condição

Remove pares que atendem a uma condição especificada.

```dart
void main() {
  var usuarios = {
    'ana': 'ativo',
    'bruno': 'inativo',
    'carlos': 'ativo',
    'diana': 'suspenso'
  };

  print("Antes: $usuarios");

  // Remover usuários inativos e suspensos
  usuarios.removeWhere((nome, status) => status != 'ativo');

  print("Depois: $usuarios");
  // Output: Depois: {ana: ativo, carlos: ativo}
}
```

---

### addAll() - Mesclar Maps

Adiciona todos os pares de outro map.

```dart
void main() {
  var usuario = {'id': 1, 'nome': 'Ana'};
  var endereco = {'rua': 'Av. Paulista', 'numero': 1000};

  usuario.addAll(endereco);

  print("Usuário completo: $usuario");
  // Output: Usuário completo: {id: 1, nome: Ana, rua: Av. Paulista, numero: 1000}
}
```

---

## Métodos de Busca

### containsKey() - Verificar Chave

Verifica se uma chave existe.

```dart
void main() {
  var config = {'servidor': 'localhost', 'porta': 8080};

  if (config.containsKey('porta')) {
    print("Porta configurada: ${config['porta']}");
  }
}
```

---

### containsValue() - Verificar Valor

Verifica se um valor existe.

```dart
void main() {
  var cidades = {
    'SP': 'São Paulo',
    'RJ': 'Rio de Janeiro',
    'MG': 'Minas Gerais'
  };

  if (cidades.containsValue('São Paulo')) {
    print("São Paulo está cadastrada");
  }
}
```

---

### entries - Encontrar com Condição

Encontra entradas que atendem a uma condição.

```dart
void main() {
  var notas = {'Ana': 85, 'Bruno': 90, 'Carlos': 78, 'Diana': 95};

  // Encontrar alunos com nota >= 90
  var aprovados = notas.entries
    .where((e) => e.value >= 90)
    .toList();

  print("Alunos com nota >= 90:");
  aprovados.forEach((e) => print("${e.key}: ${e.value}"));
}
```

---

## Métodos de Conversão

### toList() - Converter para Lista

Converte chaves ou valores em lista.

```dart
void main() {
  var dados = {'a': 1, 'b': 2, 'c': 3};

  var chaves = dados.keys.toList();
  var valores = dados.values.toList();

  print("Chaves: $chaves");
  print("Valores: $valores");
  // Output:
  // Chaves: [a, b, c]
  // Valores: [1, 2, 3]
}
```

---

### toSet() - Converter para Set

Converte valores para um conjunto (remove duplicatas).

```dart
void main() {
  var dados = {
    'tipo1': 'A',
    'tipo2': 'B',
    'tipo3': 'A',
    'tipo4': 'C'
  };

  var tiposUnicos = dados.values.toSet();
  print("Tipos únicos: $tiposUnicos");
  // Output: Tipos únicos: {A, B, C}
}
```

---

### toString() - Converter para String

```dart
void main() {
  var dados = {'nome': 'Ana', 'idade': 28};

  var str = dados.toString();
  print("String: $str");
  // Output: String: {nome: Ana, idade: 28}
}
```

---

## Exemplos Práticos

### Exemplo 1: Filtrar e Transformar

```dart
void main() {
  var vendas = {
    'janeiro': 5000,
    'fevereiro': 3500,
    'marco': 7200,
    'abril': 4100,
    'maio': 6800,
  };

  // Filtrar vendas > 5000 e aumentar em 10%
  var melhorados = vendas.entries
    .where((e) => e.value > 5000)
    .map((e) => MapEntry(e.key, (e.value * 1.1).toInt()))
    .toList();

  print("Meses com vendas > 5000 (com 10% aumento):");
  melhorados.forEach((e) => print("${e.key}: ${e.value}"));
}
```

### Exemplo 2: Agrupar por Valor

```dart
void main() {
  var categorias = {
    'livro1': 'ficção',
    'livro2': 'técnico',
    'livro3': 'ficção',
    'livro4': 'técnico',
    'livro5': 'ficção'
  };

  // Agrupar por categoria
  var agrupado = <String, List<String>>{};

  categorias.forEach((livro, cat) {
    agrupado.putIfAbsent(cat, () => []);
    agrupado[cat]?.add(livro);
  });

  print("Livros por categoria:");
  agrupado.forEach((cat, livros) {
    print("$cat: $livros");
  });
}
```

### Exemplo 3: Inverter Map (Chaves ↔ Valores)

```dart
void main() {
  var mapOriginal = {
    'a': 1,
    'b': 2,
    'c': 3,
  };

  // Inverter: valores viram chaves, chaves viram valores
  var invertido = <int, String>{};
  mapOriginal.forEach((chave, valor) {
    invertido[valor] = chave;
  });

  print("Original: $mapOriginal");
  print("Invertido: $invertido");
  // Output:
  // Original: {a: 1, b: 2, c: 3}
  // Invertido: {1: a, 2: b, 3: c}
}
```

### Exemplo 4: Mesclar e Filtrar

```dart
void main() {
  var config1 = {'debug': true, 'timeout': 30};
  var config2 = {'porta': 8080, 'ssl': true};

  // Mesclar
  var configFinal = {...config1, ...config2};

  // Filtrar apenas booleanos
  var booleans = configFinal.entries
    .where((e) => e.value is bool)
    .toMap();

  print("Config final: $configFinal");
  print("Apenas booleanos: $booleans");
}
```

### Exemplo 5: Análise de Frequência

```dart
void main() {
  var texto = 'dart flutter dart dart mobile flutter web';
  var palavras = texto.split(' ');

  // Contar frequência
  var frequencia = <String, int>{};
  for (var palavra in palavras) {
    frequencia.update(
      palavra,
      (count) => count + 1,
      ifAbsent: () => 1
    );
  }

  // Ordenar por frequência (maior primeiro)
  var ordenado = frequencia.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  print("Frequência de palavras:");
  ordenado.forEach((e) => print("${e.key}: ${e.value}x"));
}
```

---

## Comparação com List

| Operação | List | Map |
|---|---|---|
| **Acessar elemento** | `lista[0]` | `map['chave']` |
| **Adicionar** | `lista.add()` | `map['chave'] = valor` |
| **Remover** | `lista.remove()` | `map.remove()` |
| **Iterar** | `for (var item in lista)` | `map.forEach((k,v) => ...)` |
| **Transformar** | `lista.map()` | `map.map()` |
| **Filtrar** | `lista.where()` | `map.entries.where()` |

---

## ✅ Padrões Recomendados

### 1. Encadear Operações

```dart
// ✅ BOM (encadeado)
var resultado = dados
  .entries
  .where((e) => e.value > 100)
  .map((e) => MapEntry(e.key, e.value * 2))
  .toList();
```

### 2. Usar forEach para Efeitos Colaterais

```dart
// ✅ BOM
dados.forEach((k, v) => print('$k: $v'));
```

### 3. Usar map para Transformações

```dart
// ✅ BOM
var transformado = dados.map((k, v) => MapEntry(k, v.toString()));
```

### 4. Usar removeWhere para Limpeza

```dart
// ✅ BOM
dados.removeWhere((k, v) => v == null);
```

---

## Ver Também
- [Aula 09: update](aula09-update.md)
- [Aula 10: forEach](aula10-foreach.md)
- [Aula 11: keys e values](aula11-keys-values.md)
