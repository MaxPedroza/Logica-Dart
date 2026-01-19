# Adicionando Pares (addEntry)

## Índice
- [Formas de Adicionar](#formas-de-adicionar)
- [Usando Atribuição Direta](#usando-atribuição-direta)
- [Usando addEntries](#usando-addentries)
- [Usando addAll](#usando-addall)
- [Usando putIfAbsent](#usando-putifabsent)

---

## Formas de Adicionar

Existem várias maneiras de adicionar pares chave-valor a um map em Dart.

---

## Usando Atribuição Direta

A forma mais simples e direta. Use quando quer adicionar um par por vez.

```dart
void main() {
  var pessoa = <String, dynamic>{};

  // Adicionar pares um a um
  pessoa['nome'] = 'Ana';
  pessoa['idade'] = 25;
  pessoa['email'] = 'ana@email.com';
  pessoa['profissao'] = 'Desenvolvedora';

  print("Pessoa: $pessoa");
  // Output: Pessoa: {nome: Ana, idade: 25, email: ana@email.com, profissao: Desenvolvedora}
}
```

### Substituindo Valores

```dart
void main() {
  var config = {'tema': 'escuro', 'idioma': 'português'};

  // Adicionar novo par
  config['som'] = true;

  // Substituir valor existente
  config['tema'] = 'claro';

  print("Config: $config");
  // Output: Config: {tema: claro, idioma: português, som: true}
}
```

---

## Usando addEntries

O método `addEntries()` adiciona múltiplos pares de uma vez usando `MapEntry`.

```dart
void main() {
  var usuario = {'id': 1, 'nome': 'Pedro'};

  // Adicionar múltiplos pares com addEntries
  usuario.addEntries([
    MapEntry('email', 'pedro@email.com'),
    MapEntry('telefone', '1234-5678'),
    MapEntry('ativo', true)
  ]);

  print("Usuário: $usuario");
  // Output: Usuário: {id: 1, nome: Pedro, email: pedro@email.com, telefone: 1234-5678, ativo: true}
}
```

### Exemplo: Adicionando de Lista de Chaves e Valores

```dart
void main() {
  var mapa = <String, int>{};

  var chaves = ['a', 'b', 'c'];
  var valores = [10, 20, 30];

  // Criar MapEntries e adicionar
  var entries = List.generate(
    chaves.length,
    (i) => MapEntry(chaves[i], valores[i])
  );

  mapa.addEntries(entries);

  print("Mapa: $mapa");
  // Output: Mapa: {a: 10, b: 20, c: 30}
}
```

---

## Usando addAll

O método `addAll()` mescla outro map ao map atual.

```dart
void main() {
  var mapa1 = {'a': 1, 'b': 2};
  var mapa2 = {'c': 3, 'd': 4};

  // Adicionar todos os pares de mapa2 em mapa1
  mapa1.addAll(mapa2);

  print("Mapa1 após addAll: $mapa1");
  // Output: Mapa1 após addAll: {a: 1, b: 2, c: 3, d: 4}
}
```

### Sobrescrevendo Chaves Existentes

```dart
void main() {
  var configuracoes = {'tema': 'escuro', 'idioma': 'português'};
  var novasConfigs = {'tema': 'claro', 'som': true}; // tema vai sobrescrever

  configuracoes.addAll(novasConfigs);

  print("Configurações: $configuracoes");
  // Output: Configurações: {tema: claro, idioma: português, som: true}
}
```

### Usando Spread Operator (...)

Forma moderna de mesclar maps sem modificar o original:

```dart
void main() {
  var mapa1 = {'a': 1, 'b': 2};
  var mapa2 = {'c': 3, 'd': 4};

  // Criar novo map sem modificar originals
  var merged = {...mapa1, ...mapa2};

  print("Mapa1: $mapa1");
  print("Mapa2: $mapa2");
  print("Merged: $merged");
  // Output:
  // Mapa1: {a: 1, b: 2}
  // Mapa2: {c: 3, d: 4}
  // Merged: {a: 1, b: 2, c: 3, d: 4}
}
```

### Spread com Condição

```dart
void main() {
  var base = {'a': 1, 'b': 2};
  var adicional = {'c': 3};
  bool incluir = true;

  var resultado = {
    ...base,
    if (incluir) ...adicional, // Só adiciona se incluir for true
    'd': 4
  };

  print("Resultado: $resultado");
  // Output: Resultado: {a: 1, b: 2, c: 3, d: 4}
}
```

---

## Usando putIfAbsent

O método `putIfAbsent()` adiciona um par **apenas se a chave não existir**.

```dart
void main() {
  var cache = {'usuario': 'Ana', 'sessao': 'abc123'};

  // Adicionar 'idioma' se não existir
  cache.putIfAbsent('idioma', () => 'português');

  // 'usuario' já existe, então não será sobrescrito
  cache.putIfAbsent('usuario', () => 'Bruno');

  print("Cache: $cache");
  // Output: Cache: {usuario: Ana, sessao: abc123, idioma: português}
}
```

### Usando com Função

```dart
void main() {
  var dados = {'contador': 0};

  // A função só é executada se a chave não existir
  dados.putIfAbsent('timestamp', () => DateTime.now().toString());
  dados.putIfAbsent('timestamp', () => 'isso não será executado');

  print("Dados: $dados");
}
```

---

## Comparação de Métodos

| Método | Quando Usar | Exemplo |
|--------|-------------|---------|
| **Atribuição direta** | Um par por vez | `map['chave'] = valor` |
| **addEntries** | Múltiplos `MapEntry` | `map.addEntries([MapEntry(...)])` |
| **addAll** | Mesclar outro map | `map.addAll(outroMap)` |
| **Spread (...)** | Criar novo map | `{...map1, ...map2}` |
| **putIfAbsent** | Adicionar se não existir | `map.putIfAbsent('chave', () => valor)` |

---

## ✅ Padrões Recomendados

### 1. Para Pares Únicos: Atribuição Direta

```dart
// ✅ BOM
var map = {};
map['chave'] = 'valor';
```

### 2. Para Múltiplos Pares: addAll ou Spread

```dart
// ✅ BOM (modificar original)
map.addAll({'a': 1, 'b': 2});

// ✅ BOM (criar novo)
var novo = {...map, 'a': 1, 'b': 2};
```

### 3. Para Valores Opcionais: putIfAbsent

```dart
// ✅ BOM
config.putIfAbsent('timeOut', () => 5000);
```

### 4. Evitar Sobrescrita Acidental

```dart
// ✅ BOM (verificar antes)
if (!map.containsKey('chave')) {
  map['chave'] = 'valor';
}

// ✅ MELHOR (mais direto)
map.putIfAbsent('chave', () => 'valor');
```

---

## Ver Também
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 03: addAll](aula03-addall.md)
- [Aula 09: update](aula09-update.md)
