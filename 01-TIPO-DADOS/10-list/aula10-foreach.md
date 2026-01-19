# forEach - Iterar sobre Elementos

## Índice
- [Método forEach()](#método-foreach)
- [Usando forEach()](#usando-foreach)
- [Casos de Uso](#casos-de-uso)

---

## Método forEach()

Executa uma função para cada elemento da lista:

### Sintaxe

```dart
minhaLista.forEach((elemento) {
  // ação com elemento
});

minhaLista.forEach((elemento) => acao);
```

### Características

- **Retorna:** void (não retorna nada)
- **Parâmetro:** Função a executar
- **Itera:** Sobre cada elemento
- **Ordem:** Do primeiro ao último

---

## Usando forEach()

### Impressão Simples

```dart
var usuarios = <String>["Alencar", "Gabul", "Letícia"];
print("Lista de usuários: $usuarios");

print("Iterando sobre a lista:");
usuarios.forEach((e) {
  print("Alunx: $e");
});
// Output:
// Lista de usuários: [Alencar, Gabul, Letícia]
// Iterando sobre a lista:
// Alunx: Alencar
// Alunx: Gabul
// Alunx: Letícia
```

### Lambda Curta

```dart
var nomes = ["Ana", "Bruno", "Carlos"];

nomes.forEach((nome) => print("Olá, $nome!"));
// Output:
// Olá, Ana!
// Olá, Bruno!
// Olá, Carlos!
```

### Com Cálculo

```dart
var salarios = [1000, 1500, 2000];
var totalSalarios = 0;

salarios.forEach((salario) {
  totalSalarios += salario;
});

print("Total dos salários: $totalSalarios");
// Output: Total dos salários: 4500
```

---

## Casos de Uso

### Listar Itens

```dart
var tarefas = ["Estudar", "Exercitar", "Descansar"];

print("Tarefas do dia:");
tarefas.forEach((tarefa) {
  print("  ✓ $tarefa");
});
// Output:
// Tarefas do dia:
//   ✓ Estudar
//   ✓ Exercitar
//   ✓ Descansar
```

### Processar Dados

```dart
var precos = [10.50, 25.00, 15.75];
var desconto = 0.1;  // 10% desconto

print("Preços com desconto:");
precos.forEach((preco) {
  var comDesconto = preco * (1 - desconto);
  print("R$ ${preco} → R$ ${comDesconto.toStringAsFixed(2)}");
});
// Output:
// Preços com desconto:
// R$ 10.5 → R$ 9.45
// R$ 25.0 → R$ 22.50
// R$ 15.75 → R$ 14.18
```

### Acumular Valores

```dart
var usersEx = <String>["Ale", "Ramon", "Vivi", "Max"];

print("Lista de usuários: $usersEx");

print("Executando forEach para imprimir cada usuário...");
usersEx.forEach((e) {
  print("   Usuário: $e");
});
// Output:
// Lista de usuários: [Ale, Ramon, Vivi, Max]
// Executando forEach para imprimir cada usuário...
//    Usuário: Ale
//    Usuário: Ramon
//    Usuário: Vivi
//    Usuário: Max
```

### Criar Mensagens

```dart
var nomes = ["Ana", "Bruno"];

var mensagens = <String>[];

nomes.forEach((nome) {
  mensagens.add("Bem-vindo, $nome!");
});

print("Mensagens: $mensagens");
// Output: Mensagens: [Bem-vindo, Ana!, Bem-vindo, Bruno!]
```

### Somar Salários Gerados

```dart
// Exemplo prático com geração dinâmica
var salarios = List.generate(12, (index) => 1500 * (index + 1));

print("Salários gerados: $salarios");

var total = 0;
salarios.forEach((element) {
  total += element;
});

print("Total acumulado: $total");
// Output:
// Salários gerados: [1500, 3000, 4500, 6000, 7500, 9000, 10500, 12000, 13500, 15000, 16500, 18000]
// Total acumulado: 117000
```

---

## forEach vs for

| Forma | Sintaxe | Uso |
|-------|---------|-----|
| `forEach` | `lista.forEach((e) => ...)` | Ação simples |
| `for-in` | `for (var e in lista)` | Controle mais |
| `for` | `for (int i = 0; i < n; i++)` | Índice necessário |

```dart
var lista = [1, 2, 3];

// forEach
lista.forEach((item) => print(item));

// for-in
for (var item in lista) print(item);

// for tradicional
for (int i = 0; i < lista.length; i++) print(lista[i]);
```

---

## ✅ Padrões Recomendados

### Processar com Índice

```dart
var items = ["A", "B", "C"];
var indice = 0;

items.forEach((item) {
  print("[$indice]: $item");
  indice++;
});
// Output:
// [0]: A
// [1]: B
// [2]: C

// Alternativa melhor: usar for-in
items.asMap().forEach((i, item) {
  print("[$i]: $item");
});
```

### Validar Todos

```dart
var emails = ["user@email.com", "admin@company.com"];

bool todosValidos = true;

emails.forEach((email) {
  if (!email.contains("@")) {
    todosValidos = false;
  }
});

print("Todos válidos? $todosValidos");
// Output: Todos válidos? true
```

### Construir Estrutura

```dart
var dados = [10, 20, 30];
var resultado = <String>[];

dados.forEach((valor) {
  resultado.add("Valor: $valor");
});

print(resultado);
// Output: [Valor: 10, Valor: 20, Valor: 30]
```

### Com Efeito Colateral

```dart
var log = <String>[];

[1, 2, 3].forEach((n) {
  var mensagem = "Processando $n";
  log.add(mensagem);
  print(mensagem);
});

print("\nLog: $log");
// Output:
// Processando 1
// Processando 2
// Processando 3
//
// Log: [Processando 1, Processando 2, Processando 3]
```

---

## Ver Também
- [Aula 09: firstWhere](aula09-firstwhere.md) - Encontrar com condição
- [Aula 08: elementAt](aula08-elementat.md) - Acessar elemento
- [Aula 01: Declaração](aula01-declaracao.md) - Criar listas

