# Números de Ponto Flutuante (double) em Dart

Este documento detalha o funcionamento, operações e métodos para o uso de números de ponto flutuante (`double`) na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. Declaração de Variáveis](#2-declaração-de-variáveis)
- [3. Operações Aritméticas](#3-operações-aritméticas)
- [4. Conversão de Tipos](#4-conversão-de-tipos)
  - [4.1 Int para Double](#41-int-para-double)
  - [4.2 Double para Int](#42-double-para-int)
  - [4.3 String para Double](#43-string-para-double)
  - [4.4 Double para String](#44-double-para-string)
- [5. Arredondamento e Precisão](#5-arredondamento-e-precisão)
- [6. Métodos e Propriedades Úteis](#6-métodos-e-propriedades-úteis)
- [7. Problemas de Precisão](#7-problemas-de-precisão)
- [8. Boas Práticas](#8-boas-práticas)

---

## 1. Introdução

O tipo `double` em Dart representa números de ponto flutuante de 64 bits (padrão IEEE 754). Eles são usados para representar números reais, ou seja, números com casas decimais.

```dart
double altura = 1.75;
double peso = 70.5;
double pi = 3.14159;
```

## 2. Declaração de Variáveis

Você pode declarar doubles explicitamente ou deixar o Dart inferir o tipo.

```dart
// Declaração explícita
double temperatura = 36.6;

// Inferência de tipo (var)
var preco = 19.99; // Dart infere que é double

// Notação científica
double atomo = 1.5e-10;
```

## 3. Operações Aritméticas

As operações básicas funcionam como esperado, retornando `double` quando pelo menos um dos operandos é `double` (exceto divisão inteira).

| Operador | Descrição       | Exemplo (`a=10.5, b=2.0`) | Resultado         |
| -------- | --------------- | ------------------------- | ----------------- |
| `+`      | Adição          | `a + b`                   | `12.5`            |
| `-`      | Subtração       | `a - b`                   | `8.5`             |
| `*`      | Multiplicação   | `a * b`                   | `21.0`            |
| `/`      | Divisão         | `a / b`                   | `5.25`            |
| `~/`     | Divisão Inteira | `a ~/ b`                  | `5` (retorna int) |
| `%`      | Módulo          | `a % b`                   | `0.5`             |

```dart
double a = 10.5;
double b = 2.0;

print(a + b); // 12.5
print(a / b); // 5.25
```

## 4. Conversão de Tipos

### 4.1 Int para Double

```dart
int inteiro = 10;
double decimal = inteiro.toDouble(); // 10.0
```

### 4.2 Double para Int

```dart
double valor = 9.99;
int truncado = valor.toInt(); // 9 (perde a parte decimal)
```

### 4.3 String para Double

```dart
String texto = "15.50";
double numero = double.parse(texto);

// Conversão segura
double? numeroSeguro = double.tryParse("abc"); // null
```

### 4.4 Double para String

```dart
double pi = 3.14159;
String texto = pi.toString(); // "3.14159"

// Fixando casas decimais
String formatado = pi.toStringAsFixed(2); // "3.14"
```

## 5. Arredondamento e Precisão

Dart oferece vários métodos para lidar com a parte decimal.

```dart
double nota = 7.6;

print(nota.round());    // 8 (Inteiro mais próximo)
print(nota.floor());    // 7 (Arredonda para baixo)
print(nota.ceil());     // 8 (Arredonda para cima)
print(nota.truncate()); // 7 (Remove decimais)
```

## 6. Métodos e Propriedades Úteis

```dart
double n = -5.5;

print(n.abs());         // 5.5 (Absoluto)
print(n.sign);          // -1.0 (Sinal)
print(n.isNegative);    // true

double infinito = 1 / 0;
print(infinito.isInfinite); // true
print(infinito.isFinite);   // false
```

## 7. Problemas de Precisão

Como em muitas linguagens, operações com ponto flutuante podem ter pequenas imprecisões devido à representação binária.

```dart
double resultado = 0.1 + 0.2;
print(resultado); // Pode ser 0.30000000000000004

// Comparação segura
bool iguais = (resultado - 0.3).abs() < 0.0001; // true
```

## 8. Boas Práticas

- **Valores Monetários**: Evite usar `double` para dinheiro se precisar de precisão exata. Prefira `int` (centavos) ou o pacote `decimal`.
- **Formatação**: Use `toStringAsFixed` para exibir valores ao usuário.
- **Validação**: Sempre use `tryParse` ao converter entradas de usuário.
- **Constantes**: Use `const` para valores fixos como taxas e fatores de conversão.

```dart
// Exemplo de boas práticas
const double TAXA_JUROS = 0.05;
double valor = 100.0;
print("Valor final: R\$ ${(valor * (1 + TAXA_JUROS)).toStringAsFixed(2)}");
```
