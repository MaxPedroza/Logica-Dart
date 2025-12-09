# Listas em Dart

As listas (`List`) são a estrutura de dados mais comum em Dart. Elas representam uma coleção ordenada de objetos, acessíveis por um índice numérico. Se você vem de outras linguagens, pode conhecê-las como _Arrays_.

---

## Índice

1. [Introdução](#introdução)
2. [Declarando Listas](#declarando-listas)
3. [Adicionando Elementos](#adicionando-elementos)
4. [Removendo Elementos](#removendo-elementos)
5. [Acessando e Modificando](#acessando-e-modificando)
6. [Iterando sobre Listas](#iterando-sobre-listas)
7. [Métodos Úteis](#métodos-úteis)
8. [Boas Práticas](#boas-práticas)

---

## Introdução

Uma `List` em Dart é uma coleção indexada, onde o primeiro elemento está no índice 0. Elas podem ter tamanho fixo ou crescer dinamicamente (o padrão).

```dart
// Uma lista simples de números inteiros
List<int> numeros = [1, 2, 3, 4, 5];
```

---

## Declarando Listas

Existem várias formas de criar listas em Dart, dependendo da sua necessidade.

### Lista Literal

A forma mais comum. O Dart infere o tipo automaticamente ou você pode especificar.

```dart
var nomes = ['Ana', 'Pedro', 'Maria']; // List<String>
List<int> idades = [20, 30, 40];
```

### Lista Vazia

```dart
var vazia = []; // List<dynamic> (Cuidado!)
var vaziaTipada = <String>[]; // List<String> vazia
List<String> outraVazia = [];
```

### Construtores Especiais

- **List.filled:** Cria uma lista de tamanho fixo preenchida com um valor.
- **List.generate:** Gera uma lista usando uma função geradora.

```dart
// Lista com 3 elementos, todos sendo 0
var zeros = List.filled(3, 0); // [0, 0, 0]

// Gera: [0, 2, 4, 6, 8]
var pares = List.generate(5, (index) => index * 2);
```

---

## Adicionando Elementos

Para listas de tamanho dinâmico (o padrão), você pode adicionar elementos a qualquer momento.

```dart
void main() {
  var frutas = <String>['Maçã'];

  // Adicionar um item ao final (.add)
  frutas.add('Banana');

  // Adicionar vários itens (.addAll)
  frutas.addAll(['Laranja', 'Uva']);

  // Inserir em uma posição específica (.insert)
  // Insere 'Morango' no índice 1 (segunda posição)
  frutas.insert(1, 'Morango');

  print(frutas);
  // [Maçã, Morango, Banana, Laranja, Uva]
}
```

---

## Removendo Elementos

Dart oferece métodos flexíveis para remover itens.

```dart
void main() {
  var numeros = [10, 20, 30, 40, 50, 20];

  // Remover um valor específico (apenas a primeira ocorrência)
  numeros.remove(20); // Remove o primeiro 20

  // Remover pelo índice
  numeros.removeAt(0); // Remove o 10 (índice 0)

  // Remover o último elemento
  numeros.removeLast();

  // Remover com condição (remove todos maiores que 35)
  numeros.removeWhere((numero) => numero > 35);

  // Limpar toda a lista
  numeros.clear();
}
```

---

## Acessando e Modificando

Você acessa elementos usando colchetes `[]` e o índice (começando em 0).

```dart
void main() {
  var cores = ['Azul', 'Verde', 'Amarelo'];

  // Acessar (Leitura)
  print(cores[0]); // Azul
  print(cores.first); // Primeiro elemento
  print(cores.last); // Último elemento

  // Modificar (Escrita)
  cores[1] = 'Vermelho'; // Muda Verde para Vermelho

  // Verificar tamanho
  print(cores.length); // 3

  // Verificar se está vazia
  print(cores.isEmpty); // false
  print(cores.isNotEmpty); // true
}
```

---

## Iterando sobre Listas

Como percorrer todos os itens de uma lista?

### For-in (Recomendado)

A maneira mais limpa e legível.

```dart
for (var cor in cores) {
  print(cor);
}
```

### ForEach

Método funcional.

```dart
cores.forEach((cor) => print(cor));
```

### For Clássico

Útil quando você precisa do índice.

```dart
for (var i = 0; i < cores.length; i++) {
  print('${i}: ${cores[i]}');
}
```

---

## Métodos Úteis

A classe `List` (que implementa `Iterable`) é muito poderosa.

- **contains(valor):** Verifica se a lista contém o valor.
- **indexOf(valor):** Retorna o índice do valor (ou -1 se não achar).
- **sublist(inicio, [fim]):** Retorna uma parte da lista.
- **shuffle():** Embaralha a lista aleatoriamente.
- **sort():** Ordena a lista (modifica a original).
- **map():** Transforma cada elemento (retorna um novo Iterable).
- **where():** Filtra elementos (retorna um novo Iterable).

```dart
var numeros = [1, 2, 3, 4, 5];

// Filtrar pares
var pares = numeros.where((n) => n % 2 == 0).toList(); // [2, 4]

// Multiplicar todos por 2
var dobro = numeros.map((n) => n * 2).toList(); // [2, 4, 6, 8, 10]
```

---

## Boas Práticas

1.  **Use Tipagem:** Sempre que possível, especifique o tipo da lista (`List<String>`) para evitar erros e garantir a segurança de tipos.
2.  **Preferência por Literais:** Use `[]` em vez de `new List()`.
3.  **Cuidado com `const`:** Se declarar uma lista como `const`, ela será imutável. Tentar adicionar ou remover itens causará erro.
    ```dart
    const fixa = [1, 2, 3];
    // fixa.add(4); // ERRO!
    ```
4.  **Spread Operator (...):** Use `...` para inserir uma lista dentro de outra facilmente.
    ```dart
    var a = [1, 2];
    var b = [3, 4];
    var c = [...a, ...b]; // [1, 2, 3, 4]
    ```
