# remove - Remover Item por Valor

## Índice
- [Método remove()](#método-remove)
- [Usando remove()](#usando-remove)
- [Casos de Uso](#casos-de-uso)

---

## Método remove()

Remove a primeira ocorrência de um item específico da lista:

### Sintaxe

```dart
bool removido = minhaLista.remove(valor);
```

### Características

- **Retorna:** `true` se removeu, `false` se não encontrou
- **Busca:** Por VALOR, não por índice
- **Remove:** Apenas primeira ocorrência
- **Modifica:** A lista original

---

## Usando remove()

### Remoção Simples

```dart
var lista = [1, 2, 3, 2, 4];
print("Lista inicial: $lista");

bool removeu = lista.remove(2);
print("Removeu? $removeu");
print("Lista atualizada: $lista");
// Output:
// Lista inicial: [1, 2, 3, 2, 4]
// Removeu? true
// Lista atualizada: [1, 3, 2, 4]
```

### Remover String

```dart
var nomes = ["Ana", "Bruno", "Carlos", "Bruno"];
print("Nomes: $nomes");

nomes.remove("Bruno");
print("Após remover 'Bruno': $nomes");
// Output:
// Nomes: [Ana, Bruno, Carlos, Bruno]
// Após remover 'Bruno': [Ana, Carlos, Bruno]
```

### Verificar Remoção

```dart
var numeros = [10, 20, 30];

if (numeros.remove(20)) {
  print("Número removido com sucesso");
} else {
  print("Número não encontrado");
}

print("Lista: $numeros");
// Output:
// Número removido com sucesso
// Lista: [10, 30]
```

---

## Casos de Uso

### Sistema de Carrinho

```dart
var carrinho = ["Notebook", "Mouse", "Teclado"];

carrinho.remove("Mouse");
print("Carrinho após remover Mouse: $carrinho");
// Output: Carrinho após remover Mouse: [Notebook, Teclado]
```

### Lista de Tarefas

```dart
var tarefas = ["Estudar", "Exercitar", "Estudar", "Descansar"];

tarefas.remove("Estudar");  // Remove primeira
print("Após remover primeira 'Estudar': $tarefas");
// Output: Após remover primeira 'Estudar': [Exercitar, Estudar, Descansar]
```

### Remover Usuário

```dart
var usuarios = ["Ana", "Bruno", "Carlos"];

bool removido = usuarios.remove("Bruno");

if (removido) {
  print("Usuário removido");
  print("Usuários restantes: $usuarios");
} else {
  print("Usuário não encontrado");
}
// Output:
// Usuário removido
// Usuários restantes: [Ana, Carlos]
```

### Filtro de Palavras

```dart
var palavras = ["boa", "ma", "boa", "noite"];

palavras.remove("ma");  // Remove primeira
print("Palavras após remover 'ma': $palavras");
// Output: Palavras após remover 'ma': [boa, boa, noite]
```

---

## remove vs removeAt

| Método | Busca | Parâmetro | Exemplo |
|--------|-------|-----------|---------|
| `remove(valor)` | Por VALOR | Valor a remover | `lista.remove(2)` |
| `removeAt(índice)` | Por ÍNDICE | Posição | `lista.removeAt(0)` |

```dart
var lista = [10, 20, 30];

lista.remove(20);    // Remove o valor 20 → [10, 30]
lista.removeAt(1);   // Remove posição 1 → [10]
```

---

## Removendo Todas as Ocorrências

### Usando removeWhere

```dart
var numeros = [1, 2, 3, 2, 4, 2];

numeros.removeWhere((n) => n == 2);  // Remove TODAS as ocorrências
print("Após remover todos os 2s: $numeros");
// Output: Após remover todos os 2s: [1, 3, 4]
```

### Com Validação

```dart
var numeros = [10, 20, 30, 40, 50];

numeros.removeWhere((n) => n > 25);  // Remove > 25
print("Após remover maiores que 25: $numeros");
// Output: Após remover maiores que 25: [10, 20]
```

---

## ✅ Padrões Recomendados

### Remover com Validação

```dart
bool removerUsuario(List<String> usuarios, String usuario) {
  if (usuarios.isEmpty) {
    return false;
  }
  
  return usuarios.remove(usuario);
}

var usuarios = ["Ana", "Bruno"];
if (removerUsuario(usuarios, "Ana")) {
  print("Removido: $usuarios");
} else {
  print("Falha na remoção");
}
// Output: Removido: [Bruno]
```

### Remover se Existe

```dart
var lista = [1, 2, 3];
var item = 2;

if (lista.contains(item)) {
  lista.remove(item);
  print("Item removido");
} else {
  print("Item não existe");
}

print("Lista: $lista");
// Output:
// Item removido
// Lista: [1, 3]
```

### Limpar Itens Específicos

```dart
var dados = ["A", "B", "X", "C", "X"];

// Remover todos os "X"
while (dados.contains("X")) {
  dados.remove("X");
}

print("Dados limpos: $dados");
// Output: Dados limpos: [A, B, C]
```

---

## Ver Também
- [Aula 05: removeAt](aula05-removeat.md) - Remover por índice
- [Aula 06: clear](aula06-clear.md) - Limpar toda lista
- [Aula 07: contains](aula07-contains.md) - Verificar se contém

