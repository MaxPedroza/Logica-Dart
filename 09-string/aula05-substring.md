# Substring - Extrair Parte de uma String

## Índice
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos de Uso](#exemplos-de-uso)
- [Casos Práticos](#casos-práticos)

---

## Sintaxe Básica

O método `substring()` extrai uma parte específica de uma string.

### Sintaxe 1: `substring(inicio, fim)`

Extrai do índice `inicio` até (não inclusivo) `fim`:

```dart
String nomeExemplo = "Max Pedroza";
// Índices: 0=M, 1=a, 2=x, 3= , 4=P, 5=e, 6=d, 7=r, 8=o, 9=z, 10=a

// Extrair "Max"
String subString1 = nomeExemplo.substring(0, 3);
print("Exemplo 1 - substring(0, 3): '$subString1'");
// Output: Exemplo 1 - substring(0, 3): 'Max'

// Extrair "Pedroza"
String subString2 = nomeExemplo.substring(4, 11);
print("Exemplo 2 - substring(4, 11): '$subString2'");
// Output: Exemplo 2 - substring(4, 11): 'Pedroza'
```

### Sintaxe 2: `substring(inicio)`

Extrai do índice `inicio` até o final:

```dart
String nomeExemplo = "Max Pedroza";

// Extrair a partir da posição 4 até o final
String subString3 = nomeExemplo.substring(4);
print("Exemplo 3 - substring(4): '$subString3'");
// Output: Exemplo 3 - substring(4): 'Pedroza'
```

---

## Exemplos de Uso

### Extrair Primeiros Caracteres

```dart
String exercicio5 = "Programação";
String primeirasPalavras = exercicio5.substring(0, 3);
print("Exercício 5 - primeiras letras: '$primeirasPalavras'");
// Output: Exercício 5 - primeiras letras: 'Pro'
```

### Extrair Últimos Caracteres

```dart
String texto = "Hello World";
String ultimos3 = texto.substring(texto.length - 3);
print("Últimos 3 caracteres: '$ultimos3'");
// Output: Últimos 3 caracteres: 'rld'
```

### Extrair do Meio

```dart
String frase = "Dart é incrível";
String parteDoMeio = frase.substring(5, 7);
print("Do índice 5 ao 7: '$parteDoMeio'");
// Output: Do índice 5 ao 7: ' é'
```

---

## Casos Práticos

### Extrair Nome de Arquivo

```dart
String arquivo = "documento.pdf";
int pontIndex = arquivo.indexOf(".");

if (pontIndex != -1) {
  String nome = arquivo.substring(0, pontIndex);
  String extensao = arquivo.substring(pontIndex + 1);
  
  print("Nome: $nome");        // Output: Nome: documento
  print("Extensão: $extensao"); // Output: Extensão: pdf
}
```

### Extrair Domínio de Email

```dart
String email = "usuario@example.com";
int arrobaIndex = email.indexOf("@");

if (arrobaIndex != -1) {
  String usuario = email.substring(0, arrobaIndex);
  String dominio = email.substring(arrobaIndex + 1);
  
  print("Usuário: $usuario");  // Output: Usuário: usuario
  print("Domínio: $dominio");  // Output: Domínio: example.com
}
```

### Extrair Data

```dart
String data = "2024-12-25";

String ano = data.substring(0, 4);
String mes = data.substring(5, 7);
String dia = data.substring(8, 10);

print("Ano: $ano");   // Output: Ano: 2024
print("Mês: $mes");   // Output: Mês: 12
print("Dia: $dia");   // Output: Dia: 25
```

### Extrair Hora

```dart
String hora = "14:30:45";

String horas = hora.substring(0, 2);
String minutos = hora.substring(3, 5);
String segundos = hora.substring(6, 8);

print("Horas: $horas");       // Output: Horas: 14
print("Minutos: $minutos");   // Output: Minutos: 30
print("Segundos: $segundos"); // Output: Segundos: 45
```

---

## ⚠️ Erros Comuns

### Índice Fora do Intervalo

```dart
String texto = "Dart";

// ❌ ERRO - Fim maior que tamanho
// String erro = texto.substring(0, 10);  // RangeError!

// ✅ CORRETO - Verificar tamanho
String certo = texto.substring(0, Math.min(4, texto.length));
print(certo);  // Output: Dart
```

### Fim Menor que Início

```dart
String texto = "Dart";

// ❌ ERRO
// String erro = texto.substring(4, 1);  // RangeError!

// ✅ CORRETO
String certo = texto.substring(0, 2);
print(certo);  // Output: Da
```

---

## Tabela Resumida

| Método | Sintaxe | Resultado |
|--------|---------|-----------|
| Substring com fim | `substring(0, 3)` | "Dar" (de "Dart") |
| Substring até final | `substring(3)` | "t" (de "Dart") |
| Primeiros chars | `substring(0, 2)` | "Da" (de "Dart") |
| Últimos chars | `substring(length-2)` | "rt" (de "Dart") |

