# addAll - Adicionar Múltiplos Itens

## Índice
- [Método addAll()](#método-addall)
- [Usando addAll()](#usando-addall)
- [Casos de Uso](#casos-de-uso)

---

## Método addAll()

Adiciona todos os itens de outra lista ao final da lista atual:

### Sintaxe

```dart
minhaLista.addAll(outtraLista);
minhaLista.addAll([item1, item2, item3]);
```

### Características

- **Retorna:** void (não retorna nada)
- **Efeito:** Adiciona múltiplos ao final
- **Modifica:** A lista original
- **Parâmetro:** Aceita Iterable (lista, set, etc)

---

## Usando addAll()

### Adicionar Lista Inteira

```dart
var lista1 = [1, 2, 3];
print("Lista inicial: $lista1");

lista1.addAll([4, 5, 6]);
print("Lista atualizada: $lista1");
// Output:
// Lista inicial: [1, 2, 3]
// Lista atualizada: [1, 2, 3, 4, 5, 6]
```

### Adicionar de Outra Variável

```dart
var numeros = [10, 20];
var maisNumeros = [30, 40, 50];

numeros.addAll(maisNumeros);
print("Números combinados: $numeros");
// Output: Números combinados: [10, 20, 30, 40, 50]
```

### Múltiplas Operações

```dart
var frutas = <String>[];

frutas.addAll(["Maçã", "Banana"]);
frutas.addAll(["Laranja", "Uva"]);
frutas.addAll(["Manga"]);

print("Frutas: $frutas");
// Output: Frutas: [Maçã, Banana, Laranja, Uva, Manga]
```

---

## Casos de Uso

### Mesclar Duas Listas

```dart
var lista1 = ["Ana", "Bruno"];
var lista2 = ["Carlos", "Diana"];

lista1.addAll(lista2);
print("Lista mesclada: $lista1");
// Output: Lista mesclada: [Ana, Bruno, Carlos, Diana]
```

### Combinar Resultados

```dart
var resultado1 = [10, 20, 30];
var resultado2 = [40, 50, 60];
var todoResult = <int>[];

todoResult.addAll(resultado1);
todoResult.addAll(resultado2);

print("Todos os resultados: $todoResult");
// Output: Todos os resultados: [10, 20, 30, 40, 50, 60]
```

### Carrinho com Múltiplos Produtos

```dart
var carrinho = <String>[];

var categoria1 = ["Notebook", "Mouse"];
var categoria2 = ["Teclado", "Monitor"];
var categoria3 = ["Fone", "Webcam"];

carrinho.addAll(categoria1);
carrinho.addAll(categoria2);
carrinho.addAll(categoria3);

print("Carrinho de compras (${carrinho.length} itens):");
for (var item in carrinho) {
  print("  • $item");
}
// Output:
// Carrinho de compras (6 itens):
//   • Notebook
//   • Mouse
//   • Teclado
//   • Monitor
//   • Fone
//   • Webcam
```

### Compilar Eventos

```dart
var todosEventos = <String>[];

var eventsHoje = ["Login", "Upload"];
var eventsOntem = ["Logout", "Download"];

todosEventos.addAll(eventsHoje);
todosEventos.addAll(eventsOntem);

print("Eventos: ${todosEventos.length}");
for (var evento in todosEventos) {
  print("→ $evento");
}
// Output:
// Eventos: 4
// → Login
// → Upload
// → Logout
// → Download
```

### Construir Questões de Teste

```dart
var questions = <String>[];

var bloco1 = [
  "Pergunta 1",
  "Pergunta 2"
];

var bloco2 = [
  "Pergunta 3",
  "Pergunta 4",
  "Pergunta 5"
];

questions.addAll(bloco1);
questions.addAll(bloco2);

print("Total de questões: ${questions.length}");
print("Questões: $questions");
// Output:
// Total de questões: 5
// Questões: [Pergunta 1, Pergunta 2, Pergunta 3, Pergunta 4, Pergunta 5]
```

---

## Comparação: add vs addAll

| Método | Entrada | Adição |
|--------|---------|---------|
| `add(item)` | Um elemento | 1 item |
| `addAll([...])` | Coleção | Múltiplos |

```dart
var lista = [1, 2];

lista.add(3);           // [1, 2, 3]
lista.addAll([4, 5]);   // [1, 2, 3, 4, 5]
```

---

## ✅ Padrões Recomendados

### Adicionar Condicionalmente

```dart
var resultado = <int>[];
var dados1 = [1, 2, 3];
var dados2 = [4, 5, 6];

// Adicionar sempre
resultado.addAll(dados1);

// Adicionar se não vazio
if (dados2.isNotEmpty) {
  resultado.addAll(dados2);
}

print("Resultado: $resultado");
// Output: Resultado: [1, 2, 3, 4, 5, 6]
```

### Filtrar Antes de Adicionar

```dart
var numeros = <int>[];
var numeros1 = [1, 2, 3, 4];
var numeros2 = [5, 6, 7, 8];

// Adicionar apenas pares
var pares = numeros1.where((n) => n % 2 == 0).toList();
numeros.addAll(pares);

print("Pares: $numeros");
// Output: Pares: [2, 4]
```

### Concatenação de Listas

```dart
List<int> concatenar(List<int> l1, List<int> l2, List<int> l3) {
  var resultado = <int>[];
  resultado.addAll(l1);
  resultado.addAll(l2);
  resultado.addAll(l3);
  return resultado;
}

var final = concatenar([1, 2], [3, 4], [5, 6]);
print("Concatenado: $final");
// Output: Concatenado: [1, 2, 3, 4, 5, 6]
```

---

## Ver Também
- [Aula 02: add](aula02-add.md) - Adicionar um item
- [Aula 04: remove](aula04-remove.md) - Remover itens
- [Aula 06: clear](aula06-clear.md) - Limpar lista

