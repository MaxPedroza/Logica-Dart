# Operador AND (&&) em Dart

Este documento detalha o funcionamento, tabela verdade e aplicações práticas do operador AND na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é o Operador AND?](#2-o-que-é-o-operador-and)
- [3. Tabela Verdade](#3-tabela-verdade)
- [4. Sintaxe](#4-sintaxe)
- [5. Exemplos Básicos](#5-exemplos-básicos)
- [6. Múltiplas Condições](#6-múltiplas-condições)
- [7. Operadores de Comparação](#7-operadores-de-comparação)
- [8. Casos Práticos](#8-casos-práticos)
- [9. Boas Práticas](#9-boas-práticas)

---

## 1. Introdução

O operador **AND** (E lógico) é um dos operadores lógicos fundamentais da programação. Ele é usado para criar condições que exigem que **TODAS** as expressões sejam verdadeiras para que o resultado final seja verdadeiro.

```dart
// Exemplo básico
if ((idade >= 18) && (renda > 1000)) {
  print("Elegível para crédito");
}
```

## 2. O que é o Operador AND?

O operador AND avalia múltiplas condições e retorna:

- **true** (verdadeiro) → quando **TODAS** as condições são verdadeiras
- **false** (falso) → quando **QUALQUER UMA** das condições é falsa

### Características

- 📌 Sintaxe: `&&`
- 📌 Tipo: Operador lógico binário
- 📌 Operandos: Expressões booleanas (true/false)
- 📌 Avaliação: Da esquerda para a direita (short-circuit)

## 3. Tabela Verdade

| Condição 1 | Condição 2 | Resultado |
| :--------: | :--------: | :-------: |
|    true    |    true    |   true    |
|    true    |   false    |   false   |
|   false    |    true    |   false   |
|   false    |   false    |   false   |

**Resumo:** Apenas quando ambas são `true`, o resultado é `true`.

## 4. Sintaxe

```dart
condição1 && condição2
```

Com parênteses (recomendado para clareza):

```dart
(condição1) && (condição2)
```

Com múltiplas condições:

```dart
(condição1) && (condição2) && (condição3)
```

## 5. Exemplos Básicos

### Exemplo 1: Dois Valores

```dart
int a = 5;
int b = 10;

// Verdadeiro - ambas as condições são verdadeiras
if ((a > 0) && (b > 0)) {
  print("VERDADE"); // Será executado
}

// Falso - uma condição é falsa
if ((a > 10) && (b > 0)) {
  print("FALSO"); // NÃO será executado
}
```

### Exemplo 2: Comparações Diretas

```dart
var podeVotar = true;
var temPassaporte = false;

if ((podeVotar) && (temPassaporte)) {
  print("Pode viajar internacionalmente"); // NÃO será executado
}
```

## 6. Múltiplas Condições

Você pode encadear o operador AND para avaliar 3 ou mais condições:

```dart
int a = 1;
int b = 2;
int c = 3;

// Todas as três condições precisam ser verdadeiras
if ((a >= 1) && (b < 3) && (c > 2)) {
  print("VERDADE"); // Será executado
}
// Tabela:
// V && V && V = V ✓
```

### Com Mais Condições

```dart
bool temIdade = true;
bool temRenda = true;
bool naoTemDividas = true;
bool temEmprestamoAnterior = false;

if (temIdade && temRenda && naoTemDividas && temEmprestamoAnterior) {
  print("Aprovado para empréstimo"); // NÃO será executado
}
// V && V && V && F = F ✗
```

## 7. Operadores de Comparação

Geralmente o AND é combinado com operadores de comparação:

| Operador | Descrição            | Exemplo          |
| :------: | -------------------- | :--------------- |
|   `>`    | Maior que            | `idade > 18`     |
|   `>=`   | Maior ou igual que   | `nota >= 7`      |
|   `<`    | Menor que            | `preco < 100`    |
|   `<=`   | Menor ou igual que   | `valor <= 50`    |
|   `==`   | Igual                | `status == 'ativo'` |
|   `!=`   | Diferente            | `tipo != null`   |

### Exemplo com Comparações

```dart
int idade = 25;
double renda = 3500.0;

if ((idade >= 18) && (renda >= 2000.0)) {
  print("Elegível para crédito");
}
```

## 8. Casos Práticos

### Caso 1: Validação de Login

```dart
String email = "usuario@email.com";
String senha = "123456";

if ((email.isNotEmpty) && (senha.length >= 6)) {
  print("Credenciais válidas");
}
```

### Caso 2: Intervalo de Valores

```dart
int idade = 25;

if ((idade >= 18) && (idade <= 65)) {
  print("Pessoa em idade produtiva");
}
```

### Caso 3: Validação de Aluno

```dart
double nota1 = 8.0;
double nota2 = 7.5;
int presenca = 20; // 20 aulas de 20 total

if ((nota1 >= 6.0) && (nota2 >= 6.0) && (presenca >= 15)) {
  print("Aluno aprovado!");
} else {
  print("Aluno reprovado");
}
```

### Caso 4: Acesso a Sistema

```dart
bool usuarioAutenticado = true;
bool temPermissao = true;
bool sistemaOnline = true;

if ((usuarioAutenticado) && (temPermissao) && (sistemaOnline)) {
  print("Acesso concedido");
} else {
  print("Acesso negado");
}
```

### Caso 5: Validação de Produto

```dart
int estoque = 5;
double preco = 99.90;
bool disponivel = true;

if ((estoque > 0) && (preco > 0) && (disponivel)) {
  print("Produto disponível para compra");
}
```

## 9. Boas Práticas

### ✅ Recomendado

```dart
// Use parênteses para melhor clareza
if ((idade >= 18) && (renda > 1000)) {
  print("Aprovado");
}

// Nomes descritivos
bool podeComprar = (idade >= 18) && (temCartao);

// Separe condições complexas em variáveis
bool maiorDeIdade = idade >= 18;
bool rendaSuficiente = renda > 1000;

if (maiorDeIdade && rendaSuficiente) {
  print("Elegível");
}
```

### ❌ Evite

```dart
// Sem parênteses (confuso)
if (idade >= 18 && renda > 1000 && temCartao == true) {
  print("Confuso");
}

// Condições muito complexas na mesma linha
if ((a > b) && (c < d) && (e == f) && (g != h) && (i <= j)) {
  // Muito difícil de ler
}
```

### Short-Circuit (Avaliação Curta)

O AND avalia da esquerda para direita e **para assim que encontra um false**:

```dart
int divisor = 0;

// Seguro! O segundo operando NÃO é avaliado se divisor == 0
if ((divisor != 0) && (10 / divisor > 2)) {
  print("Resultado válido");
}
// Se divisor fosse avaliado, causaria erro de divisão por zero
```

---

**Veja também:** Operador [OR (`||`)](logica_or.dart) - para quando pelo menos uma condição deve ser verdadeira
