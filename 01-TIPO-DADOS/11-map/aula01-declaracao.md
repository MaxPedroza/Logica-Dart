# Declaração de Maps

## Índice
- [O que é um Map](#o-que-é-um-map)
- [Sintaxe de Declaração](#sintaxe-de-declaração)
- [Inicialização de Maps](#inicialização-de-maps)
- [Tipos de Maps](#tipos-de-maps)

---

## O que é um Map

Um **map** é uma coleção de pares chave-valor onde:

- **Chaves são únicas** (não podem repetir)
- **Mapeiam para valores** (um valor por chave)
- **Mutáveis** (podem ser modificadas, a menos que sejam `const`)
- **Dinâmicas** (crescem conforme necessário)
- Implementam a interface `Map<K, V>`

---

## Sintaxe de Declaração

### Forma 1: Explícita com Tipo

```dart
Map<String, int> idades;
idades = {'Ana': 25, 'Bruno': 30, 'Carlos': 28};

print("Conteúdo do map: $idades");
// Output: Conteúdo do map: {Ana: 25, Bruno: 30, Carlos: 28}

print("Acessando Ana: ${idades['Ana']}");
// Output: Acessando Ana: 25
```

### Forma 2: Map com String e String

```dart
Map<String, String> capitais = {
  'Brasil': 'Brasília',
  'França': 'Paris',
  'Japão': 'Tóquio'
};

print("Conteúdo do map: $capitais");
// Output: Conteúdo do map: {Brasil: Brasília, França: Paris, Japão: Tóquio}

print("Capital do Brasil: ${capitais['Brasil']}");
// Output: Capital do Brasil: Brasília
```

### Forma 3: Com Inferência de Tipo (var)

```dart
var idades = {'Ana': 25, 'Bruno': 30}; // Dart infere como Map<String, int>
var cidades = {'SP': 'São Paulo', 'RJ': 'Rio de Janeiro'}; // Map<String, String>
var dados = {'nome': 'Pedro', 1: 25}; // Map<Object, Object> (tipo misto)

print("Idades: $idades");
print("Cidades: $cidades");
print("Dados: $dados");
// Output:
// Idades: {Ana: 25, Bruno: 30}
// Cidades: {SP: São Paulo, RJ: Rio de Janeiro}
// Dados: {nome: Pedro, 1: 25}
```

### Forma 4: Map Dinâmico

```dart
var mapDynamic = <String, dynamic>{};
mapDynamic['nome'] = 'Ana';      // String
mapDynamic['idade'] = 25;        // int
mapDynamic['ativo'] = true;      // bool
mapDynamic['salario'] = 3500.50; // double

print("Conteúdo do map dinâmico: $mapDynamic");
// Output: Conteúdo do map dinâmico: {nome: Ana, idade: 25, ativo: true, salario: 3500.5}
```

---

## Inicialização de Maps

### Com Valores Iniciais

```dart
// Map com valores iniciais
Map<int, String> numeros = {
  1: 'um',
  2: 'dois',
  3: 'três'
};

print("Map com valores: $numeros");
// Output: Map com valores: {1: um, 2: dois, 3: três}
```

### Vazio (Map Mutável)

```dart
// Map vazio (pode crescer)
var mapa = <String, int>{};
mapa['a'] = 10;
mapa['b'] = 20;

print("Map vazio inicial, agora: $mapa");
// Output: Map vazio inicial, agora: {a: 10, b: 20}
```

### Com Construtor Map()

```dart
// Criar map vazio com construtor
var mapa1 = Map<String, int>();
mapa1['x'] = 100;

print("Map criado com construtor: $mapa1");
// Output: Map criado com construtor: {x: 100}
```

### Com Construtor Map.from()

```dart
var original = {'a': 1, 'b': 2, 'c': 3};

// Criar cópia do map
var copia = Map.from(original);
copia['d'] = 4; // Modificar a cópia não afeta original

print("Original: $original");
print("Cópia: $copia");
// Output:
// Original: {a: 1, b: 2, c: 3}
// Cópia: {a: 1, b: 2, c: 3, d: 4}
```

### Com Construtor Map.of()

```dart
var original = {'a': 1, 'b': 2};

// Map.of() também cria cópia (mais moderno)
var copia = Map.of(original);

print("Original: $original");
print("Cópia: $copia");
```

### Com Construtor Map.unmodifiable()

```dart
var original = {'a': 1, 'b': 2, 'c': 3};

// Map imutável (não pode modificar)
var imutavel = Map.unmodifiable(original);

print("Map imutável: $imutavel");
// Output: Map imutável: {a: 1, b: 2, c: 3}

// imutavel['d'] = 4; // ERRO: Unsupported operation!
```

---

## Tipos de Maps

### Tipos Simples

| Tipo | Sintaxe | Exemplo |
|------|---------|---------|
| String → int | `Map<String, int>` | `{'Ana': 25}` |
| String → String | `Map<String, String>` | `{'país': 'Brasil'}` |
| int → String | `Map<int, String>` | `{1: 'um', 2: 'dois'}` |
| String → double | `Map<String, double>` | `{'preço': 19.99}` |
| String → bool | `Map<String, bool>` | `{'ativo': true}` |

### Tipos Complexos

```dart
// Map com valores de múltiplos tipos
Map<String, dynamic> pessoa = {
  'nome': 'Ana',           // String
  'idade': 25,             // int
  'altura': 1.70,          // double
  'ativo': true,           // bool
  'hobbies': ['leitura', 'yoga'] // List
};

print("Pessoa: $pessoa");
```

### Maps Aninhados

```dart
// Map dentro de Map
Map<String, Map<String, int>> notas = {
  'Ana': {'Português': 85, 'Matemática': 90},
  'Bruno': {'Português': 78, 'Matemática': 88},
  'Carlos': {'Português': 92, 'Matemática': 85}
};

print("Notas da Ana: ${notas['Ana']}");
print("Nota de Português de Ana: ${notas['Ana']?['Português']}");
// Output:
// Notas da Ana: {Português: 85, Matemática: 90}
// Nota de Português de Ana: 85
```

---

## Ordem de Inserção

Em Dart, os maps **mantêm a ordem de inserção** das chaves:

```dart
void main() {
  var mapa = {
    'terceiro': 3,
    'primeiro': 1,
    'segundo': 2
  };

  print("Map: $mapa");
  // Output: Map: {terceiro: 3, primeiro: 1, segundo: 2}
  // ⚠️ Note que a ordem é a de inserção, não alfabética
}
```

---

## Modificando Maps

Após a declaração, você pode modificar o map:

```dart
Map<String, String> config = {'tema': 'escuro'};

// Adicionar novo par
config['idioma'] = 'português';

// Modificar valor existente
config['tema'] = 'claro';

// Remover par
config.remove('idioma');

print("Config após modificações: $config");
// Output: Config após modificações: {tema: claro}
```

---

## Constantes (const) vs Mutáveis

### Map Mutável

```dart
// Pode ser modificado
var mapa = {'a': 1};
mapa['b'] = 2;  // Permitido
print(mapa);
// Output: {a: 1, b: 2}
```

### Map Constante

```dart
// NÃO pode ser modificado
const mapa = {'a': 1};
// mapa['b'] = 2;  // ERRO: Unsupported operation!
```

---

## ✅ Padrões Recomendados

### 1. Sempre Especifique o Tipo

```dart
// ✅ BOM
Map<String, int> idades = {'Ana': 25, 'Bruno': 30};

// ❌ EVITE
var dados = {};  // Tipo incerto
```

### 2. Use Inferência quando Possível

```dart
// ✅ ACEITÁVEL (tipo é óbvio)
var cidades = {'SP': 'São Paulo', 'RJ': 'Rio'};
```

### 3. Para Dinâmicos, Seja Explícito

```dart
// ✅ BOM
Map<String, dynamic> usuario = {
  'nome': 'Ana',
  'idade': 25,
  'tags': ['dev', 'flutter']
};
```

### 4. Validar Antes de Acessar

```dart
Map<String, int> dados = {'a': 1};

// ✅ SEGURO
if (dados.containsKey('b')) {
  print(dados['b']);
}

// ✅ TAMBÉM SEGURO (com coalescing)
print(dados['b'] ?? 'não encontrado');
```

---

## Ver Também
- [Aula 02: Adicionando Pares (addEntry)](aula02-addentry.md)
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 05: containsKey](aula05-containskey.md)
