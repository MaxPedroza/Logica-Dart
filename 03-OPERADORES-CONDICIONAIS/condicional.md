# Estrutura Condicional IF/ELSE em Dart

Este documento detalha o funcionamento, sintaxes e aplicações práticas das estruturas condicionais if/else na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é IF/ELSE?](#2-o-que-é-ifelse)
- [3. Sintaxe Básica](#3-sintaxe-básica)
- [4. Estrutura IF](#4-estrutura-if)
- [5. Estrutura IF/ELSE](#5-estrutura-ifelse)
- [6. Estrutura IF/ELSE IF/ELSE](#6-estrutura-ifelse-ifelse)
- [7. Aninhamento de Condições](#7-aninhamento-de-condições)
- [8. Operadores de Comparação](#8-operadores-de-comparação)
- [9. Casos Práticos](#9-casos-práticos)
- [10. Boas Práticas](#10-boas-práticas)

---

## 1. Introdução

A estrutura condicional **IF/ELSE** é uma das mais fundamentais em programação. Ela permite que o seu código tome **decisões** baseadas em condições, executando diferentes blocos de código dependendo do resultado da avaliação.

```dart
// Exemplo básico
if (notaMatematica >= 9.5) {
  print("GANHOU UM IPHONE");
} else {
  print("OOPS, PERDEU O IPHONE");
}
```

## 2. O que é IF/ELSE?

A estrutura condicional avalia uma **expressão booleana** (true/false) e executa:

- **IF** → Código que roda **se a condição for verdadeira**
- **ELSE** → Código que roda **se a condição for falsa**

### Características

- 📌 Execução condicional de código
- 📌 Permite múltiplas ramificações (if/else if/else)
- 📌 Pode ser aninhada
- 📌 Base para toda lógica de controle de fluxo

## 3. Sintaxe Básica

### IF Simples

```dart
if (condição) {
  // Código executado se condição for true
}
```

### IF/ELSE

```dart
if (condição) {
  // Código executado se condição for true
} else {
  // Código executado se condição for false
}
```

### IF/ELSE IF/ELSE

```dart
if (condição1) {
  // Código executado se condição1 for true
} else if (condição2) {
  // Código executado se condição1 for false E condição2 for true
} else if (condição3) {
  // Código executado se condição1 E condição2 forem false E condição3 for true
} else {
  // Código executado se nenhuma das condições anteriores for true
}
```

## 4. Estrutura IF

Executa um bloco de código **apenas se** a condição for verdadeira.

```dart
int idade = 18;

if (idade >= 18) {
  print("Você é maior de idade");
  print("Pode dirigir");
}
// Se idade < 18, nada será executado
```

**Nota:** Se a condição for falsa, o código dentro do IF é ignorado.

## 5. Estrutura IF/ELSE

Executa **um** dos dois blocos de código:
- Primeiro bloco se a condição for **true**
- Segundo bloco se a condição for **false**

```dart
var notaMatematica = 9;

if (notaMatematica >= 9.5) {
  print("GANHOU UM IPHONE");
} else {
  print("OOPS, PERDEU O IPHONE");
}
```

### Outro Exemplo

```dart
int a = 5;
int b = 10;

if (a > b) {
  print("a é maior que b");
} else {
  print("a é menor ou igual a b");
}
// Output: a é menor ou igual a b
```

## 6. Estrutura IF/ELSE IF/ELSE

Permite múltiplas ramificações. Útil quando você tem **várias condições exclusivas**.

### Exemplo: Classificação de Nota

```dart
double nota = 7.5;

if (nota >= 9) {
  print("Excelente");
} else if (nota >= 8) {
  print("Muito Bom");
} else if (nota >= 7) {
  print("Bom");
} else if (nota >= 6) {
  print("Satisfatório");
} else {
  print("Insuficiente");
}
// Output: Bom
```

### Exemplo: Faixa Etária

```dart
int idade = 25;

if (idade < 13) {
  print("Criança");
} else if (idade < 18) {
  print("Adolescente");
} else if (idade < 60) {
  print("Adulto");
} else {
  print("Idoso");
}
// Output: Adulto
```

## 7. Aninhamento de Condições

Você pode colocar condições dentro de outras condições (não recomendado em excesso):

```dart
int idade = 20;
bool temCarteira = true;

if (idade >= 18) {
  if (temCarteira) {
    print("Pode dirigir");
  } else {
    print("Maior de idade mas sem carteira");
  }
} else {
  print("Menor de idade");
}
```

**Melhor forma (use AND ao invés de aninhar):**

```dart
if ((idade >= 18) && (temCarteira)) {
  print("Pode dirigir");
} else {
  print("Não pode dirigir");
}
```

## 8. Operadores de Comparação

Os operadores usados nas condições:

| Operador | Descrição            | Exemplo          |
| :------: | -------------------- | :--------------- |
|   `>`    | Maior que            | `idade > 18`     |
|   `>=`   | Maior ou igual que   | `nota >= 7`      |
|   `<`    | Menor que            | `preco < 100`    |
|   `<=`   | Menor ou igual que   | `valor <= 50`    |
|   `==`   | Igual                | `status == 'ativo'` |
|   `!=`   | Diferente            | `tipo != null`   |

### Exemplo com Operadores

```dart
String status = "ativo";

if (status == "ativo") {
  print("Usuário ativo");
} else if (status == "inativo") {
  print("Usuário inativo");
} else if (status != "bloqueado") {
  print("Status desconhecido");
} else {
  print("Usuário bloqueado");
}
```

## 9. Casos Práticos

### Caso 1: Sistema de Desconto

```dart
double compra = 150.0;
double desconto = 0;

if (compra >= 200) {
  desconto = compra * 0.20; // 20%
} else if (compra >= 100) {
  desconto = compra * 0.10; // 10%
} else if (compra >= 50) {
  desconto = compra * 0.05; // 5%
}

print("Desconto: R\$ ${desconto.toStringAsFixed(2)}");
// Output: Desconto: R$ 15.00
```

### Caso 2: Validação de Senha

```dart
String senha = "abc123";

if (senha.isEmpty) {
  print("Senha não pode ser vazia");
} else if (senha.length < 6) {
  print("Senha muito curta (mínimo 6 caracteres)");
} else if (!senha.contains(RegExp(r'[0-9]'))) {
  print("Senha deve conter números");
} else {
  print("Senha válida");
}
```

### Caso 3: Acesso ao Sistema

```dart
bool isAdmin = false;
bool isEditor = true;
int tentativasFalhas = 2;

if (isAdmin) {
  print("Acesso total concedido");
} else if (isEditor) {
  print("Acesso editório concedido");
} else if (tentativasFalhas >= 3) {
  print("Acesso bloqueado - muitas tentativas");
} else {
  print("Acesso negado");
}
// Output: Acesso editório concedido
```

### Caso 4: Processamento de Pagamento

```dart
double saldo = 500;
double valor = 200;

if (saldo < 0) {
  print("Conta em débito");
} else if (saldo < valor) {
  print("Saldo insuficiente");
} else {
  saldo -= valor;
  print("Pagamento aprovado. Novo saldo: R\$ $saldo");
}
```

### Caso 5: Classificação de Triângulo

```dart
int lado1 = 3;
int lado2 = 4;
int lado3 = 5;

if ((lado1 == lado2) && (lado2 == lado3)) {
  print("Triângulo Equilátero");
} else if ((lado1 == lado2) || (lado2 == lado3) || (lado1 == lado3)) {
  print("Triângulo Isósceles");
} else {
  print("Triângulo Escaleno");
}
```

## 10. Boas Práticas

### ✅ Recomendado

```dart
// Condições legíveis
if (idade >= 18) {
  print("Maior de idade");
}

// Use variáveis para condições complexas
bool podeComprar = (idade >= 18) && (temCartao);

if (podeComprar) {
  print("Pode realizar compra");
}

// Condições claras e bem indentadas
if (status == "ativo") {
  print("Usuário ativo");
} else if (status == "inativo") {
  print("Usuário inativo");
} else {
  print("Status desconhecido");
}
```

### ❌ Evite

```dart
// Condições muito complexas
if ((a > b && c < d) || (e == f && g != h) || (i > j && k < l)) {
  print("Muito confuso");
}

// Muitos níveis de aninhamento
if (condicao1) {
  if (condicao2) {
    if (condicao3) {
      if (condicao4) {
        print("Difícil de ler");
      }
    }
  }
}

// Lógica invertida
if (!(idade < 18)) {
  print("Confuso");
}
// Melhor: if (idade >= 18)
```

### Early Return Pattern

```dart
// ❌ Evite
if (condition) {
  // muita lógica aqui
} else {
  print("Erro");
  return;
}

// ✅ Prefira
if (!condition) {
  print("Erro");
  return;
}
// resto da lógica aqui
```

## Resumo

| Estrutura | Quando Usar |
|:---------:|:-----------|
| **IF** | Quando você precisa executar código se uma condição for verdadeira |
| **IF/ELSE** | Quando precisa escolher entre dois caminhos |
| **IF/ELSE IF/ELSE** | Quando tem múltiplas opções exclusivas |

---

**Veja também:** 
- [Operador Ternário (`? :`))](ternario.md) - Versão compacta de if/else
- [Switch/Case](switch_case.md) - Para múltiplas escolhas baseadas em um valor
- [Operador AND (`&&`)](../02-OPERADORES-DE-LOGICA/logica_and.md) - Combinando condições
- [Operador OR (`||`)](../02-OPERADORES-DE-LOGICA/logica_or.md) - Alternativas