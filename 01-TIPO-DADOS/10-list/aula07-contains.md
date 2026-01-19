# contains - Verificar se Contém Item

## Índice
- [Método contains()](#método-contains)
- [Usando contains()](#usando-contains)
- [Casos de Uso](#casos-de-uso)

---

## Método contains()

Verifica se um item existe na lista:

### Sintaxe

```dart
bool existe = minhaLista.contains(valor);
```

### Características

- **Retorna:** `true` se existe, `false` caso contrário
- **Busca:** Por VALOR
- **Comparação:** Usa igualdade (==)
- **Eficiente:** O(n) - percorre até encontrar

---

## Usando contains()

### Verificação Simples

```dart
var usuarios = <String>["Ale", "Ramon", "Vivi", "Max"];
print("Lista de usuários: $usuarios");

var containsRamon = usuarios.contains("Ramon");
print("A lista contém 'Ramon'? $containsRamon");
// Output:
// Lista de usuários: [Ale, Ramon, Vivi, Max]
// A lista contém 'Ramon'? true
```

### Em Condições

```dart
var numeros = [10, 20, 30, 40];

if (numeros.contains(25)) {
  print("25 existe");
} else {
  print("25 não existe");
}
// Output: 25 não existe
```

### Com Strings

```dart
var frutas = ["Maçã", "Banana", "Laranja"];

bool temBanana = frutas.contains("Banana");
print("Tem banana? $temBanana");
// Output: Tem banana? true
```

---

## Casos de Uso

### Validar Entrada

```dart
var clientesVIP = ["Ana Silva", "Bruno Costa", "Diana Santos"];
String novoCliente = "Ana Silva";

if (clientesVIP.contains(novoCliente)) {
  print("✓ Cliente VIP reconhecido");
} else {
  print("Cliente normal");
}
// Output: ✓ Cliente VIP reconhecido
```

### Validar Permissões

```dart
var permissoes = ["ler", "escrever", "executar"];
String acao = "deletar";

if (permissoes.contains(acao)) {
  print("Ação permitida");
} else {
  print("❌ Ação não permitida");
}
// Output: ❌ Ação não permitida
```

### Verificar Linguagens

```dart
var linguagens = ["Dart", "Kotlin", "Swift"];

if (linguagens.contains("Dart")) {
  print("Temos expertise em Dart");
}
// Output: Temos expertise em Dart
```

### Validar Status

```dart
var statusValidos = ["ativo", "inativo", "pendente"];
String status = "processando";

if (statusValidos.contains(status)) {
  print("Status válido");
} else {
  print("Status inválido: $status");
}
// Output: Status inválido: processando
```

### Adicionar se Não Existe

```dart
var lista = [1, 2, 3];

if (!lista.contains(4)) {
  lista.add(4);
}

print("Lista: $lista");
// Output: Lista: [1, 2, 3, 4]
```

### Remover se Existe

```dart
var lista = [1, 2, 3, 4, 5];

if (lista.contains(3)) {
  lista.remove(3);
  print("Item removido");
}

print("Lista: $lista");
// Output:
// Item removido
// Lista: [1, 2, 4, 5]
```

---

## Comparação com Outras Buscas

| Método | Retorna | Uso |
|--------|---------|-----|
| `contains()` | `bool` | Verificar existência |
| `indexOf()` | `int` | Encontrar posição |
| `firstWhere()` | Valor | Encontrar com condição |

```dart
var lista = [10, 20, 30];

lista.contains(20);           // true - existe?
lista.indexOf(20);            // 1 - qual posição?
lista.firstWhere((n) => n > 15);  // 20 - primeiro que atende condição
```

---

## Sensibilidade

### Case Sensitive com Strings

```dart
var nomes = ["Ana", "Bruno"];

print(nomes.contains("ana"));    // false (minúscula)
print(nomes.contains("Ana"));    // true (exato)
```

### Solução: Comparar em Minúsculas

```dart
var nomes = ["Ana", "Bruno"];

bool contem(List<String> lista, String procurado) {
  return lista.map((n) => n.toLowerCase())
      .contains(procurado.toLowerCase());
}

print(contem(nomes, "ana"));  // true
```

---

## ✅ Padrões Recomendados

### Duplicata Prevention

```dart
void adicionarSemDuplicata<T>(List<T> lista, T item) {
  if (!lista.contains(item)) {
    lista.add(item);
    print("$item adicionado");
  } else {
    print("$item já existe");
  }
}

var usuarios = ["Ana", "Bruno"];
adicionarSemDuplicata(usuarios, "Ana");
adicionarSemDuplicata(usuarios, "Carlos");
// Output:
// Ana já existe
// Carlos adicionado
```

### Filtrar Conhecidos

```dart
var conhecidos = ["Ana", "Bruno"];
var possiveisAmigos = ["Ana", "Carlos", "Diana"];

var novosAmigos = possiveisAmigos
    .where((p) => !conhecidos.contains(p))
    .toList();

print("Novos amigos: $novosAmigos");
// Output: Novos amigos: [Carlos, Diana]
```

### Validar Lista de Valores

```dart
bool todosValidos(List<String> lista, List<String> validos) {
  return lista.every((item) => validos.contains(item));
}

var tamanhos = ["P", "M", "G"];
var tamanhosMet = ["P", "M", "G", "GG"];

print(todosValidos(tamanhos, tamanhosMet));  // true
```

---

## Ver Também
- [Aula 08: elementAt](aula08-elementat.md) - Acessar elemento
- [Aula 10: indexOf](aula10-indexof.md) - Encontrar posição
- [Aula 09: firstWhere](aula09-firstwhere.md) - Encontrar com condição

