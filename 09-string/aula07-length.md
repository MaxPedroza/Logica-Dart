# Length - Tamanho de uma String

A propriedade `.length` retorna o **número total de caracteres** em uma string.

## Sintaxe Básica

```dart
String minhaString = "Max Pedroza";
int tamanho = minhaString.length;
print("Exemplo 1 - length: '$minhaString' tem $tamanho caracteres");
// Output: Exemplo 1 - length: 'Max Pedroza' tem 11 caracteres
```

---

## Acessar Caracteres por Índice

### Primeiro Caractere

```dart
String minhaString = "Max Pedroza";
print("Exemplo 2 - primeiro caractere [0]: '${minhaString[0]}'");
// Output: Exemplo 2 - primeiro caractere [0]: 'M'
```

### Último Caractere

```dart
String minhaString = "Max Pedroza";
int tamanho = minhaString.length;
print("Exemplo 3 - último caractere [${tamanho - 1}]: '${minhaString[tamanho - 1]}'");
// Output: Exemplo 3 - último caractere [10]: 'a'
```

---

## Loop através de Todos os Caracteres

```dart
print("Exemplo 4 - loop (todos os caracteres):");
String palavra = "DART";
for (int i = 0; i < palavra.length; i++) {
  print("  Índice $i: '${palavra[i]}'");
}

// Output:
// Exemplo 4 - loop (todos os caracteres):
//   Índice 0: 'D'
//   Índice 1: 'A'
//   Índice 2: 'R'
//   Índice 3: 'T'
```

---

## Validar Tamanho

```dart
String senha = "abc123";

// Verificar se tem tamanho mínimo
if (senha.length < 8) {
  print("Senha muito curta");
} else {
  print("Senha tem tamanho válido");
}

// Verificar tamanho exato
String cpf = "12345678900";
if (cpf.length == 11) {
  print("Tamanho de CPF válido");
}

// Verificar tamanho máximo
String mensagem = "Digite uma mensagem";
if (mensagem.length > 100) {
  print("Mensagem muito longa");
} else {
  print("Mensagem aceita");
}
```

---

## Contando Caracteres Especiais

```dart
String frase = "São Paulo";
print(frase.length);  // Output: 9 (incluindo o espaço)

String emoji = "🚀 Flutter";
print(emoji.length);  // Output: 10

String acentuado = "Programação";
print(acentuado.length);  // Output: 11 (ç é um caractere)
```

---

## Exercício Prático

```dart
String exercicio7nome = "Programação";
int exercicio7tamanho = exercicio7nome.length;
print("Exercício 7 - '$exercicio7nome' tem $exercicio7tamanho caracteres");
// Output: Exercício 7 - 'Programação' tem 11 caracteres
```

---

## Casos Práticos

### Validar CPF

```dart
String cpf = "123.456.789-00";
String cpfLimpo = cpf.replaceAll(RegExp(r'[^\d]'), '');

if (cpfLimpo.length != 11) {
  print("CPF inválido!");
} else {
  print("CPF válido!");
}
```

### Verificar Limite de Caracteres

```dart
String titulo = "Meu Blog Post";
int limiteMax = 50;

if (titulo.length > limiteMax) {
  String resumido = titulo.substring(0, limiteMax) + "...";
  print("Título reduzido: $resumido");
} else {
  print("Título aceito: $titulo");
}
```

---

## Tabela Resumida

| Operação | Código | Resultado |
|----------|--------|-----------|
| Tamanho total | `"Dart".length` | 4 |
| Primeiro char | `"Dart"[0]` | "D" |
| Último char | `"Dart"[3]` | "t" |
| Verificar vazio | `"".length == 0` | true |

