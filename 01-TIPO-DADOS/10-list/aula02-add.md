# add - Adicionar um Item

## Índice
- [Método add()](#método-add)
- [Usando add()](#usando-add)
- [Casos de Uso](#casos-de-uso)

---

## Método add()

Adiciona um item ao final da lista:

### Sintaxe

```dart
minhaLista.add(elemento);
```

### Características

- **Retorna:** void (não retorna nada)
- **Efeito:** Adiciona ao final
- **Modifica:** A lista original
- **Crescimento:** A lista cresce de tamanho

---

## Usando add()

### Adição Simples

```dart
var lista = [];
print("Lista inicial: $lista");

lista.add(10);
print("Lista atualizada: $lista");
// Output:
// Lista inicial: []
// Lista atualizada: [10]
```

### Múltiplas Adições

```dart
var numeros = [1, 2, 3];
print("Lista inicial: $numeros");

numeros.add(4);
numeros.add(5);
numeros.add(6);

print("Lista após adicionar: $numeros");
// Output:
// Lista inicial: [1, 2, 3]
// Lista após adicionar: [1, 2, 3, 4, 5, 6]
```

### Com Diferentes Tipos

```dart
// Strings
var nomes = <String>[];
nomes.add("Ana");
nomes.add("Bruno");

print("Nomes: $nomes");
// Output: Nomes: [Ana, Bruno]
```

---

## Casos de Uso

### Sistema de Carrinho de Compras

```dart
var carrinho = <String>[];

carrinho.add("Notebook");
carrinho.add("Mouse");
carrinho.add("Teclado");

print("Itens no carrinho: $carrinho");
// Output: Itens no carrinho: [Notebook, Mouse, Teclado]
```

### Lista de Tarefas

```dart
var tarefas = <String>[];

tarefas.add("Estudar Dart");
tarefas.add("Fazer exercícios");
tarefas.add("Revisar conceitos");

print("Tarefas: ${tarefas.length} itens");
for (var tarefa in tarefas) {
  print("- $tarefa");
}
// Output:
// Tarefas: 3 itens
// - Estudar Dart
// - Fazer exercícios
// - Revisar conceitos
```

### Construindo Lista de Resultados

```dart
var resultados = <int>[];

// Simulando processamento
for (int i = 1; i <= 5; i++) {
  resultados.add(i * 10);
}

print("Resultados: $resultados");
// Output: Resultados: [10, 20, 30, 40, 50]
```

### Acumulador Dinâmico

```dart
var pontuacoes = <double>[];

pontuacoes.add(8.5);
pontuacoes.add(9.0);
pontuacoes.add(7.5);

double total = 0;
for (var pontuacao in pontuacoes) {
  total += pontuacao;
}

print("Pontuações: $pontuacoes");
print("Total: $total");
// Output:
// Pontuações: [8.5, 9.0, 7.5]
// Total: 25.0
```

### Registrar Eventos

```dart
var eventos = <String>[];

eventos.add("Usuário conectado");
eventos.add("Arquivo carregado");
eventos.add("Operação concluída");

print("Log de eventos: ${eventos.length}");
for (var evento in eventos) {
  print("✓ $evento");
}
// Output:
// Log de eventos: 3
// ✓ Usuário conectado
// ✓ Arquivo carregado
// ✓ Operação concluída
```

---

## Comparação: add vs addAll

| Método | Parâmetro | Resultado |
|--------|-----------|-----------|
| `add()` | Um item | Adiciona 1 elemento |
| `addAll()` | Uma lista | Adiciona múltiplos |

```dart
var lista = [1, 2];

lista.add(3);           // [1, 2, 3]
lista.addAll([4, 5]);   // [1, 2, 3, 4, 5]
```

---

## ✅ Padrões Recomendados

### Adicionar com Validação

```dart
bool adicionarUsuario(List<String> usuarios, String novoUsuario) {
  if (novoUsuario.isEmpty) {
    return false;
  }
  
  if (usuarios.contains(novoUsuario)) {
    return false;  // Já existe
  }
  
  usuarios.add(novoUsuario);
  return true;
}

var usuarios = ["Ana", "Bruno"];
if (adicionarUsuario(usuarios, "Carlos")) {
  print("Usuário adicionado: $usuarios");
} else {
  print("Falha ao adicionar");
}
// Output: Usuário adicionado: [Ana, Bruno, Carlos]
```

### Construir Lista Dinamicamente

```dart
List<int> gerarPares(int quantidade) {
  var pares = <int>[];
  
  for (int i = 0; i < quantidade; i++) {
    pares.add((i + 1) * 2);
  }
  
  return pares;
}

var resultado = gerarPares(5);
print("Pares: $resultado");
// Output: Pares: [2, 4, 6, 8, 10]
```

### Com Condições

```dart
var numeros = [1, 2, 3, 4, 5];
var pares = <int>[];

for (var num in numeros) {
  if (num % 2 == 0) {
    pares.add(num);
  }
}

print("Números pares: $pares");
// Output: Números pares: [2, 4]
```

---

## Ver Também
- [Aula 01: Declaração](aula01-declaracao.md) - Como criar listas
- [Aula 03: addAll](aula03-addall.md) - Adicionar múltiplos itens
- [Aula 04: remove](aula04-remove.md) - Remover itens

