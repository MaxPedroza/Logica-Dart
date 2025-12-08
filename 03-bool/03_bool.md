# Booleanos (bool) em Dart

Este documento detalha o funcionamento, operadores e boas práticas para o uso de valores booleanos (`bool`) na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. Declaração de Variáveis](#2-declaração-de-variáveis)
- [3. Operadores de Comparação](#3-operadores-de-comparação)
- [4. Operadores Lógicos](#4-operadores-lógicos)
  - [4.1 AND (`&&`)](#41-and-)
  - [4.2 OR (`||`)](#42-or-)
  - [4.3 NOT (`!`)](#43-not-)
- [5. Estruturas Condicionais](#5-estruturas-condicionais)
  - [5.1 If / Else](#51-if--else)
  - [5.2 Operador Ternário](#52-operador-ternário)
- [6. Tabela Verdade](#6-tabela-verdade)
- [7. Boas Práticas](#7-boas-práticas)

---

## 1. Introdução

O tipo `bool` em Dart representa valores lógicos e aceita apenas dois estados: `true` (verdadeiro) ou `false` (falso). É fundamental para o controle de fluxo de programas, sendo usado em condições, loops e validações.

```dart
bool verdadeiro = true;
bool falso = false;
```

## 2. Declaração de Variáveis

Assim como outros tipos em Dart, você pode declarar booleanos explicitamente ou deixar a linguagem inferir o tipo.

```dart
// Declaração explícita
bool ligado = true;
bool desligado = false;

// Inferência de tipo (var)
var ativo = true;   // Dart entende que é bool
var inativo = false;
```

## 3. Operadores de Comparação

Os operadores de comparação avaliam duas expressões e retornam um valor booleano (`true` ou `false`).

| Operador | Descrição        | Exemplo (`a=10, b=20`) | Resultado |
| -------- | ---------------- | ---------------------- | --------- |
| `==`     | Igual a          | `a == b`               | `false`   |
| `!=`     | Diferente de     | `a != b`               | `true`    |
| `>`      | Maior que        | `a > b`                | `false`   |
| `<`      | Menor que        | `a < b`                | `true`    |
| `>=`     | Maior ou igual a | `a >= 10`              | `true`    |
| `<=`     | Menor ou igual a | `a <= b`               | `true`    |

```dart
int numero1 = 10;
int numero2 = 20;

print(numero1 == numero2); // false
print(numero1 < numero2);  // true
```

## 4. Operadores Lógicos

Permitem combinar múltiplas expressões booleanas.

### 4.1 AND (`&&`)

Retorna `true` apenas se **todas** as condições forem verdadeiras.

```dart
bool temIdade = true;
bool temCarteira = true;
bool podeDirigir = temIdade && temCarteira; // true
```

### 4.2 OR (`||`)

Retorna `true` se **pelo menos uma** das condições for verdadeira.

```dart
bool ehFeriado = false;
bool ehDomingo = true;
bool naoTrabalha = ehFeriado || ehDomingo; // true
```

### 4.3 NOT (`!`)

Inverte o valor booleano. Se for `true` vira `false`, e vice-versa.

```dart
bool estaChovendo = true;
bool vamosAPraia = !estaChovendo; // false
```

## 5. Estruturas Condicionais

Os booleanos são a base para tomadas de decisão no código.

### 5.1 If / Else

Executa blocos de código baseados em uma condição booleana.

```dart
bool estaChovendo = true;

if (estaChovendo) {
  print("Leve um guarda-chuva!");
} else {
  print("Aproveite o sol!");
}
```

### 5.2 Operador Ternário

Uma forma concisa de escrever um `if/else` que retorna um valor.
Sintaxe: `condicao ? valorSeTrue : valorSeFalse`

```dart
bool cansado = true;
String acao = cansado ? "Dormir" : "Trabalhar";
print(acao); // "Dormir"
```

## 6. Tabela Verdade

Resumo das operações lógicas fundamentais:

| A       | B       | A && B (AND) | A \|\| B (OR) | !A (NOT) |
| ------- | ------- | ------------ | ------------- | -------- |
| `true`  | `true`  | `true`       | `true`        | `false`  |
| `true`  | `false` | `false`      | `true`        | `false`  |
| `false` | `true`  | `false`      | `true`        | `true`   |
| `false` | `false` | `false`      | `false`       | `true`   |

## 7. Boas Práticas

- **Nomes Significativos**: Use prefixos que indiquem uma pergunta ou estado, como `eh`, `tem`, `esta` (ou em inglês `is`, `has`, `can`).
  - ✅ `ehAdmin`, `temPermissao`, `estaCarregando`
  - ❌ `flag`, `status`, `b`
- **Evite Comparações Redundantes**: Não é necessário comparar com `true` ou `false` em `if`s.
  - ✅ `if (ativo) { ... }`
  - ❌ `if (ativo == true) { ... }`
- **Evite Dupla Negação**: Nomes negativos com operador NOT podem confundir.
  - ✅ `if (habilitado) { ... }`
  - ❌ `if (!desabilitado) { ... }`
