# Variáveis em Dart

Este documento detalha o funcionamento, tipos e boas práticas para o uso de variáveis na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. Tipos de Declaração](#2-tipos-de-declaração)
  - [2.1 Inferência de Tipo (`var`)](#21-inferência-de-tipo-var)
  - [2.2 Tipos Explícitos](#22-tipos-explícitos)
- [3. Modificadores de Imutabilidade](#3-modificadores-de-imutabilidade)
  - [3.1 `final`](#31-final)
  - [3.2 `const`](#32-const)
- [4. Inicialização Tardia (`late`)](#4-inicialização-tardia-late)
- [5. Atribuição e Reatribuição](#5-atribuição-e-reatribuição)
- [6. Null Safety (Variáveis Nulas)](#6-null-safety-variáveis-nulas)
- [7. Interpolação de Strings](#7-interpolação-de-strings)
- [8. Operadores Básicos](#8-operadores-básicos)
- [9. Boas Práticas](#9-boas-práticas)

---

## 1. Introdução

Variáveis são espaços na memória utilizados para armazenar dados que podem ser manipulados durante a execução do programa. Em Dart, toda variável é um objeto e herda de uma classe base.

```dart
// Exemplo básico de declaração
var primeiraVariable = 'Olá, Mundo!';
```

## 2. Tipos de Declaração

Dart é uma linguagem fortemente tipada, mas suporta inferência de tipos, o que significa que o compilador pode deduzir o tipo da variável com base no valor atribuído.

### 2.1 Inferência de Tipo (`var`)

Ao usar `var`, você deixa o Dart decidir qual é o tipo da variável.

```dart
var nome = "João";  // Dart infere que é String
var idade = 25;     // Dart infere que é int
var altura = 1.75;  // Dart infere que é double
```

### 2.2 Tipos Explícitos

Você também pode (e às vezes deve) declarar o tipo explicitamente para tornar o código mais legível ou garantir um tipo específico.

```dart
String cidade = "São Paulo";
int ano = 2025;
double preco = 99.90;
bool ativo = true;
```

## 3. Modificadores de Imutabilidade

Para variáveis cujos valores não devem mudar, Dart oferece `final` e `const`.

### 3.1 `final`

Uma variável `final` só pode ser atribuída **uma única vez**. Seu valor é definido em **tempo de execução** (runtime).

```dart
final String pais = "Brasil";
// pais = "Argentina"; // Erro: não pode ser reatribuída
```

### 3.2 `const`

Uma variável `const` é uma constante em **tempo de compilação** (compile-time). Seu valor deve ser conhecido antes mesmo do programa rodar.

```dart
const int maiorIdadePermitida = 18;
// maiorIdadePermitida = 21; // Erro: constante não muda
```

## 4. Inicialização Tardia (`late`)

O modificador `late` permite declarar uma variável não-nula que será inicializada posteriormente. É útil quando o valor não está disponível imediatamente na declaração.

```dart
late String descricao;

// ... algum código ...

descricao = "Inicializada agora"; // Deve ser atribuída antes de ser usada
print(descricao);
```

## 5. Atribuição e Reatribuição

Variáveis comuns (não `final` ou `const`) podem ter seus valores alterados ao longo do tempo.

```dart
var contador = 0;
contador = 5;       // Reatribuição simples
contador++;         // Incremento
contador += 10;     // Soma e atribuição
```

## 6. Null Safety (Variáveis Nulas)

O Dart moderno possui **Null Safety**, o que significa que variáveis não podem ser nulas por padrão. Para permitir que uma variável receba `null`, você deve adicionar `?` ao tipo.

```dart
// Variável que aceita null
String? textoOpcional;
print(textoOpcional); // Imprime: null

textoOpcional = "Agora tem valor";
```

## 7. Interpolação de Strings

Dart facilita a inserção de valores de variáveis dentro de strings usando `$`.

```dart
String usuario = "Maria";
int anos = 30;

// Uso simples
print("Olá, $usuario!");

// Uso com expressões (cálculos, métodos)
print("Em 5 anos terei ${anos + 5} anos.");
```

## 8. Operadores Básicos

Variáveis numéricas suportam operações matemáticas comuns.

```dart
var a = 10;
var b = 3;

print(a + b);  // Adição
print(a - b);  // Subtração
print(a * b);  // Multiplicação
print(a / b);  // Divisão (retorna double)
print(a ~/ b); // Divisão inteira (retorna int)
print(a % b);  // Resto da divisão (módulo)
```

## 9. Boas Práticas

- **Nomes Descritivos**: Use nomes que revelem a intenção da variável.
  - ✅ `nomeCompleto`, `idadeAtual`
  - ❌ `x`, `n`, `val`
- **Imutabilidade**: Prefira `final` ou `const` sempre que o valor não precisar mudar. Isso evita efeitos colaterais indesejados.
- **CamelCase**: Use `lowerCamelCase` para nomes de variáveis (ex: `minhaVariavel`).

```dart
// Exemplo de boas práticas
final String enderecoFixo = "Rua Principal, 123";
const double PI = 3.14159;
```
