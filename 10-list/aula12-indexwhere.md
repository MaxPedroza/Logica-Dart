# indexWhere - Encontrar Índice com Condição

## Índice
- [Método indexWhere()](#método-indexwhere)
- [Usando indexWhere()](#usando-indexwhere)
- [Casos de Uso](#casos-de-uso)

---

## Método indexWhere()

Retorna o índice do primeiro elemento que atende uma condição:

### Sintaxe

```dart
int indice = minhaLista.indexWhere((item) => condicao);
```

### Características

- **Retorna:** Índice se encontrado, -1 se nenhum
- **Busca:** Primeira ocorrência que atende condição
- **Parâmetro:** Função que retorna bool
- **Valor padrão:** -1 (não encontrado)

---

## Usando indexWhere()

### Busca com Condição

```dart
var numerosEx = <int>[5, 10, 15, 20, 25];
print("Lista de números: $numerosEx");

var indiceMaiorQue12 = numerosEx.indexWhere((num) => num > 12);
print("Índice do primeiro número maior que 12: $indiceMaiorQue12");
// Output:
// Lista de números: [5, 10, 15, 20, 25]
// Índice do primeiro número maior que 12: 2
```

### Encontrar Valor Específico

```dart
var values = <int>[1, 2, 3, 4, 5];

var valueIndex = values.indexWhere((e) => e == 3);
print("Índice do valor 3 na lista values: $valueIndex");
// Output: Índice do valor 3 na lista values: 2
```

### Buscar com String

```dart
var nomes = ["Ana", "Bruno", "Carlos"];

int indice = nomes.indexWhere((nome) => nome.startsWith("B"));
print("Índice do primeiro nome que começa com B: $indice");
// Output: Índice do primeiro nome que começa com B: 1
```

---

## Casos de Uso

### Encontrar Item Crítico

```dart
var tarefas = [
  {"nome": "Tarefa 1", "urgencia": "baixa"},
  {"nome": "Tarefa 2", "urgencia": "alta"},
  {"nome": "Tarefa 3", "urgencia": "baixa"}
];

var indice = tarefas.indexWhere((t) => t["urgencia"] == "alta");

if (indice != -1) {
  print("Tarefa urgente na posição $indice: ${tarefas[indice]["nome"]}");
}
// Output: Tarefa urgente na posição 1: Tarefa 2
```

### Validar Posição de Status

```dart
var status = ["inativo", "ativo", "pausado", "ativo"];

var indiceAtivo = status.indexWhere((s) => s == "ativo");

print("Primeira posição ativa: $indiceAtivo");
// Output: Primeira posição ativa: 1
```

### Encontrar Primeiro Acima de Valor

```dart
var vendas = [100, 250, 150, 500];

int indice = vendas.indexWhere((v) => v > 200);

if (indice != -1) {
  print("Primeira venda acima de 200 está na posição $indice");
} else {
  print("Nenhuma venda acima de 200");
}
// Output: Primeira venda acima de 200 está na posição 1
```

### Encontrar Usuário Válido

```dart
var usuarios = [
  "usuario_invalido",
  "novo@email.com",
  "outro@email.com"
];

int indice = usuarios.indexWhere((u) => u.contains("@"));

if (indice != -1) {
  print("Primeiro email válido na posição $indice: ${usuarios[indice]}");
}
// Output: Primeiro email válido na posição 1: novo@email.com
```

### Encontrar Elemento Fora de Range

```dart
var numeros = [10, 20, 30, 40, 50];

int indice = numeros.indexWhere((n) => n < 5 || n > 100);

if (indice == -1) {
  print("Todos os números estão no intervalo [5, 100]");
} else {
  print("Número fora do intervalo encontrado na posição $indice");
}
// Output: Todos os números estão no intervalo [5, 100]
```

---

## indexWhere vs indexOf

| Método | Busca | Parâmetro | Exemplo |
|--------|-------|-----------|---------|
| `indexOf()` | Valor | Valor | `lista.indexOf(20)` |
| `indexWhere()` | Condição | Função | `lista.indexWhere((n) => n > 20)` |

```dart
var lista = [10, 20, 30];

lista.indexOf(20);                   // 1 - busca por valor
lista.indexWhere((n) => n == 20);    // 1 - busca por condição
lista.indexWhere((n) => n > 15);     // 1 - primeiro maior que 15
```

---

## Tratamento de Não Encontrado

### Verificar -1

```dart
var lista = [1, 2, 3];

int indice = lista.indexWhere((n) => n > 10);

if (indice != -1) {
  print("Encontrado na posição $indice");
} else {
  print("Nenhum elemento encontrado");
}
// Output: Nenhum elemento encontrado
```

### Com Padrão Seguro

```dart
int buscarIndice(List<int> lista, bool Function(int) condicao, {int padrao = -1}) {
  int indice = lista.indexWhere(condicao);
  return indice != -1 ? indice : padrao;
}

var numeros = [5, 10, 15];

var pos1 = buscarIndice(numeros, (n) => n > 12);
var pos2 = buscarIndice(numeros, (n) => n > 100, padrao: 0);

print("Posição 1: $pos1");
print("Posição 2: $pos2");
// Output:
// Posição 1: 2
// Posição 2: 0
```

---

## ✅ Padrões Recomendados

### Função Envolvida

```dart
int? encontrarIndice<T>(List<T> lista, bool Function(T) condicao) {
  int indice = lista.indexWhere(condicao);
  return indice != -1 ? indice : null;
}

var numeros = [10, 20, 30, 40];

var indice = encontrarIndice(numeros, (n) => n > 25);
print("Índice encontrado: $indice");
// Output: Índice encontrado: 2
```

### Buscar e Acessar

```dart
var pessoas = ["Ana", "Bruno", "Carlos"];

int indice = pessoas.indexWhere((p) => p.length > 5);

if (indice != -1) {
  print("Pessoa encontrada: ${pessoas[indice]}");
} else {
  print("Nenhuma pessoa com nome > 5 caracteres");
}
// Output: Pessoa encontrada: Bruno
```

### Múltiplas Buscas

```dart
var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

var primeiroImpar = numeros.indexWhere((n) => n % 2 == 1);
var primeiroPar = numeros.indexWhere((n) => n % 2 == 0);

print("Primeiro ímpar: posição $primeiroImpar");
print("Primeiro par: posição $primeiroPar");
// Output:
// Primeiro ímpar: posição 0
// Primeiro par: posição 1
```

---

## Ver Também
- [Aula 10: indexOf](aula10-indexof.md) - Encontrar índice por valor
- [Aula 09: firstWhere](aula09-firstwhere.md) - Encontrar elemento com condição
- [Aula 08: elementAt](aula08-elementat.md) - Acessar elemento

