# removeAt - Remover Item por Índice

## Índice
- [Método removeAt()](#método-removeat)
- [Usando removeAt()](#usando-removeat)
- [Casos de Uso](#casos-de-uso)

---

## Método removeAt()

Remove e retorna o item na posição específica:

### Sintaxe

```dart
var valor = minhaLista.removeAt(indice);
```

### Características

- **Retorna:** O valor removido
- **Busca:** Por ÍNDICE (posição)
- **Remove:** Exatamente na posição
- **Modifica:** A lista original
- **Erro:** Se índice inválido

---

## Usando removeAt()

### Remoção Simples

```dart
var lista = ['A', 'B', 'C', 'D'];
print("Lista inicial: $lista");

var removido = lista.removeAt(1);
print("Removido: $removido");
print("Lista atualizada: $lista");
// Output:
// Lista inicial: [A, B, C, D]
// Removido: B
// Lista atualizada: [A, C, D]
```

### Remover Primeira Posição

```dart
var numeros = [10, 20, 30, 40];

var primeiro = numeros.removeAt(0);
print("Primeiro elemento: $primeiro");
print("Lista: $numeros");
// Output:
// Primeiro elemento: 10
// Lista: [20, 30, 40]
```

### Remover Última Posição

```dart
var frutas = ['Maçã', 'Banana', 'Laranja'];

var ultima = frutas.removeAt(frutas.length - 1);
print("Última fruta: $ultima");
print("Frutas: $frutas");
// Output:
// Última fruta: Laranja
// Frutas: [Maçã, Banana]
```

---

## Casos de Uso

### Processar e Remover

```dart
var tarefas = ["Estudar", "Exercitar", "Descansar"];

while (tarefas.isNotEmpty) {
  var tarefa = tarefas.removeAt(0);
  print("Executando: $tarefa");
}
// Output:
// Executando: Estudar
// Executando: Exercitar
// Executando: Descansar
```

### Remover do Meio

```dart
var lista = [1, 2, 3, 4, 5];
print("Lista: $lista");

var meio = lista.removeAt(2);
print("Elemento do meio (índice 2): $meio");
print("Lista sem meio: $lista");
// Output:
// Lista: [1, 2, 3, 4, 5]
// Elemento do meio (índice 2): 3
// Lista sem meio: [1, 2, 4, 5]
```

### Fila FIFO (First In, First Out)

```dart
var fila = ["Cliente A", "Cliente B", "Cliente C"];

while (fila.isNotEmpty) {
  var atendido = fila.removeAt(0);
  print("Atendendo: $atendido");
}
// Output:
// Atendendo: Cliente A
// Atendendo: Cliente B
// Atendendo: Cliente C
```

### Pilha LIFO (Last In, First Out)

```dart
var pilha = [1, 2, 3, 4, 5];

while (pilha.isNotEmpty) {
  var topo = pilha.removeAt(pilha.length - 1);
  print("Removido do topo: $topo");
}
// Output:
// Removido do topo: 5
// Removido do topo: 4
// Removido do topo: 3
// Removido do topo: 2
// Removido do topo: 1
```

---

## remove vs removeAt

| Método | Busca | Parâmetro | Retorna |
|--------|-------|-----------|----------|
| `remove(valor)` | Por VALOR | Valor | `bool` |
| `removeAt(índice)` | Por ÍNDICE | Posição | Valor removido |

```dart
var lista = [10, 20, 30];

lista.remove(20);      // Remove valor 20 → retorna true/false
lista.removeAt(1);     // Remove posição 1 → retorna valor removido
```

---

## Validação de Índice

### Verificar Antes de Remover

```dart
var lista = [10, 20, 30];

int indice = 5;

if (indice >= 0 && indice < lista.length) {
  var removido = lista.removeAt(indice);
  print("Removido: $removido");
} else {
  print("Índice inválido!");
}
// Output: Índice inválido!
```

### Com Try-Catch

```dart
var lista = ['A', 'B', 'C'];

try {
  var removido = lista.removeAt(10);  // Índice inválido
} catch (e) {
  print("Erro: Índice fora do intervalo");
}
// Output: Erro: Índice fora do intervalo
```

---

## ✅ Padrões Recomendados

### Função Segura

```dart
String? removerSeguro(List<String> lista, int indice) {
  if (indice < 0 || indice >= lista.length) {
    return null;
  }
  return lista.removeAt(indice);
}

var nomes = ["Ana", "Bruno", "Carlos"];
var removido = removerSeguro(nomes, 1);

print("Removido: $removido");
print("Restante: $nomes");
// Output:
// Removido: Bruno
// Restante: [Ana, Carlos]
```

### Remover Intervalo

```dart
List<T> removerIntervalo<T>(List<T> lista, int inicio, int fim) {
  var removidos = <T>[];
  
  for (int i = fim - 1; i >= inicio; i--) {
    if (i >= 0 && i < lista.length) {
      removidos.insert(0, lista.removeAt(i));
    }
  }
  
  return removidos;
}

var numeros = [1, 2, 3, 4, 5];
var removidos = removerIntervalo(numeros, 1, 3);

print("Removidos: $removidos");
print("Restante: $numeros");
// Output:
// Removidos: [2, 3]
// Restante: [1, 4, 5]
```

### Retirar do Final

```dart
T? retirarDoFinal<T>(List<T> lista) {
  if (lista.isEmpty) return null;
  return lista.removeAt(lista.length - 1);
}

var stack = [1, 2, 3];
var topo = retirarDoFinal(stack);

print("Retirado: $topo");
print("Stack: $stack");
// Output:
// Retirado: 3
// Stack: [1, 2]
```

---

## Ver Também
- [Aula 04: remove](aula04-remove.md) - Remover por valor
- [Aula 06: clear](aula06-clear.md) - Limpar toda lista
- [Aula 08: elementAt](aula08-elementat.md) - Acessar por índice

