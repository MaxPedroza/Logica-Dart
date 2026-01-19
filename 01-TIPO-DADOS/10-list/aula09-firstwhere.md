# firstWhere - Encontrar Primeiro com Condição

## Índice
- [Método firstWhere()](#método-firstwhere)
- [Usando firstWhere()](#usando-firstwhere)
- [Casos de Uso](#casos-de-uso)

---

## Método firstWhere()

Retorna o primeiro elemento que atende uma condição:

### Sintaxe

```dart
var elemento = minhaLista.firstWhere((item) => condicao);
var elemento = minhaLista.firstWhere((item) => condicao, orElse: () => padrao);
```

### Características

- **Retorna:** O elemento que atende condição
- **Parámetro:** Função com condição bool
- **Erro:** Se nenhum encontrado (sem orElse)
- **Alternativa:** orElse para valor padrão

---

## Usando firstWhere()

### Busca Simples

```dart
var numeros = <int>[10, 15, 20, 25, 30];
print("Lista de números: $numeros");

var primeiroMaiorQue18 = numeros.firstWhere((num) => num > 18);
print("Primeiro número maior que 18: $primeiroMaiorQue18");
// Output:
// Lista de números: [10, 15, 20, 25, 30]
// Primeiro número maior que 18: 20
```

### Com orElse

```dart
var usuarios = <String>["Ale", "Ramon", "Vivi", "Max"];

String? item = usuarios.firstWhere(
  (e) => e.contains("QUERY"), 
  orElse: () => "VAZIO"
);

print("Item encontrado: $item");
// Output: Item encontrado: VAZIO
```

### Buscar por Propriedade

```dart
var nomes = ["Ana", "Bruno", "Carlos"];

var primeiroComA = nomes.firstWhere(
  (nome) => nome.startsWith("A")
);

print("Primeiro com 'A': $primeiroComA");
// Output: Primeiro com 'A': Ana
```

---

## Casos de Uso

### Validar Entrada

```dart
var permitidos = ["admin", "editor", "leitor"];
String papel = "editor";

try {
  var encontrado = permitidos.firstWhere((p) => p == papel);
  print("✓ Papel válido: $encontrado");
} catch (e) {
  print("✗ Papel inválido");
}
// Output: ✓ Papel válido: editor
```

### Filtro de Produtos

```dart
var produtos = [
  "Notebook - 2000",
  "Mouse - 50",
  "Teclado - 150",
  "Monitor - 800"
];

var produtoBarato = produtos.firstWhere(
  (p) => int.parse(p.split(" - ")[1]) < 100,
  orElse: () => "Nenhum produto barato"
);

print("Produto barato: $produtoBarato");
// Output: Produto barato: Mouse - 50
```

### Buscar Usuário Ativo

```dart
var usuariosStatus = ["Ana-inativo", "Bruno-ativo", "Carlos-inativo"];

var primeiroAtivo = usuariosStatus.firstWhere(
  (u) => u.endsWith("ativo"),
  orElse: () => "Ninguém ativo"
);

print("Usuário: $primeiroAtivo");
// Output: Usuário: Bruno-ativo
```

### Encontrar Item Crítico

```dart
var prioridades = [
  {"nome": "Tarefa 1", "urgencia": "baixa"},
  {"nome": "Tarefa 2", "urgencia": "alta"},
  {"nome": "Tarefa 3", "urgencia": "baixa"},
];

var tarefa = prioridades.firstWhere(
  (t) => t["urgencia"] == "alta",
  orElse: () => {"nome": "Nenhuma urgente"}
);

print("Tarefa urgente: ${tarefa["nome"]}");
// Output: Tarefa urgente: Tarefa 2
```

### Encontrar Primeiro Acima de Valor

```dart
var vendas = [100, 250, 150, 500, 300];

var primeiraMaiorQue200 = vendas.firstWhere(
  (v) => v > 200,
  orElse: () => 0
);

print("Primeira venda > 200: $primeiraMaiorQue200");
// Output: Primeira venda > 200: 250
```

---

## Tratamento de Erro

### Sem orElse (Erro)

```dart
var numeros = [1, 2, 3];

try {
  var valor = numeros.firstWhere((n) => n > 10);
} catch (e) {
  print("Erro: Nenhum elemento encontrado");
}
// Output: Erro: Nenhum elemento encontrado
```

### Com orElse (Seguro)

```dart
var numeros = [1, 2, 3];

var valor = numeros.firstWhere(
  (n) => n > 10,
  orElse: () => 0
);

print("Valor: $valor");
// Output: Valor: 0
```

---

## Comparação com Outros Métodos

| Método | Retorna | Erro |
|--------|---------|------|
| `firstWhere()` | Elemento | Se nenhum |
| `where()` | Lista | Nunca (pode vazia) |
| `indexOf()` | Índice | -1 se não existe |

---

## ✅ Padrões Recomendados

### Função Envolvida

```dart
T? buscarPrimeiro<T>(List<T> lista, bool Function(T) condicao, {T? padrao}) {
  try {
    return lista.firstWhere(condicao);
  } catch (e) {
    return padrao;
  }
}

var numeros = [5, 10, 15, 20];

var valor1 = buscarPrimeiro(numeros, (n) => n > 12);
var valor2 = buscarPrimeiro(numeros, (n) => n > 100, padrao: 0);

print("Valor 1: $valor1");
print("Valor 2: $valor2");
// Output:
// Valor 1: 15
// Valor 2: 0
```

### Validar Documento

```dart
List<String> documentos = ["123.456", "invalid", "789.012"];

var primeiroValido = documentos.firstWhere(
  (d) => d.length == 7 && d.contains("."),
  orElse: () => "Nenhum válido"
);

print("Documento válido: $primeiroValido");
// Output: Documento válido: 123.456
```

### Buscar com Múltiplas Condições

```dart
var pessoas = [
  {"nome": "Ana", "idade": 25, "ativo": false},
  {"nome": "Bruno", "idade": 30, "ativo": true},
  {"nome": "Carlos", "idade": 28, "ativo": true},
];

var pessoa = pessoas.firstWhere(
  (p) => p["idade"]! >= 25 && p["ativo"] == true,
  orElse: () => {"nome": "Ninguém"}
);

print("Pessoa encontrada: ${pessoa["nome"]}");
// Output: Pessoa encontrada: Bruno
```

---

## Ver Também
- [Aula 11: indexWhere](aula11-indexwhere.md) - Encontrar índice com condição
- [Aula 07: contains](aula07-contains.md) - Verificar existência
- [Aula 10: forEach](aula10-foreach.md) - Iterar elementos

