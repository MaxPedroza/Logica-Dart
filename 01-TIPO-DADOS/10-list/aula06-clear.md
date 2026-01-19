# clear - Limpar Lista

## Índice
- [Método clear()](#método-clear)
- [Usando clear()](#usando-clear)
- [Casos de Uso](#casos-de-uso)

---

## Método clear()

Remove todos os itens da lista, deixando-a vazia:

### Sintaxe

```dart
minhaLista.clear();
```

### Características

- **Retorna:** void (não retorna nada)
- **Efeito:** Remove tudo
- **Modifica:** A lista original
- **Resultado:** Lista vazia

---

## Usando clear()

### Limpeza Simples

```dart
var lista = [1, 2, 3, 4, 5];
print("Lista inicial: $lista");

lista.clear();
print("Lista após clear(): $lista");
// Output:
// Lista inicial: [1, 2, 3, 4, 5]
// Lista após clear(): []
```

### Verificar Depois

```dart
var numeros = [10, 20, 30];
print("Antes: ${numeros.length} elementos");

numeros.clear();
print("Depois: ${numeros.length} elementos");
print("Vazia? ${numeros.isEmpty}");
// Output:
// Antes: 3 elementos
// Depois: 0 elementos
// Vazia? true
```

---

## Casos de Uso

### Resetar Estado

```dart
var carrinho = ["Notebook", "Mouse", "Teclado"];

print("Carrinho: $carrinho");
print("Total de itens: ${carrinho.length}");

// Usuário esvazia carrinho
carrinho.clear();

print("\nApós esvaziar:");
print("Carrinho: $carrinho");
print("Total de itens: ${carrinho.length}");
// Output:
// Carrinho: [Notebook, Mouse, Teclado]
// Total de itens: 3
//
// Após esvaziar:
// Carrinho: []
// Total de itens: 0
```

### Limpar Cache

```dart
var cache = ["dados1", "dados2", "dados3"];

print("Cache cheio: ${cache.length} itens");

// Limpar cache quando espaço acaba
cache.clear();

print("Cache limpo: ${cache.length} itens");
// Output:
// Cache cheio: 3 itens
// Cache limpo: 0 itens
```

### Reiniciar Jogo

```dart
var placar = [10, 20, 30, 15];

print("Placar anterior: $placar");

// Novo jogo começa
placar.clear();
placar.add(0);  // Reiniciar com 0

print("Novo jogo: $placar");
// Output:
// Placar anterior: [10, 20, 30, 15]
// Novo jogo: [0]
```

### Limpar Log

```dart
var logs = [
  "Login realizado",
  "Arquivo salvo",
  "Erro de conexão",
  "Sincronização concluída"
];

print("Logs: ${logs.length} eventos");

// Limpar histórico
logs.clear();

print("Logs após limpeza: ${logs.length} eventos");
// Output:
// Logs: 4 eventos
// Logs após limpeza: 0 eventos
```

### Processar e Limpar

```dart
var filaProcessamento = ["tarefa1", "tarefa2", "tarefa3"];

print("Processando ${filaProcessamento.length} tarefas...");

for (var tarefa in filaProcessamento) {
  print("✓ $tarefa concluída");
}

// Após processar, limpar
filaProcessamento.clear();

print("Fila limpa: ${filaProcessamento.isEmpty}");
// Output:
// Processando 3 tarefas...
// ✓ tarefa1 concluída
// ✓ tarefa2 concluída
// ✓ tarefa3 concluída
// Fila limpa: true
```

---

## Alternativas a clear()

### Reatribuir Vazia

```dart
var lista = [1, 2, 3];

// Alternativa 1: clear()
lista.clear();

// Alternativa 2: nova lista
lista = [];

// Ambas resultam em lista vazia
print("Lista: $lista");
// Output: Lista: []
```

### Remove While

```dart
var lista = [1, 2, 3, 4, 5];

// Remove todos (similar a clear)
lista.removeWhere((_) => true);

print("Lista: $lista");
// Output: Lista: []
```

---

## ✅ Padrões Recomendados

### Limpar com Confirmação

```dart
bool limparComConfirmacao(List lista) {
  if (lista.isEmpty) {
    return false;
  }
  
  print("Limpando ${lista.length} itens...");
  lista.clear();
  return true;
}

var dados = [1, 2, 3];

if (limparComConfirmacao(dados)) {
  print("Lista limpa com sucesso");
} else {
  print("Lista já estava vazia");
}
// Output: Lista limpa com sucesso
```

### Fazer Backup Antes de Limpar

```dart
List<T> limparComBackup<T>(List<T> lista) {
  // Fazer cópia antes de limpar
  var backup = List.from(lista);
  lista.clear();
  return backup;
}

var original = [1, 2, 3];
var copia = limparComBackup(original);

print("Original: $original");
print("Backup: $copia");
// Output:
// Original: []
// Backup: [1, 2, 3]
```

### Resetar para Valor Padrão

```dart
void resetar(List lista, dynamic valorPadrao) {
  lista.clear();
  lista.add(valorPadrao);
}

var numeros = [1, 2, 3];
resetar(numeros, 0);

print("Após reset: $numeros");
// Output: Após reset: [0]
```

### Limpar se Exceder Limite

```dart
void limparSeLargo(List lista, int limite) {
  if (lista.length > limite) {
    print("Lista excedeu limite de $limite itens");
    lista.clear();
  }
}

var buffer = [1, 2, 3, 4, 5];
limparSeLargo(buffer, 3);

print("Buffer: $buffer");
// Output:
// Lista excedeu limite de 3 itens
// Buffer: []
```

---

## Ver Também
- [Aula 04: remove](aula04-remove.md) - Remover item específico
- [Aula 05: removeAt](aula05-removeat.md) - Remover por índice
- [Aula 03: addAll](aula03-addall.md) - Adicionar múltiplos

