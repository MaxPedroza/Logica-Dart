# containsValue - Verificar Valores

## Índice
- [O que é containsValue](#o-que-é-containsvalue)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Comparação com Alternativas](#comparação-com-alternativas)

---

## O que é containsValue

O método `containsValue()` verifica se um **valor específico existe** no map, retornando `true` ou `false`. Ele busca entre todos os **valores**, não nas chaves.

---

## Sintaxe Básica

```dart
bool temValor = mapa.containsValue('valor');
// true se o valor existe em alguma chave, false caso contrário
```

---

## Exemplos Práticos

### Exemplo 1: Verificação Simples

```dart
void main() {
  var cidades = {
    'SP': 'São Paulo',
    'RJ': 'Rio de Janeiro',
    'MG': 'Minas Gerais'
  };

  // Verificar se valores existem
  print(cidades.containsValue('São Paulo'));     // true
  print(cidades.containsValue('Rio de Janeiro')); // true
  print(cidades.containsValue('Brasília'));      // false
  print(cidades.containsValue('Salvador'));      // false
}
```

### Exemplo 2: Encontrar Chave por Valor

```dart
void main() {
  var notas = {
    'Ana': 85,
    'Bruno': 90,
    'Carlos': 85,
    'Diana': 95
  };

  // Encontrar aluno com nota 90
  if (notas.containsValue(90)) {
    var aluno = notas.entries
      .firstWhere((e) => e.value == 90);
    print("Aluno com nota 90: ${aluno.key}");
    // Output: Aluno com nota 90: Bruno
  }
}
```

### Exemplo 3: Verificar Status

```dart
void main() {
  var usuarios = {
    'ana': 'ativo',
    'bruno': 'inativo',
    'carlos': 'ativo',
    'diana': 'suspenso'
  };

  // Verificar se algum usuário está suspenso
  if (usuarios.containsValue('suspenso')) {
    print("Há usuários suspensos!");
  }

  // Contar usuários inativos
  var inativos = usuarios.entries
    .where((e) => e.value == 'inativo')
    .length;
  print("Usuários inativos: $inativos");
}
```

### Exemplo 4: Validação de Dados

```dart
void main() {
  var configuracoes = {
    'tema': 'escuro',
    'idioma': 'português',
    'notificacoes': 'ativo'
  };

  var valoresValidos = ['ativo', 'inativo'];

  // Verificar se alguma configuração tem valor inválido
  var tudo_ok = !configuracoes.values.any((v) {
    return !valoresValidos.contains(v);
  });

  print("Configurações válidas: $tudo_ok"); // true
}
```

### Exemplo 5: Buscar em Mapas Aninhados

```dart
void main() {
  var estoque = {
    'eletronicos': {
      'notebook': 5,
      'mouse': 20,
      'teclado': 15
    },
    'livros': {
      'flutter': 3,
      'dart': 7
    }
  };

  // Verificar se existe estoque zero em alguma categoria
  for (var categoria in estoque.values) {
    if (categoria.containsValue(0)) {
      print("Há produtos sem estoque em: $categoria");
    }
  }
}
```

---

## Diferença: containsKey vs containsValue

```dart
void main() {
  var map = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com'
  };

  // containsKey: busca nas CHAVES
  print(map.containsKey('id'));     // true (chave existe)
  print(map.containsKey('nome'));   // true (chave existe)
  print(map.containsKey('Ana'));    // false (Ana é valor, não chave)

  // containsValue: busca nos VALORES
  print(map.containsValue(1));          // true (valor existe)
  print(map.containsValue('Ana'));      // true (valor existe)
  print(map.containsValue('ana'));      // false (case-sensitive)
  print(map.containsValue('id'));       // false (id é chave, não valor)
}
```

---

## ✅ Padrões Recomendados

### 1. Para Buscar por Valor: Use containsValue

```dart
// ✅ BOM
if (mapa.containsValue('procurado')) {
  print("Valor encontrado!");
}
```

### 2. Para Encontrar Chave com Valor Específico

```dart
// ✅ BOM
var entrada = mapa.entries.firstWhere(
  (e) => e.value == 'procurado',
  orElse: () => null
);

if (entrada != null) {
  print("Chave: ${entrada.key}");
}
```

### 3. Validação em Lote

```dart
// ✅ BOM (todos os valores são válidos)
var valoresValidos = ['ativo', 'inativo', 'pendente'];
var tudo_ok = mapa.values.every((v) => valoresValidos.contains(v));

if (tudo_ok) {
  print("Todos os valores são válidos");
}
```

### 4. Para Mapas de Enumerações

```dart
// ✅ BOM (usar para verificar enums)
enum Status { ativo, inativo, pendente }

var usuarios = {
  'ana': Status.ativo,
  'bruno': Status.inativo,
  'carlos': Status.ativo
};

if (usuarios.containsValue(Status.pendente)) {
  print("Há usuários pendentes");
}
```

---

## Performance: containsValue vs Alternativas

```dart
void main() {
  var mapa = List.generate(10000, (i) => MapEntry('key$i', 'value$i')).toMap();

  // ✅ containsValue (simples e clara)
  var temValor = mapa.containsValue('value5000');

  // ❌ Alternativa (mais lenta para valores únicos)
  var temValor2 = mapa.values.contains('value5000');
}
```

---

## Ver Também
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 05: containsKey](aula05-containskey.md)
- [Aula 12: length e isEmpty](aula12-length-isempty.md)
