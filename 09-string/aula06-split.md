# Split - Dividir Strings

## Índice
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Comuns](#exemplos-comuns)
- [Casos Práticos](#casos-práticos)
- [Join - Unir de Volta](#join---unir-de-volta)

---

## Sintaxe Básica

O método `split()` divide uma string em uma **lista de strings** usando um separador:

```dart
String texto = "a,b,c";
List<String> resultado = texto.split(",");
// Resultado: ["a", "b", "c"]
```

---

## Exemplos Comuns

### Dividir por Espaço

```dart
String nomeCompleto2 = "Max Souza Pedroza";
List<String> nomes = nomeCompleto2.split(' ');
print("Exemplo 1 - split(' '): $nomes");
// Output: Exemplo 1 - split(' '): [Max, Souza, Pedroza]

print("  Primeiro nome: ${nomes[0]}");   // Output: Max
print("  Segundo nome: ${nomes[1]}");    // Output: Souza
print("  Terceiro nome: ${nomes[2]}");   // Output: Pedroza
```

### Dividir por Vírgula

```dart
String endereco = "Rua A,São Paulo,Brasil";
List<String> enderecoPartes = endereco.split(',');
print("Exemplo 2 - split(','): $enderecoPartes");
// Output: Exemplo 2 - split(','): [Rua A, São Paulo, Brasil]
```

### Dividir por Outros Caracteres

```dart
String data = "01-12-2024";
List<String> dataPartes = data.split('-');
print("Exemplo 3 - split('-'): $dataPartes");
// Output: Exemplo 3 - split('-'): [01, 12, 2024]
```

### Acessar Elementos

```dart
String frutas = "Maçã,Banana,Laranja";
List<String> frutasSeparadas = frutas.split(',');
print("Exercício 6 - primeira fruta: ${frutasSeparadas[0]}");
// Output: Exercício 6 - primeira fruta: Maçã
```

---

## Casos Práticos

### Parsear CSV

```dart
String csv = "João,25,São Paulo";
List<String> partes = csv.split(",");

String nome = partes[0];
int idade = int.parse(partes[1]);
String cidade = partes[2];

print("$nome, $idade anos, mora em $cidade");
// Output: João, 25 anos, mora em São Paulo
```

### Extrair Extensão de Arquivo

```dart
String arquivo = "documento.pdf";
List<String> partes = arquivo.split(".");

if (partes.length > 1) {
  String extensao = partes.last;
  print("Extensão: $extensao");  // Output: Extensão: pdf
}
```

### Processar URL com Query Parameters

```dart
String url = "https://example.com?nome=João&idade=25";
String queryString = url.split("?").last;

List<String> params = queryString.split("&");
for (String param in params) {
  List<String> kv = param.split("=");
  print("${kv[0]}: ${kv[1]}");
}

// Output:
// nome: João
// idade: 25
```

### Converter Texto em Palavras

```dart
String frase = "Dart é uma linguagem incrível";
List<String> palavras = frase.split(" ");

print("Total de palavras: ${palavras.length}");  // Output: 5
print("Primeira palavra: ${palavras[0]}");       // Output: Dart
print("Última palavra: ${palavras.last}");       // Output: incrível
```

---

## Join - Unir de Volta

O método inverso de `split()` é `join()`, que une uma lista em uma string:

```dart
List<String> palavras = ["Dart", "é", "incrível"];

// Juntar com espaço
String juntada = palavras.join(" ");
print(juntada);  // Output: Dart é incrível

// Juntar sem separador
String concatenada = palavras.join("");
print(concatenada);  // Output: Dartéincrível

// Juntar com separador diferente
List<String> nomes = ["João", "Maria", "Pedro"];
String lista = nomes.join(", ");
print(lista);  // Output: João, Maria, Pedro
```

### Exemplo Completo: Converter CSV

```dart
String csvData = "João,25,São Paulo;Maria,30,Rio;Pedro,28,Belo Horizonte";

// Dividir por linhas
List<String> linhas = csvData.split(";");

for (String linha in linhas) {
  // Dividir cada linha por campos
  List<String> campos = linha.split(",");
  
  String nome = campos[0];
  String idade = campos[1];
  String cidade = campos[2];
  
  print("$nome - $idade anos - $cidade");
}

// Output:
// João - 25 anos - São Paulo
// Maria - 30 anos - Rio
// Pedro - 28 anos - Belo Horizonte
```

---

## ⚠️ Casos Especiais

### Split com String Vazia

```dart
String texto = "";
List<String> resultado = texto.split(",");
print(resultado);  // Output: []
```

### Split com Múltiplos Separadores

```dart
String texto = "a, b,c ,d";
List<String> partes = texto.split(",");
// Output: ["a", " b", "c ", "d"]

// Solução: usar trim() em cada parte
List<String> limpo = partes.map((p) => p.trim()).toList();
// Output: ["a", "b", "c", "d"]
```

---

## Tabela Resumida

| Operação | Exemplo | Resultado |
|----------|---------|-----------|
| Split básico | `"a,b".split(",")` | ["a", "b"] |
| Split por espaço | `"a b".split(" ")` | ["a", "b"] |
| Split por regex | `"a1b2c".split(RegExp(r"\d"))` | ["a", "b", "c"] |
| Join | `["a","b"].join(",")` | "a,b" |

