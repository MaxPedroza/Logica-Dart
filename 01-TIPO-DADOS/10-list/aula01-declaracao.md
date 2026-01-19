# Declaração de Listas

## Índice
- [O que é uma Lista](#o-que-é-uma-lista)
- [Sintaxe de Declaração](#sintaxe-de-declaração)
- [Inicialização de Listas](#inicialização-de-listas)
- [Tipos de Listas](#tipos-de-listas)

---

## O que é uma Lista

Uma **lista** é uma coleção ordenada de elementos do mesmo tipo (ou tipo dinâmico). Em Dart:

- Listas são **mutáveis** (podem ser modificadas)
- **Indexadas** (cada elemento tem uma posição começando em 0)
- **Homogêneas** (recomendado manter mesmo tipo)
- Implementam a interface `Iterable`

---

## Sintaxe de Declaração

### Forma 1: Explícita com Tipo

```dart
List<int> myList;
myList = [1, 2, 3, 4, 5];

print("Conteúdo da lista: $myList");
// Output: Conteúdo da lista: [1, 2, 3, 4, 5]

print("Acessando o índice 0 (myList[0]): ${myList[0]}");
// Output: Acessando o índice 0 (myList[0]): 1
```

### Forma 2: Lista de Strings

```dart
List<String> myStringList = ['A', 'B', 'C', 'D'];

print("Conteúdo da lista: $myStringList");
// Output: Conteúdo da lista: [A, B, C, D]
```

### Forma 3: Com Inferência de Tipo (var)

```dart
var listaNumerica = [1, 2, 3, 4, 5];  // Dart infere como List<int>
var listaCores = ['red', 'blue', 'green'];  // Dart infere como List<String>

print("Lista numérica: $listaNumerica");
print("Lista de cores: $listaCores");
// Output:
// Lista numérica: [1, 2, 3, 4, 5]
// Lista de cores: [red, blue, green]
```

### Forma 4: Lista Dinâmica

```dart
var listDynamic = [];
listDynamic.add("Texto");  // Funciona
listDynamic.add(10);        // Também funciona

print("Conteúdo após adicionar 'Texto' e 10: $listDynamic");
// Output: Conteúdo após adicionar 'Texto' e 10: [Texto, 10]
```

⚠️ **Não recomendado**: Usar listas dinâmicas quando puder evitar.

---

## Inicialização de Listas

### Com Valores Iniciais

```dart
// Inicializar com valores
List<int> lista1 = [10, 20, 30];
print("Lista com valores: $lista1");
// Output: Lista com valores: [10, 20, 30]
```

### Vazia (Lista Mutável)

```dart
// Lista vazia (pode crescer)
var lista2 = <int>[];
lista2.add(100);

print("Lista vazia inicial, agora: $lista2");
// Output: Lista vazia inicial, agora: [100]
```

### Com Construtor List.empty()

```dart
// Lista vazia fixa (growable: false por padrão)
var listEmpty = List.empty();
print("Lista vazia criada: $listEmpty");
// Output: Lista vazia criada: []

// Para permitir adicionar itens:
var listGrowable = List.empty(growable: true);
listGrowable.add(100);

print("Lista vazia (growable) após adicionar 100: $listGrowable");
// Output: Lista vazia (growable) após adicionar 100: [100]
```

### Com Construtor List.filled()

```dart
// Criar lista com tamanho fixo preenchida com um valor
var lista3 = List.filled(5, 0);  // 5 elementos com valor 0

print("Lista preenchida: $lista3");
// Output: Lista preenchida: [0, 0, 0, 0, 0]
```

### Com Construtor List.generate()

```dart
// Gerar lista com função
var lista4 = List.generate(5, (index) => index * 10);

print("Lista gerada: $lista4");
// Output: Lista gerada: [0, 10, 20, 30, 40]
```

---

## Tipos de Listas

| Tipo | Sintaxe | Exemplo |
|------|---------|---------|
| Inteiros | `List<int>` | `[1, 2, 3]` |
| Strings | `List<String>` | `['a', 'b', 'c']` |
| Doubles | `List<double>` | `[1.5, 2.5]` |
| Bool | `List<bool>` | `[true, false]` |
| Dinâmica | `List<dynamic>` | `[1, 'a', true]` |
| Tipada com var | `var <Type>[]` | `var <Map>[]` |

---

## Características das Listas

### Mutabilidade

```dart
List<int> numeros = [1, 2, 3];

// Listas SÃO mutáveis em Dart
numeros[0] = 100;  // Permitido

print("Lista modificada: $numeros");
// Output: Lista modificada: [100, 2, 3]
```

### Indexação

```dart
List<String> frutas = ['Maçã', 'Banana', 'Laranja'];

// Os índices começam em 0
// Índice 0 = 'Maçã'
// Índice 1 = 'Banana'
// Índice 2 = 'Laranja'

print("Primeira fruta: ${frutas[0]}");
print("Segunda fruta: ${frutas[1]}");
// Output:
// Primeira fruta: Maçã
// Segunda fruta: Banana
```

### Acessar Último Elemento

```dart
List<int> valores = [10, 20, 30, 40];

// Usando length - 1
print("Último elemento: ${valores[valores.length - 1]}");
// Output: Último elemento: 40

// Ou usar a propriedade last (Dart 2.0+)
print("Último com .last: ${valores.last}");
// Output: Último com .last: 40
```

---

## ✅ Padrões Recomendados

### 1. Sempre Especifique o Tipo

```dart
// ✅ BOM
List<String> nomes = ['Ana', 'Bruno'];

// ❌ EVITE
var dados = [];  // Tipo incerto
```

### 2. Use Construtores Apropriados

```dart
// Vazia crescente
var lista = <int>[];

// Com tamanho fixo
var lista = List<int>.filled(10, 0);

// Gerada dinamicamente
var lista = List.generate(5, (i) => i * 2);
```

### 3. Validar Antes de Acessar

```dart
List<String> usuarios = ['Ana', 'Bruno'];

if (usuarios.isNotEmpty && usuarios.length > 0) {
  print("Primeiro usuário: ${usuarios[0]}");
}
```

---

## Ver Também
- [Aula 02: add](aula02-add.md) - Adicionar um item
- [Aula 03: addAll](aula03-addall.md) - Adicionar múltiplos itens
- [Aula 07: contains](aula07-contains.md) - Verificar se contém

