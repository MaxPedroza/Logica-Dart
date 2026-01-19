# Números Inteiros (int) em Dart

Este documento detalha o funcionamento, operações e métodos para o uso de números inteiros (`int`) na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. Declaração de Variáveis](#2-declaração-de-variáveis)
- [3. Operações Aritméticas](#3-operações-aritméticas)
- [4. Operadores de Incremento e Decremento](#4-operadores-de-incremento-e-decremento)
- [5. Operadores de Atribuição Compostos](#5-operadores-de-atribuição-compostos)
- [6. Métodos e Propriedades Úteis](#6-métodos-e-propriedades-úteis)
- [7. Conversão de Tipos](#7-conversão-de-tipos)
- [8. Operadores Bitwise](#8-operadores-bitwise)
- [9. Boas Práticas](#9-boas-práticas)

---

## 1. Introdução

O tipo `int` em Dart representa números inteiros de 64 bits (na VM) que podem ser positivos, negativos ou zero. Eles não possuem parte decimal.

```dart
int positivo = 10;
int negativo = -5;
int zero = 0;
```

## 2. Declaração de Variáveis

Você pode declarar inteiros explicitamente ou deixar o Dart inferir o tipo.

```dart
// Declaração explícita
int idade = 30;

// Inferência de tipo (var)
var ano = 2025; // Dart infere que é int
```

## 3. Operações Aritméticas

Dart suporta as operações matemáticas fundamentais.

| Operador | Descrição                | Exemplo (`a=10, b=3`) | Resultado |
| -------- | ------------------------ | --------------------- | --------- |
| `+`      | Adição                   | `a + b`               | `13`      |
| `-`      | Subtração                | `a - b`               | `7`       |
| `*`      | Multiplicação            | `a * b`               | `30`      |
| `/`      | Divisão (retorna double) | `a / b`               | `3.33...` |
| `~/`     | Divisão Inteira          | `a ~/ b`              | `3`       |
| `%`      | Módulo (Resto)           | `a % b`               | `1`       |

```dart
int a = 10;
int b = 3;

print(a + b);  // 13
print(a ~/ b); // 3 (trunca o decimal)
print(a % b);  // 1 (resto da divisão)
```

## 4. Operadores de Incremento e Decremento

Usados para aumentar ou diminuir o valor de uma variável em 1.

- **Pré-fixado (`++var`)**: Incrementa e _depois_ retorna o valor.
- **Pós-fixado (`var++`)**: Retorna o valor e _depois_ incrementa.

```dart
int contador = 10;

print(++contador); // 11 (incrementou antes)
print(contador++); // 11 (retornou 11, depois virou 12)
print(contador);   // 12
```

## 5. Operadores de Atribuição Compostos

Combinam uma operação aritmética com uma atribuição.

```dart
int valor = 10;

valor += 5;  // Igual a: valor = valor + 5 (15)
valor -= 2;  // Igual a: valor = valor - 2 (13)
valor *= 2;  // Igual a: valor = valor * 2 (26)
valor ~/= 2; // Igual a: valor = valor ~/ 2 (13)
```

## 6. Métodos e Propriedades Úteis

A classe `int` possui vários métodos auxiliares.

```dart
int numero = -42;

print(numero.abs());    // 42 (Valor absoluto)
print(numero.isEven);   // true (É par?)
print(numero.isOdd);    // false (É ímpar?)
print(numero.sign);     // -1 (Sinal: -1 negativo, 0 neutro, 1 positivo)
print(numero.toString()); // "-42" (Converte para String)

int a = 12;
int b = 8;
print(a.gcd(b)); // 4 (Maior Divisor Comum)
```

## 7. Conversão de Tipos

Frequentemente é necessário converter `String` ou `double` para `int`.

```dart
// String para int
String texto = "100";
int numero = int.parse(texto);

// String para int (seguro)
int? numeroSeguro = int.tryParse("abc"); // Retorna null se falhar

// double para int
double decimal = 5.9;
int inteiro = decimal.toInt(); // 5 (trunca, não arredonda)
```

## 8. Operadores Bitwise

Operações a nível de bits (binário).

```dart
int a = 5;  // 0101
int b = 3;  // 0011

print(a & b); // 1 (0001) - AND
print(a | b); // 7 (0111) - OR
print(a ^ b); // 6 (0110) - XOR
print(~a);    // -6       - NOT
print(a << 1); // 10 (1010) - Shift Left
print(a >> 1); // 2 (0010)  - Shift Right
```

## 9. Boas Práticas

- **Nomes Claros**: Use nomes que indiquem o que o número representa (`idade`, `quantidade`, `indice`).
- **Constantes**: Use `const` para valores que nunca mudam (`const int DIAS_SEMANA = 7;`).
- **Validação**: Ao converter strings, prefira `int.tryParse` para evitar erros de execução (exceções).
- **Divisão**: Lembre-se que `/` sempre retorna `double`. Se precisa de um inteiro, use `~/`.

```dart
// Exemplo de boas práticas
const int IDADE_MINIMA = 18;
int idadeUsuario = 20;

if (idadeUsuario >= IDADE_MINIMA) {
  print("Acesso permitido");
}
```
