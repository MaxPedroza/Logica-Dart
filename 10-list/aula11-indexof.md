# indexOf - Encontrar Posição de Item

## Índice
- [Método indexOf()](#método-indexof)
- [Usando indexOf()](#usando-indexof)
- [Casos de Uso](#casos-de-uso)

---

## Método indexOf()

Retorna o índice da primeira ocorrência de um item:

### Sintaxe

```dart
int indice = minhaLista.indexOf(valor);
```

### Características

- **Retorna:** Índice se encontrado, -1 se não
- **Busca:** Primeira ocorrência
- **Comparação:** Usa igualdade (==)
- **Valor padrão:** -1 (não encontrado)

---

## Usando indexOf()

### Busca Simples

```dart
var letras = <String>["A", "B", "C", "D", "B"];
print("Lista de letras: $letras");

var indiceDeB = letras.indexOf("B");
print("Índice da primeira ocorrência de 'B': $indiceDeB");
// Output:
// Lista de letras: [A, B, C, D, B]
// Índice da primeira ocorrência de 'B': 1
```

### Verificar Existência

```dart
var numeros = [10, 20, 30, 40];

var indice = numeros.indexOf(25);

if (indice != -1) {
  print("Encontrado no índice: $indice");
} else {
  print("Não encontrado");
}
// Output: Não encontrado
```

### Com Strings

```dart
var frutas = ["Maçã", "Banana", "Laranja"];

int indice = frutas.indexOf("Banana");
print("Posição de Banana: $indice");
// Output: Posição de Banana: 1
```

---

## Casos de Uso

### Encontrar Posição de Usuário

```dart
var usuarios = ["Ana Silva", "Bruno Costa", "Diana Santos"];
String procurado = "Bruno Costa";

int pos = usuarios.indexOf(procurado);

if (pos != -1) {
  print("Usuário encontrado na posição $pos");
} else {
  print("Usuário não cadastrado");
}
// Output: Usuário encontrado na posição 1
```

### Remover Item Específico

```dart
var lista = [10, 20, 30, 40];

int indice = lista.indexOf(30);

if (indice != -1) {
  lista.removeAt(indice);
  print("Item removido");
} else {
  print("Item não encontrado");
}

print("Lista: $lista");
// Output:
// Item removido
// Lista: [10, 20, 40]
```

### Validar Posição Inicial

```dart
var nomes = ["Ana", "Bruno", "Carlos"];

if (nomes.indexOf("Ana") == 0) {
  print("Ana é a primeira");
}
// Output: Ana é a primeira
```

### Encontrar Duplicata

```dart
var letras = ["A", "B", "C", "B", "D"];

int primeira = letras.indexOf("B");
int segunda = letras.indexOf("B", primeira + 1);

if (segunda != -1) {
  print("'B' aparece em posições $primeira e $segunda");
}
// Output: 'B' aparece em posições 1 e 3
```

### Ordenação de Prioridade

```dart
var prioridades = ["alta", "baixa", "média", "alta"];

for (var p in prioridades) {
  int pos = prioridades.indexOf(p);
  print("$p está na posição $pos");
}
// Output:
// alta está na posição 0
// baixa está na posição 1
// média está na posição 2
// alta está na posição 0
```

---

## indexOf vs Alternativas

| Método | Retorna | Busca |
|--------|---------|-------|
| `indexOf()` | Índice | Por VALOR |
| `contains()` | bool | Por VALOR |
| `indexWhere()` | Índice | Por CONDIÇÃO |

```dart
var lista = [10, 20, 30];

lista.indexOf(20);                  // 1
lista.contains(20);                 // true
lista.indexWhere((n) => n == 20);   // 1
```

---

## Encontrar Última Ocorrência

### Usar lastIndexOf

```dart
var numeros = [1, 2, 3, 2, 4];

int primeira = numeros.indexOf(2);
int ultima = numeros.lastIndexOf(2);

print("Primeira 'de 2': $primeira");
print("Última '2': $ultima");
// Output:
// Primeira 'de 2': 1
// Última '2': 3
```

### Remover Última

```dart
var lista = ["A", "B", "A"];

int ultimoIndice = lista.lastIndexOf("A");
if (ultimoIndice != -1) {
  lista.removeAt(ultimoIndice);
}

print("Após remover último A: $lista");
// Output: Após remover último A: [A, B]
```

---

## ✅ Padrões Recomendados

### Função Segura

```dart
bool estaEm<T>(List<T> lista, T item) {
  return lista.indexOf(item) != -1;
}

var numeros = [10, 20, 30];

print(estaEm(numeros, 20));  // true
print(estaEm(numeros, 50));  // false
```

### Encontrar Posição com Validação

```dart
int buscarIndice(List<String> lista, String item) {
  int indice = lista.indexOf(item);
  
  if (indice == -1) {
    print("'$item' não encontrado");
    return -1;
  }
  
  print("'$item' está na posição $indice");
  return indice;
}

var frutas = ["Maçã", "Banana"];
buscarIndice(frutas, "Banana");
buscarIndice(frutas, "Uva");
// Output:
// 'Banana' está na posição 1
// 'Uva' não encontrado
```

### Contar Ocorrências

```dart
int contarOcorrencias<T>(List<T> lista, T item) {
  int cont = 0;
  int indice = lista.indexOf(item);
  
  while (indice != -1) {
    cont++;
    indice = lista.indexOf(item, indice + 1);
  }
  
  return cont;
}

var numeros = [1, 2, 3, 2, 4, 2];
print("Ocorrências de 2: ${contarOcorrencias(numeros, 2)}");
// Output: Ocorrências de 2: 3
```

---

## Ver Também
- [Aula 11: indexWhere](aula11-indexwhere.md) - Encontrar índice com condição
- [Aula 07: contains](aula07-contains.md) - Verificar existência
- [Aula 08: elementAt](aula08-elementat.md) - Acessar por índice

