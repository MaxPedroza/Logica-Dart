# 📄 Strings em Dart

> Uma **string** é uma sequência de caracteres imutável. Em Dart, strings são usadas para representar texto e são fundamentais para qualquer aplicação.

## Índice

- [1. Introdução](#1-introdução)
- [2. Declaração e Inicialização](#2-declaração-e-inicialização)
  - [2.1 Aspas Simples vs Duplas](#21-aspas-simples-vs-duplas)
  - [2.2 Strings Multi-Linha](#22-strings-multi-linha)
  - [2.3 Strings Brutas (Raw Strings)](#23-strings-brutas-raw-strings)
- [3. Interpolação de Strings](#3-interpolação-de-strings)
  - [3.1 Expressões Simples](#31-expressões-simples)
  - [3.2 Expressões Complexas](#32-expressões-complexas)
- [4. Propriedades de Strings](#4-propriedades-de-strings)
  - [4.1 Comprimento](#41-comprimento)
  - [4.2 Vazia ou Nula](#42-vazia-ou-nula)
  - [4.3 Primeira e Última Posição](#43-primeira-e-última-posição)
- [5. Métodos Essenciais](#5-métodos-essenciais)
  - [5.1 Transformação de Caso](#51-transformação-de-caso)
  - [5.2 Busca e Substituição](#52-busca-e-substituição)
  - [5.3 Divisão e Concatenação](#53-divisão-e-concatenação)
  - [5.4 Remoção de Espaços](#54-remoção-de-espaços)
  - [5.5 Verificação de Conteúdo](#55-verificação-de-conteúdo)
- [6. Caracteres e Índices](#6-caracteres-e-índices)
  - [6.1 Acessar Caractere por Índice](#61-acessar-caractere-por-índice)
  - [6.2 Extrair Substring](#62-extrair-substring)
  - [6.3 Iterar sobre Caracteres](#63-iterar-sobre-caracteres)
- [7. Comparação de Strings](#7-comparação-de-strings)
  - [7.1 Igualdade](#71-igualdade)
  - [7.2 Comparação Lexicográfica](#72-comparação-lexicográfica)
- [8. Formatação Avançada](#8-formatação-avançada)
  - [8.1 Padding e Alinhamento](#81-padding-e-alinhamento)
  - [8.2 Repetição](#82-repetição)
  - [8.3 Replaceamento Avançado](#83-replaceamento-avançado)
- [9. Conversão de Tipos](#9-conversão-de-tipos)
  - [9.1 String para Número](#91-string-para-número)
  - [9.2 Número para String](#92-número-para-string)
  - [9.3 Conversão de Tipo Genérica](#93-conversão-de-tipo-genérica)
- [10. Validação e Sanitização](#10-validação-e-sanitização)
  - [10.1 Validação de Email](#101-validação-de-email)
  - [10.2 Validação de Números](#102-validação-de-números)
  - [10.3 Sanitização de Entrada](#103-sanitização-de-entrada)
- [11. Expressões Regulares (RegExp)](#11-expressões-regulares-regexp)
  - [11.1 Busca com Regex](#111-busca-com-regex)
  - [11.2 Substituição com Regex](#112-substituição-com-regex)
  - [11.3 Validação com Regex](#113-validação-com-regex)
- [12. Performance e Boas Práticas](#12-performance-e-boas-práticas)
  - [12.1 Concatenação Eficiente](#121-concatenação-eficiente)
  - [12.2 Mutabilidade](#122-mutabilidade)
  - [12.3 Null Safety com Strings](#123-null-safety-com-strings)
- [13. Casos de Uso Práticos](#13-casos-de-uso-práticos)
  - [13.1 Processamento de Dados](#131-processamento-de-dados)
  - [13.2 Formatação de Saída](#132-formatação-de-saída)
  - [13.3 Manipulação de URLs](#133-manipulação-de-urls)

---

## 1. Introdução

Uma **string** em Dart é uma sequência imutável de caracteres Unicode. As strings são fundamentais em programação e são usadas para:

- 📄 Representar texto e mensagens
- 🔍 Manipular dados textuais
- 📊 Processar e formatar dados
- 🌐 Comunicação com APIs

```dart
// Exemplo básico
String mensagem = "Olá, Dart!";
print(mensagem);  // Output: Olá, Dart!
```

---

## 2. Declaração e Inicialização

### 2.1 Aspas Simples vs Duplas

Em Dart, você pode usar aspas simples (`'`) ou duplas (`"`). Não há diferença funcional:

```dart
// Aspas duplas
String nome = "João Silva";

// Aspas simples
String cidade = 'São Paulo';

// Ambas são strings válidas
print(nome);    // Output: João Silva
print(cidade);  // Output: São Paulo
```

> 💡 **Dica:** Escolha um estilo e mantenha a consistência em todo o projeto!

### 2.2 Strings Multi-Linha

Para strings que ocupam várias linhas, use `'''` ou `"""`:

```dart
// String multi-linha com aspas triplas
String poema = '''
  Roses are red,
  Violets are blue,
  Dart is awesome,
  And so are you!
''';

print(poema);

// String multi-linha com aspas duplas triplas
String descricao = """
  Este é um exemplo
  de uma string que
  ocupa várias linhas.
""";

print(descricao);
```

### 2.3 Strings Brutas (Raw Strings)

Use `r` antes da string para tratar caracteres de escape como literais:

```dart
// String normal (com escape processing)
String caminho = "C:\\Users\\Dart\\file.txt";
print(caminho);  // Output: C:\Users\Dart\file.txt

// String bruta (sem escape processing)
String caminhoRaw = r"C:\Users\Dart\file.txt";
print(caminhoRaw);  // Output: C:\Users\Dart\file.txt

// Muito útil para regex
String regex = r"^\d{3}-\d{3}-\d{4}$";
```

---

## 3. Interpolação de Strings

### 3.1 Expressões Simples

Use `$variavel` para inserir variáveis diretamente em uma string:

```dart
String nome = "Maria";
int idade = 25;
double altura = 1.65;

// Interpolação simples
print("Nome: $nome");
print("Idade: $idade");
print("Altura: $altura");

// Output:
// Nome: Maria
// Idade: 25
// Altura: 1.65
```

### 3.2 Expressões Complexas

Use `${expressão}` para expressões mais complexas:

```dart
int x = 10;
int y = 20;

// Expressão aritmética
print("Soma: ${x + y}");  // Output: Soma: 30

// Chamada de método
String texto = "hello";
print("Maiúscula: ${texto.toUpperCase()}");  // Output: Maiúscula: HELLO

// Operação ternária
int valor = 15;
print("Status: ${valor > 10 ? "Grande" : "Pequeno"}");  // Output: Status: Grande

// Acesso a propriedades
String lista = "Dart";
print("Comprimento: ${lista.length}");  // Output: Comprimento: 4
```

---

## 4. Propriedades de Strings

### 4.1 Comprimento

Use `.length` para obter o número de caracteres:

```dart
String nome = "Dart";
print(nome.length);  // Output: 4

String mensagem = "Olá, Mundo!";
print(mensagem.length);  // Output: 12
```

### 4.2 Vazia ou Nula

Verifique se a string está vazia:

```dart
String vazia = "";
String preenchida = "Texto";
String? nula = null;

// Verificar se está vazio
print(vazia.isEmpty);      // Output: true
print(preenchida.isEmpty); // Output: false

// Verificar se não está vazio
print(vazia.isNotEmpty);      // Output: false
print(preenchida.isNotEmpty); // Output: true

// Com null safety
if (nula?.isNotEmpty ?? false) {
  print("String tem conteúdo");
} else {
  print("String é vazia ou nula");
}
```

### 4.3 Primeira e Última Posição

Acesse o primeiro e último caractere:

```dart
String palavra = "Dart";

// Primeiro caractere
print(palavra[0]);  // Output: D

// Último caractere
print(palavra[palavra.length - 1]);  // Output: t

// Usando codeUnitAt
print(palavra.codeUnitAt(0));  // Output: 68 (código ASCII de 'D')
```

---

## 5. Métodos Essenciais

### 5.1 Transformação de Caso

```dart
String texto = "Hello Dart World";

// Conversão para maiúsculas
print(texto.toUpperCase());  // Output: HELLO DART WORLD

// Conversão para minúsculas
print(texto.toLowerCase());  // Output: hello dart world

// Capitalizar primeira letra (não nativo, mas comum)
String capitalize(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
print(capitalize(texto));  // Output: Hello dart world
```

### 5.2 Busca e Substituição

```dart
String texto = "Dart é incrível. Dart é poderoso.";

// Verificar se contém substring
print(texto.contains("Dart"));      // Output: true
print(texto.contains("Python"));    // Output: false

// Encontrar índice da primeira ocorrência
print(texto.indexOf("Dart"));       // Output: 0
print(texto.lastIndexOf("Dart"));   // Output: 19

// Verificar início e fim
print(texto.startsWith("Dart"));    // Output: true
print(texto.endsWith("poderoso.")); // Output: true

// Substituição
String atualizado = texto.replaceFirst("Dart", "Flutter");
print(atualizado);  // Output: Flutter é incrível. Dart é poderoso.

String todasReplace = texto.replaceAll("Dart", "Go");
print(todasReplace);  // Output: Go é incrível. Go é poderoso.
```

### 5.3 Divisão e Concatenação

```dart
// Divisão
String lista = "maçã,banana,laranja";
List<String> frutas = lista.split(",");
print(frutas);  // Output: [maçã, banana, laranja]

// Divisão com limite
String data = "2025-12-08";
List<String> partes = data.split("-");
print(partes);  // Output: [2025, 12, 08]

// Concatenação
String parte1 = "Olá";
String parte2 = "Dart";
String concatenada = parte1 + ", " + parte2 + "!";
print(concatenada);  // Output: Olá, Dart!

// Concatenação com interpolação
print("$parte1, $parte2!");  // Output: Olá, Dart!

// Juntar lista
List<String> palavras = ["Dart", "é", "incrível"];
String juntada = palavras.join(" ");
print(juntada);  // Output: Dart é incrível
```

### 5.4 Remoção de Espaços

```dart
String texto = "  Olá Dart!  ";

// Remover espaços antes e depois
String trimada = texto.trim();
print(trimada);  // Output: Olá Dart!
print(trimada.length);  // Output: 10

// Remover apenas espaços no início
String trimLeft = texto.trimLeft();
print(trimLeft);  // Output: Olá Dart!  

// Remover apenas espaços no final
String trimRight = texto.trimRight();
print(trimRight);  // Output:   Olá Dart!
```

### 5.5 Verificação de Conteúdo

```dart
String email = "user@example.com";

// Verificar se é vazio
print(email.isEmpty);  // Output: false

// Verificar correspondência de padrão
bool contemNumero(String s) => s.contains(RegExp(r'\d'));
print(contemNumero("abc123"));  // Output: true

// Verificar se todos os caracteres correspondem
bool todosMinusculos(String s) => s == s.toLowerCase();
print(todosMinusculos("hello"));  // Output: true
print(todosMinusculos("Hello"));  // Output: false
```

---

## 6. Caracteres e Índices

### 6.1 Acessar Caractere por Índice

```dart
String palavra = "Dart";

// Acessar por índice (0-based)
print(palavra[0]);  // Output: D
print(palavra[1]);  // Output: a
print(palavra[2]);  // Output: r
print(palavra[3]);  // Output: t

// Acessar do final
print(palavra[palavra.length - 1]);  // Output: t

// Iterar com índice
for (int i = 0; i < palavra.length; i++) {
  print("$i: ${palavra[i]}");
}
// Output:
// 0: D
// 1: a
// 2: r
// 3: t
```

### 6.2 Extrair Substring

```dart
String texto = "Programação em Dart";

// Extrair substring com início
String sub1 = texto.substring(0, 11);
print(sub1);  // Output: Programação

// Extrair do meio até o final
String sub2 = texto.substring(15);
print(sub2);  // Output: Dart

// Extrair com controle fino
String sub3 = texto.substring(12, 14);
print(sub3);  // Output: em
```

### 6.3 Iterar sobre Caracteres

```dart
String palavra = "Dart";

// Método 1: forEach
palavra.forEach((char) {
  print(char);
});
// Output: D, a, r, t

// Método 2: for-in
for (var char in palavra.split('')) {
  print(char);
}

// Método 3: map
palavra.split('').map((c) => c.toUpperCase()).forEach(print);
// Output: D, A, R, T
```

---

## 7. Comparação de Strings

### 7.1 Igualdade

```dart
String texto1 = "Dart";
String texto2 = "Dart";
String texto3 = "dart";

// Comparação sensível a maiúsculas
print(texto1 == texto2);  // Output: true
print(texto1 == texto3);  // Output: false

// Comparação case-insensitive
print(texto1.toLowerCase() == texto3.toLowerCase());  // Output: true

// Verificar identidade
print(identical(texto1, texto2));  // Output: true (internment strings)
```

### 7.2 Comparação Lexicográfica

```dart
String a = "apple";
String b = "banana";
String c = "apple";

// Comparar ordem alfabética
print(a.compareTo(b));  // Output: -1 (a vem antes de b)
print(b.compareTo(a));  // Output: 1 (b vem depois de a)
print(a.compareTo(c));  // Output: 0 (são iguais)

// Verificar ordem
if (a.compareTo(b) < 0) {
  print("$a vem antes de $b");  // Output: apple vem antes de banana
}
```

---

## 8. Formatação Avançada

### 8.1 Padding e Alinhamento

```dart
String numero = "42";

// Adicionar zeros à esquerda
String formatado = numero.padLeft(5, '0');
print(formatado);  // Output: 00042

// Adicionar espaços à direita
String alinhado = numero.padRight(5);
print("[$alinhado]");  // Output: [42   ]

// Exemplo prático: formatação de hora
String hora = "9";
String minuto = "5";
String formatoHora = "${hora.padLeft(2, '0')}:${minuto.padLeft(2, '0')}";
print(formatoHora);  // Output: 09:05
```

### 8.2 Repetição

```dart
String caractere = "*";

// Repetir string
String linha = caractere * 10;
print(linha);  // Output: **********

// Criar padrão
String estrelas = "⭐" * 5;
print(estrelas);  // Output: ⭐⭐⭐⭐⭐

// Exemplo visual
print("=" * 40);
print("Bem-vindo ao Dart!");
print("=" * 40);
```

### 8.3 Replaceamento Avançado

```dart
String template = "Olá, {nome}! Bem-vindo a {lugar}.";

// Substituição simples
String resultado = template
    .replaceFirst("{nome}", "Maria")
    .replaceFirst("{lugar}", "Dart");
print(resultado);  // Output: Olá, Maria! Bem-vindo a Dart.

// Substituição com função
String texto = "abc abc abc";
String processado = texto.replaceAllMapped(
  RegExp(r'a|b|c'),
  (match) => match.group(0)!.toUpperCase(),
);
print(processado);  // Output: AbC AbC AbC
```

---

## 9. Conversão de Tipos

### 9.1 String para Número

```dart
// String para int
String strInt = "42";
int numero1 = int.parse(strInt);
print(numero1);  // Output: 42

// String para double
String strDouble = "3.14";
double numero2 = double.parse(strDouble);
print(numero2);  // Output: 3.14

// Com tratamento de erro
String invalido = "abc";
try {
  int num = int.parse(invalido);
} catch (e) {
  print("Erro: não conseguiu converter");
}

// Usando tryParse (retorna null se falhar)
int? numero3 = int.tryParse("123");
double? numero4 = double.tryParse("45.67");
int? numero5 = int.tryParse("abc");  // null

print(numero3);  // Output: 123
print(numero5);  // Output: null
```

### 9.2 Número para String

```dart
int inteiro = 42;
double decimal = 3.14159;
bool booleano = true;

// Usando toString()
String str1 = inteiro.toString();
String str2 = decimal.toString();
String str3 = booleano.toString();

print(str1);  // Output: 42
print(str2);  // Output: 3.14159
print(str3);  // Output: true

// Formatação com casas decimais
String formatado = decimal.toStringAsFixed(2);
print(formatado);  // Output: 3.14

// Notação exponencial
String exponencial = (1000000).toStringAsExponential(2);
print(exponencial);  // Output: 1.00e+6
```

### 9.3 Conversão de Tipo Genérica

```dart
// Converter qualquer tipo para string
dynamic valor = 42;
String resultado = valor.toString();
print(resultado);  // Output: 42

// Verificar tipo
if (valor is int) {
  print("É um inteiro");
}

// Conversão segura com null safety
int? numero = int.tryParse("42");
String texto = numero?.toString() ?? "valor inválido";
print(texto);  // Output: 42
```

---

## 10. Validação e Sanitização

### 10.1 Validação de Email

```dart
bool isValidEmail(String email) {
  final regex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return regex.hasMatch(email);
}

print(isValidEmail("user@example.com"));      // Output: true
print(isValidEmail("invalid.email@"));        // Output: false
print(isValidEmail("another@domain.co.uk"));  // Output: true
```

### 10.2 Validação de Números

```dart
bool isNumeric(String s) {
  if (s.isEmpty) return false;
  return double.tryParse(s) != null;
}

bool isInteger(String s) {
  if (s.isEmpty) return false;
  return int.tryParse(s) != null;
}

bool isPositive(String s) {
  final num = int.tryParse(s);
  return num != null && num > 0;
}

print(isNumeric("123"));       // Output: true
print(isNumeric("12.34"));     // Output: true
print(isInteger("12.34"));     // Output: false
print(isPositive("-5"));       // Output: false
```

### 10.3 Sanitização de Entrada

```dart
String sanitize(String input) {
  // Remover espaços extras
  String trimmed = input.trim();
  
  // Remover caracteres especiais
  String sanitized = trimmed.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  
  return sanitized;
}

print(sanitize("  Hello @World#  "));  // Output: Hello World

// Remover apenas números
String removeNumbers(String s) {
  return s.replaceAll(RegExp(r'\d'), '');
}

print(removeNumbers("abc123def456"));  // Output: abcdef
```

---

## 11. Expressões Regulares (RegExp)

### 11.1 Busca com Regex

```dart
String texto = "Dart 3.0 foi lançado em 2023.";

// Criar um RegExp
final regex = RegExp(r'\d+');

// Encontrar primeira correspondência
final match = regex.firstMatch(texto);
if (match != null) {
  print(match.group(0));  // Output: 3
}

// Encontrar todas as correspondências
final matches = regex.allMatches(texto);
matches.forEach((match) {
  print(match.group(0));
});
// Output:
// 3
// 0
// 2023

// Verificar se há correspondência
print(regex.hasMatch(texto));  // Output: true
```

### 11.2 Substituição com Regex

```dart
String texto = "Maçã, Banana, Laranja";

// Substituir padrão
String minusculo = texto.replaceAll(RegExp(r'[A-Z]'), (match) {
  return match.group(0)!.toLowerCase();
});
print(minusculo);  // Output: maçã, banana, laranja

// Substituir números com # 
String withMask = "ID: 12345".replaceAll(RegExp(r'\d'), '#');
print(withMask);  // Output: ID: #####
```

### 11.3 Validação com Regex

```dart
// Validar formato de telefone
bool isValidPhone(String phone) {
  return RegExp(r'^\d{3}-\d{3}-\d{4}$').hasMatch(phone);
}

print(isValidPhone("123-456-7890"));  // Output: true
print(isValidPhone("1234567890"));    // Output: false

// Validar URL
bool isValidUrl(String url) {
  return RegExp(
    r'^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
  ).hasMatch(url);
}

print(isValidUrl("https://example.com"));    // Output: true
print(isValidUrl("ftp://example.com"));      // Output: false
```

---

## 12. Performance e Boas Práticas

### 12.1 Concatenação Eficiente

```dart
// ❌ EVITAR: Concatenação em loop é ineficiente
String resultado = "";
for (int i = 0; i < 1000; i++) {
  resultado += "x";  // Cria nova string a cada iteração
}

// ✅ RECOMENDADO: Usar StringBuffer
StringBuffer buffer = StringBuffer();
for (int i = 0; i < 1000; i++) {
  buffer.write("x");
}
String resultado = buffer.toString();

// ✅ ALTERNATIVA: Usar join com lista
List<String> lista = List.filled(1000, "x");
String resultado = lista.join("");

// ✅ ALTERNATIVA: Usar multiplicação
String resultado = "x" * 1000;
```

### 12.2 Mutabilidade

```dart
// Strings são imutáveis em Dart
String original = "Dart";

// Essas operações retornam NOVAS strings
String maiuscula = original.toUpperCase();
String com2chars = original.substring(0, 2);

print(original);   // Output: Dart (não mudou)
print(maiuscula);  // Output: DART (nova string)

// Use StringBuffer para "mutar" textos
StringBuffer sb = StringBuffer("Dart");
sb.write(" é incrível");
print(sb.toString());  // Output: Dart é incrível
```

### 12.3 Null Safety com Strings

```dart
// Verificar nulidade
String? nome = null;

// Usar null coalescing
String apresentacao = "Olá, ${nome ?? "usuário"}";
print(apresentacao);  // Output: Olá, usuário

// Verificar antes de usar
if (nome != null && nome.isNotEmpty) {
  print(nome.toUpperCase());
}

// Usar extensão de null safety
String? email = null;
print(email?.length);  // Output: null
print(email?.toUpperCase() ?? "sem email");  // Output: sem email
```

---

## 13. Casos de Uso Práticos

### 13.1 Processamento de Dados

```dart
// CSV para lista
String csv = "João,25,São Paulo;Maria,30,Rio de Janeiro;Pedro,28,Belo Horizonte";

List<Map<String, dynamic>> pessoas = csv.split(";").map((linha) {
  var partes = linha.split(",");
  return {
    'nome': partes[0],
    'idade': int.parse(partes[1]),
    'cidade': partes[2],
  };
}).toList();

pessoas.forEach((p) {
  print("${p['nome']} tem ${p['idade']} anos e mora em ${p['cidade']}");
});
```

### 13.2 Formatação de Saída

```dart
// Formatação de tabela
void imprimirTabela(List<Map<String, dynamic>> dados) {
  print("=" * 50);
  print("Nome".padRight(15) + "Idade".padRight(10) + "Cidade");
  print("-" * 50);
  
  for (var item in dados) {
    print(
      item['nome'].toString().padRight(15) +
      item['idade'].toString().padRight(10) +
      item['cidade'].toString()
    );
  }
  print("=" * 50);
}

List<Map<String, dynamic>> dados = [
  {'nome': 'João', 'idade': 25, 'cidade': 'São Paulo'},
  {'nome': 'Maria', 'idade': 30, 'cidade': 'Rio de Janeiro'},
];

imprimirTabela(dados);
```

### 13.3 Manipulação de URLs

```dart
// Extrair componentes de URL
String url = "https://api.example.com:8080/users/123?sort=name&limit=10";

// Extrair protocolo
String protocolo = url.split("://")[0];
print(protocolo);  // Output: https

// Extrair domínio
String dominio = url.split("/")[2];
print(dominio);  // Output: api.example.com:8080

// Extrair caminho
RegExp pathRegex = RegExp(r'https?://[^/]+(/[^?]*)');
String? caminho = pathRegex.firstMatch(url)?.group(1);
print(caminho);  // Output: /users/123

// Extrair query parameters
String? queryString = url.split("?").last;
List<String> params = queryString.split("&");
params.forEach((param) {
  var kv = param.split("=");
  print("${kv[0]}: ${kv[1]}");
});
// Output:
// sort: name
// limit: 10
```

---

## 📚 Resumo Rápido

| Operação | Sintaxe | Exemplo |
| :--- | :--- | :--- |
| **Criar String** | `String s = "texto"` | `String nome = "Dart"` |
| **Interpolação** | `"${variável}"` | `"Olá, $nome!"` |
| **Comprimento** | `.length` | `nome.length` |
| **Maiúsculas** | `.toUpperCase()` | `nome.toUpperCase()` |
| **Minúsculas** | `.toLowerCase()` | `nome.toLowerCase()` |
| **Contém** | `.contains()` | `nome.contains("ar")` |
| **Substituir** | `.replaceAll()` | `nome.replaceAll("a", "e")` |
| **Dividir** | `.split()` | `"a,b,c".split(",")` |
| **Juntar** | `.join()` | `["a", "b"].join(",")` |
| **Substring** | `.substring()` | `nome.substring(0, 3)` |
| **Trim** | `.trim()` | `"  texto  ".trim()` |
| **Começar com** | `.startsWith()` | `nome.startsWith("D")` |
| **Terminar com** | `.endsWith()` | `nome.endsWith("t")` |
| **Comparar** | `.compareTo()` | `"a".compareTo("b")` |

---

## ✅ Boas Práticas

1. **Use interpolação** em vez de concatenação: `"Olá, $nome"` em vez de `"Olá, " + nome`
2. **Validate input** sempre que receber strings de usuários
3. **Use RegExp** para padrões complexos
4. **Prefira `.trimParse()`** a `.parse()` para evitar exceções
5. **Use StringBuffer** para múltiplas concatenações
6. **Strings são imutáveis** - cada operação retorna uma nova string
7. **Considere performance** em operações em loop

---

## 🎓 Próximos Passos

- Explore expressões regulares mais complexas
- Pratique validação de dados
- Combine strings com outras estruturas de dados
- Trabalhe com APIs e processamento de JSON com strings