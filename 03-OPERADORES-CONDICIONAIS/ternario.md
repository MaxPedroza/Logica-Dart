# Operador Ternário (? :) em Dart

Este documento detalha o funcionamento, sintaxes e aplicações práticas do operador ternário na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é o Operador Ternário?](#2-o-que-é-o-operador-ternário)
- [3. Sintaxe](#3-sintaxe)
- [4. Como Funciona](#4-como-funciona)
- [5. Exemplos Básicos](#5-exemplos-básicos)
- [6. Comparação com IF/ELSE](#6-comparação-com-ifelse)
- [7. Aninhamento de Ternários](#7-aninhamento-de-ternários)
- [8. Com Diferentes Tipos](#8-com-diferentes-tipos)
- [9. Casos Práticos](#9-casos-práticos)
- [10. Boas Práticas](#10-boas-práticas)

---

## 1. Introdução

O operador **ternário** é uma forma compacta de escrever uma decisão **IF/ELSE simples** em uma única linha. É usado quando você precisa **escolher entre dois valores** baseado em uma condição.

```dart
// Forma tradicional (if/else)
String resultado;
if (a > b) {
  resultado = "a é maior";
} else {
  resultado = "b é maior";
}

// Forma compacta (ternário)
String resultado = (a > b) ? "a é maior" : "b é maior";
```

## 2. O que é o Operador Ternário?

O operador ternário é um **operador condicional** que avalia uma expressão e retorna **um de dois valores** baseado no resultado:

- **CONDIÇÃO** → A expressão a ser testada
- **VALOR_VERDADEIRO** → Retornado se a condição for true
- **VALOR_FALSO** → Retornado se a condição for false

### Características

- 📌 Sintaxe: `condição ? valor_se_verdadeiro : valor_se_falso`
- 📌 Retorna um **valor** (não executa código)
- 📌 Pode ser atribuído a uma variável
- 📌 Ideal para **atribuições condicionais simples**
- 📌 Menos legível se muito complexo

## 3. Sintaxe

```dart
condição ? valor_verdadeiro : valor_falso
```

### Dentro de uma Atribuição

```dart
tipo resultado = condição ? valor1 : valor2;
```

### Exemplos

```dart
int a = 5;
int b = 10;

// Comparação simples
var maiorValor = (a > b) ? a : b;
print(maiorValor); // 10

// Com strings
String mensagem = (a > b) ? "a é maior" : "b é maior";
print(mensagem); // "b é maior"

// Com booleanos
bool ePar = (numero % 2 == 0) ? true : false;
```

## 4. Como Funciona

1. A **condição** é avaliada (true ou false)
2. Se **true** → retorna o primeiro valor
3. Se **false** → retorna o segundo valor
4. O resultado pode ser **armazenado em uma variável** ou **usado diretamente**

### Fluxo Visual

```
condição?
    ↓
   SIM → valor_verdadeiro
    ↓
   NÃO → valor_falso
    ↓
resultado
```

## 5. Exemplos Básicos

### Exemplo 1: Comparação Simples

```dart
int a = 5;
int b = 10;

var result = (a > b) ? ["MAIOR"] : ["MENOR"];
print(result); // [MENOR]
```

### Exemplo 2: Classificação de Paridade

```dart
int numero = 7;

String tipo = (numero % 2 == 0) ? "par" : "ímpar";
print(tipo); // ímpar
```

### Exemplo 3: Status de Acesso

```dart
bool isAdmin = true;

String acesso = (isAdmin) ? "Acesso total" : "Acesso limitado";
print(acesso); // Acesso total
```

### Exemplo 4: Cálculo Condicional

```dart
int idade = 20;

int desconto = (idade < 18) ? 50 : 0;
print("Desconto: R\$ $desconto"); // Desconto: R$ 0
```

### Exemplo 5: Validação de String

```dart
String email = "usuario@email.com";

String validacao = (email.contains("@")) ? "email válido" : "email inválido";
print(validacao); // email válido
```

## 6. Comparação com IF/ELSE

### IF/ELSE Tradicional

```dart
String resultado;

if (a > b) {
  resultado = "a é maior";
} else {
  resultado = "b é maior";
}

print(resultado);
```

### Ternário (Mais Compacto)

```dart
String resultado = (a > b) ? "a é maior" : "b é maior";
print(resultado);
```

### Quando Usar Cada Um

| Situação | Use |
|:--------:|:--:|
| Atribuição simples baseada em condição | ✅ Ternário |
| Múltiplas linhas de código em cada branch | ❌ Ternário (use IF/ELSE) |
| Múltiplas opções (mais de 2) | ❌ Ternário (use IF/ELSE ou SWITCH) |
| Uma única expressão | ✅ Ternário |

## 7. Aninhamento de Ternários

Você pode usar ternários dentro de ternários, mas pode ficar confuso:

### Aninhamento Simples

```dart
int nota = 8;

String conceito = (nota >= 9) ? "A" : (nota >= 7) ? "B" : (nota >= 5) ? "C" : "D";
print(conceito); // B
```

### Melhor: Usando IF/ELSE

```dart
int nota = 8;
String conceito;

if (nota >= 9) {
  conceito = "A";
} else if (nota >= 7) {
  conceito = "B";
} else if (nota >= 5) {
  conceito = "C";
} else {
  conceito = "D";
}
```

## 8. Com Diferentes Tipos

### Com Números

```dart
int a = 5;
int b = 10;

int maior = (a > b) ? a : b;
double resultado = (a > 0) ? a * 1.5 : 0.0;
```

### Com Strings

```dart
String nome = "João";
String saudacao = (nome.isEmpty) ? "Olá, visitante!" : "Olá, $nome!";
print(saudacao); // Olá, João!
```

### Com Listas

```dart
List numeros = [1, 2, 3];
String status = (numeros.isEmpty) ? "Lista vazia" : "Lista com ${numeros.length} itens";
print(status); // Lista com 3 itens
```

### Com Booleanos

```dart
bool ativo = true;
String status = (ativo) ? "Sistema ON" : "Sistema OFF";
```

## 9. Casos Práticos

### Caso 1: Desconto por Idade

```dart
int idade = 65;

double desconto = (idade >= 60) ? 0.20 : 0.0;
print("Desconto: ${(desconto * 100).toInt()}%"); // Desconto: 20%
```

### Caso 2: Mensagem de Boas-vindas

```dart
String nome = "Maria";

String mensagem = (nome.isEmpty) ? "Bem-vindo, visitante!" : "Bem-vinda, $nome!";
print(mensagem); // Bem-vinda, Maria!
```

### Caso 3: Validação de Compra

```dart
double saldo = 100;
double compra = 150;

String resultado = (saldo >= compra) ? "Compra aprovada" : "Saldo insuficiente";
print(resultado); // Saldo insuficiente
```

### Caso 4: Classificação de Velocidade

```dart
int velocidade = 80;

String limite = (velocidade > 60) ? "⚠️ Acima do limite" : "✅ Dentro do limite";
print(limite); // ⚠️ Acima do limite
```

### Caso 5: Status de Login

```dart
bool usuarioAutenticado = true;

String botao = (usuarioAutenticado) ? "Sair" : "Entrar";
String página = (usuarioAutenticado) ? "/dashboard" : "/login";

print("Botão: $botao, Página: $página");
// Botão: Sair, Página: /dashboard
```

## 10. Boas Práticas

### ✅ Recomendado

```dart
// Use ternário para atribuições simples
String status = (ativo) ? "ativo" : "inativo";

// Use parênteses para clareza
String resultado = (idade >= 18) ? "maior" : "menor";

// Separe em múltiplas linhas se ficar longo
String mensagem = (condicao_muito_complexa && outra_condicao)
    ? "valor longo se verdadeiro"
    : "valor longo se falso";

// Use com cálculos simples
int desconto = (age < 18) ? 20 : 0;

// Combine com operadores lógicos para melhor legibilidade
bool podeComprar = (idade >= 18) ? true : false;
```

### ❌ Evite

```dart
// ❌ Ternários aninhados e confusos
String resultado = (a > b) ? (c > d) ? "x" : "y" : (e > f) ? "z" : "w";

// ❌ Código complexo dentro do ternário
String resultado = (verificarEmail() && buscarDadosDB() && validarSenha()) 
    ? processarLogin() 
    : mostrarErro();

// ❌ Múltiplas opções (use switch)
String mes = (mes == 1) ? "Janeiro" : (mes == 2) ? "Fevereiro" : 
             (mes == 3) ? "Março" : "Outro";

// ❌ Lógica ao invés de atribuição simples
(idade >= 18) ? print("maior") : print("menor"); // Use if/else!
```

## Operador Ternário Nulo (??)

Dart também tem o operador **`??`** (null coalescing):

```dart
String nome = null;

// Retorna a primeira value não-nula
String resultado = nome ?? "Sem nome";
print(resultado); // Sem nome

// Combinar com ternário
String mensagem = (nome != null) ? nome : "Anônimo";
// Ou mais simples:
String mensagem = nome ?? "Anônimo";
```

## Resumo

| Aspecto | Ternário | IF/ELSE |
|:-------:|:--------:|:-------:|
| **Sintaxe** | `condição ? true : false` | `if ... else` |
| **Retorna** | Um valor | Executa código |
| **Melhor para** | Atribuições simples | Lógica complexa |
| **Legibilidade** | Excelente para simples | Melhor para complexo |
| **Aninhamento** | Evite (confuso) | OK |

---

**Veja também:**
- [Condicional IF/ELSE](condicional.md) - Estruturas de decisão
- [Switch/Case](switch_case.md) - Para múltiplas opções
- [Operador AND (`&&`)](../02-OPERADORES-DE-LOGICA/logica_and.md) - Combinando condições
- [Operador OR (`||`)](../02-OPERADORES-DE-LOGICA/logica_or.md) - Alternativas