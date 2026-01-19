# remove - Remover Pares

## Índice
- [O que é remove](#o-que-é-remove)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Variações e Alternativas](#variações-e-alternativas)

---

## O que é remove

O método `remove()` remove um par chave-valor do map **pela chave** e retorna o valor removido (ou `null` se chave não existir).

---

## Sintaxe Básica

```dart
valor = mapa.remove('chave');
// Remove a chave e retorna seu valor (ou null)
```

---

## Exemplos Práticos

### Exemplo 1: Remover Simples

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com',
    'telefone': '1234-5678'
  };

  // Remover um par
  usuario.remove('telefone');

  print("Usuário após remover telefone: $usuario");
  // Output: Usuário após remover telefone: {id: 1, nome: Ana, email: ana@email.com}
}
```

### Exemplo 2: Remove com Retorno

```dart
void main() {
  var config = {
    'servidor': 'localhost',
    'porta': 8080,
    'debug': true
  };

  // Remove e obtém o valor
  var valor_debug = config.remove('debug');
  print("Valor removido: $valor_debug");  // true

  // Tenta remover chave inexistente
  var valor_ssl = config.remove('ssl');
  print("Valor removido (inexistente): $valor_ssl");  // null
}
```

### Exemplo 3: Remover e Validar

```dart
void main() {
  var cache = {
    'user_123': 'dados de usuário',
    'session_abc': 'dados de sessão',
    'temp_xyz': 'dados temporários'
  };

  // Remover com verificação
  if (cache.remove('session_abc') != null) {
    print("Sessão removida com sucesso");
  } else {
    print("Sessão não encontrada");
  }

  print("Cache: $cache");
}
```

### Exemplo 4: Remover Múltiplos Pares

```dart
void main() {
  var config = {
    'tema': 'escuro',
    'idioma': 'português',
    'som': true,
    'vibracao': false,
    'notificacoes': true
  };

  // Remover múltiplas chaves
  var chaves_remover = ['som', 'vibracao'];
  for (var chave in chaves_remover) {
    config.remove(chave);
  }

  print("Config após remover: $config");
  // Output: Config após remover: {tema: escuro, idioma: português, notificacoes: true}
}
```

### Exemplo 5: Remover com Condição

```dart
void main() {
  var sessoes = {
    'user_1': 'ativa',
    'user_2': 'expirada',
    'user_3': 'ativa',
    'user_4': 'expirada'
  };

  // Remover sessões expiradas
  var chaves_expiradas = sessoes.entries
    .where((e) => e.value == 'expirada')
    .map((e) => e.key)
    .toList();

  for (var chave in chaves_expiradas) {
    sessoes.remove(chave);
  }

  print("Sessões ativas: $sessoes");
  // Output: Sessões ativas: {user_1: ativa, user_3: ativa}
}
```

---

## Variações e Alternativas

### removeWhere (Remover com Condição)

```dart
void main() {
  var numeros = {'a': 1, 'b': 2, 'c': 3, 'd': 4};

  // Remover pares onde valor > 2
  numeros.removeWhere((chave, valor) => valor > 2);

  print("Números após removeWhere: $numeros");
  // Output: Números após removeWhere: {a: 1, b: 2}
}
```

### clear (Remover Todos)

```dart
void main() {
  var dados = {
    'a': 1,
    'b': 2,
    'c': 3
  };

  print("Antes: $dados");
  dados.clear();
  print("Depois: $dados");  // {}
  print("Está vazio? ${dados.isEmpty}");  // true
}
```

### Diferença: remove vs removeWhere vs clear

```dart
void main() {
  // remove: por chave específica
  var map1 = {'a': 1, 'b': 2};
  map1.remove('a');  // {b: 2}

  // removeWhere: com condição
  var map2 = {'a': 1, 'b': 2, 'c': 3};
  map2.removeWhere((k, v) => v > 1);  // {a: 1}

  // clear: remove tudo
  var map3 = {'a': 1, 'b': 2};
  map3.clear();  // {}
}
```

---

## ✅ Padrões Recomendados

### 1. Para Remover Uma Chave: Use remove

```dart
// ✅ BOM
mapa.remove('chave_especifica');
```

### 2. Para Remover com Condição: Use removeWhere

```dart
// ✅ BOM
mapa.removeWhere((k, v) => condicao(v));
```

### 3. Verificar se Removeu

```dart
// ✅ BOM
if (mapa.remove('chave') != null) {
  print("Removido com sucesso");
} else {
  print("Chave não existia");
}
```

### 4. Remover em Lote

```dart
// ✅ BOM (método 1)
for (var chave in ['a', 'b', 'c']) {
  mapa.remove(chave);
}

// ✅ BOM (método 2)
mapa.removeWhere((k, v) => ['a', 'b', 'c'].contains(k));
```

---

## Tabela Comparativa

| Método | Remove | Retorna | Condição |
|--------|--------|---------|----------|
| `remove(chave)` | Uma chave | Valor removido | Chave específica |
| `removeWhere(fn)` | Múltiplas | void | Função booleana |
| `clear()` | Todas | void | Nenhuma (tudo) |

---

## Ver Também
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 08: clear](aula08-clear.md)
- [Aula 09: update](aula09-update.md)
