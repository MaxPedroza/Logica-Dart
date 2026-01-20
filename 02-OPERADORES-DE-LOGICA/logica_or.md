# Operador OR (||) em Dart

Este documento detalha o funcionamento, tabela verdade e aplicações práticas do operador OR na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é o Operador OR?](#2-o-que-é-o-operador-or)
- [3. Tabela Verdade](#3-tabela-verdade)
- [4. Sintaxe](#4-sintaxe)
- [5. Exemplos Básicos](#5-exemplos-básicos)
- [6. Múltiplas Condições](#6-múltiplas-condições)
- [7. Operadores de Comparação](#7-operadores-de-comparação)
- [8. Combinando AND e OR](#8-combinando-and-e-or)
- [9. Casos Práticos](#9-casos-práticos)
- [10. Boas Práticas](#10-boas-práticas)

---

## 1. Introdução

O operador **OR** (OU lógico) é um dos operadores lógicos fundamentais da programação. Ele é usado para criar condições que exigem que **PELO MENOS UMA** das expressões seja verdadeira para que o resultado final seja verdadeiro.

```dart
// Exemplo básico
if ((temCartao) || (temDinheiro)) {
  print("Pode fazer compra");
}
```

## 2. O que é o Operador OR?

O operador OR avalia múltiplas condições e retorna:

- **true** (verdadeiro) → quando **PELO MENOS UMA** das condições é verdadeira
- **false** (falso) → quando **TODAS** as condições são falsas

### Características

- 📌 Sintaxe: `||`
- 📌 Tipo: Operador lógico binário
- 📌 Operandos: Expressões booleanas (true/false)
- 📌 Avaliação: Da esquerda para a direita (short-circuit)

## 3. Tabela Verdade

| Condição 1 | Condição 2 | Resultado |
| :--------: | :--------: | :-------: |
|    true    |    true    |   true    |
|    true    |   false    |   true    |
|   false    |    true    |   true    |
|   false    |   false    |   false   |

**Resumo:** Apenas quando ambas são `false`, o resultado é `false`.

## 4. Sintaxe

```dart
condição1 || condição2
```

Com parênteses (recomendado para clareza):

```dart
(condição1) || (condição2)
```

Com múltiplas condições:

```dart
(condição1) || (condição2) || (condição3)
```

## 5. Exemplos Básicos

### Exemplo 1: Dois Valores

```dart
int a = -1;
int b = 2;

// Verdadeiro - pelo menos uma condição é verdadeira
if ((a > -2) || (b == 2)) {
  print("VERDADE"); // Será executado
}

// Falso - ambas as condições são falsas
if ((a > 5) || (b < 0)) {
  print("FALSO"); // NÃO será executado
}
```

### Exemplo 2: Comparações Diretas

```dart
bool temCartao = true;
bool temDinheiro = false;

if ((temCartao) || (temDinheiro)) {
  print("Pode fazer compra"); // Será executado
}
```

## 6. Múltiplas Condições

Você pode encadear o operador OR para avaliar 3 ou mais condições:

```dart
int a = 5;
int b = -1;
int c = 0;

// Pelo menos uma das condições precisa ser verdadeira
if ((a > 0) || (b > 0) || (c > 0)) {
  print("VERDADE"); // Será executado (a > 0 é true)
}
// Tabela:
// V || F || F = V ✓
```

### Com Mais Condições

```dart
String metodo = "email";
bool temEmail = true;
bool temTelefone = false;
bool temWhatsapp = false;

if ((metodo == "email" && temEmail) || (metodo == "sms" && temTelefone) || (metodo == "whatsapp" && temWhatsapp)) {
  print("Notificação enviada"); // Será executado
}
```

## 7. Operadores de Comparação

Geralmente o OR é combinado com operadores de comparação:

| Operador | Descrição            | Exemplo          |
| :------: | -------------------- | :--------------- |
|   `>`    | Maior que            | `idade > 60`     |
|   `>=`   | Maior ou igual que   | `saldo >= 0`     |
|   `<`    | Menor que            | `idade < 18`     |
|   `<=`   | Menor ou igual que   | `valor <= 100`   |
|   `==`   | Igual                | `status == 'ativo'` |
|   `!=`   | Diferente            | `tipo != null`   |

### Exemplo com Comparações

```dart
int idade = 70;

if ((idade < 18) || (idade > 65)) {
  print("Desconto especial aplicado");
}
```

## 8. Combinando AND e OR

Você pode combinar `&&` e `||` para criar lógicas mais complexas:

```dart
bool temIdade = true;
bool temRenda = false;
bool temHistoricoPositivo = true;

// (tem idade E tem renda) OU tem histórico positivo
if ((temIdade && temRenda) || temHistoricoPositivo) {
  print("Aprovado para empréstimo"); // Será executado
}
```

### Precedência de Operadores

⚠️ **Importante:** O AND (`&&`) tem precedência maior que OR (`||`):

```dart
// Sem parênteses (AND é avaliado primeiro)
if (true && false || true) {
  // Equivalente a: (true && false) || true = false || true = true
  print("Executado");
}

// Com parênteses (mais claro)
if ((true && false) || true) {
  print("Executado");
}
```

## 9. Casos Práticos

### Caso 1: Sistema de Acesso

```dart
bool isAdmin = false;
bool isEditor = true;
bool isModerador = false;

if (isAdmin || isEditor || isModerador) {
  print("Pode editar conteúdo"); // Será executado
}
```

### Caso 2: Validação de Horário

```dart
int hora = 22;

if ((hora < 12) || (hora > 18)) {
  print("Horário especial");
}
// Manhã OU Noite
```

### Caso 3: Validação de Formas de Pagamento

```dart
bool temCartaoCredito = false;
bool temCartaoDebito = false;
bool temPix = true;

if (temCartaoCredito || temCartaoDebito || temPix) {
  print("Pode realizar pagamento"); // Será executado
}
```

### Caso 4: Verificação de Status

```dart
String status = "cancelado";

if ((status == "pendente") || (status == "em_processamento") || (status == "cancelado")) {
  print("Aguarde ou tente novamente");
}
```

### Caso 5: Critérios de Entrada

```dart
int nota = 5;
bool passou_enem = false;
bool passou_vestibular = true;

if ((nota >= 6) || passou_enem || passou_vestibular) {
  print("Acesso concedido à universidade"); // Será executado
}
```

## 10. Boas Práticas

### ✅ Recomendado

```dart
// Use parênteses para melhor clareza
if ((idade < 18) || (idade > 65)) {
  print("Desconto aplicado");
}

// Nomes descritivos
bool podeAcessar = (isAdmin) || (isEditor) || (isModerador);

// Separe condições complexas em variáveis
bool ehJovem = idade < 18;
bool ehIdoso = idade > 65;

if (ehJovem || ehIdoso) {
  print("Grupo especial");
}

// Use parênteses para precedência clara ao combinar AND/OR
if ((condicao1 && condicao2) || (condicao3 && condicao4)) {
  print("Lógica clara");
}
```

### ❌ Evite

```dart
// Sem parênteses (confuso)
if (idade < 18 || idade > 65 || isStudent || isSenior) {
  // Difícil de ler
}

// Múltiplas condições sem separação
if ((a > b) || (c < d) || (e == f) || (g != h) || (i <= j)) {
  // Muito complexo
}

// Misturar AND/OR sem deixar claro a precedência
if (a && b || c && d || e && f) {
  // Qual é a ordem de avaliação?
}
```

### Short-Circuit (Avaliação Curta)

O OR avalia da esquerda para direita e **para assim que encontra um true**:

```dart
bool chamouFuncao = false;

bool meuMetodo() {
  chamouFuncao = true;
  return true;
}

// Se a primeira condição for true, meuMetodo NÃO é chamado
if ((true) || (meuMetodo())) {
  print(chamouFuncao); // false (meuMetodo não foi chamado)
}

// Se a primeira condição for false, meuMetodo É chamado
if ((false) || (meuMetodo())) {
  print(chamouFuncao); // true (meuMetodo foi chamado)
}
```

## Diferença Entre AND e OR

| Aspecto | AND (`&&`) | OR (`\|\|`) |
|:-------:|:-----------|:-----------|
| **Retorna true quando** | **TODAS** as condições são verdadeiras | **PELO MENOS UMA** condição é verdadeira |
| **Retorna false quando** | **QUALQUER UMA** é falsa | **TODAS** são falsas |
| **Caso de Uso** | Validações múltiplas obrigatórias | Alternativas/opções |
| **Exemplo** | Idade >= 18 **E** tem RG | Pode pagar com **Cartão OU Dinheiro OU Pix** |

---

**Veja também:** Operador [AND (`&&`)](logica_and.md) - para quando todas as condições devem ser verdadeiras