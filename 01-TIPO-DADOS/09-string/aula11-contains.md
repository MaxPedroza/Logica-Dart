# contains - Busca por Substring

## Índice
- [Método contains()](#método-contains)
- [Usando contains()](#usando-contains)
- [Casos de Uso](#casos-de-uso)

---

## Método contains()

Verifica se uma string contém uma substring específica:

### Sintaxe

```dart
bool resultado = minhaString.contains(substring);
```

### Características

- **Retorna:** `true` se contém, `false` caso contrário
- **Sensível a maiúsculas/minúsculas:** Sim
- **Parâmetro:** A substring a procurar
- **Complexidade:** O(n) - percorre a string

---

## Usando contains()

### Busca Simples

```dart
String frase = "Dart é uma linguagem excelente";

bool temDart = frase.contains("Dart");
bool temPython = frase.contains("Python");
bool temlingua = frase.contains("lingua");

print("Contém 'Dart'? $temDart");          // true
print("Contém 'Python'? $temPython");      // false
print("Contém 'lingua'? $temlingua");      // false (sem acento)
// Output:
// Contém 'Dart'? true
// Contém 'Python'? false
// Contém 'lingua'? false (sem acento)
```

### Validação em Condições

```dart
String email = "usuario@email.com";

if (email.contains("@")) {
  print("Email válido (tem @)");
} else {
  print("Email inválido");
}
// Output: Email válido (tem @)
```

### Busca com Variável

```dart
String texto = "Flutter é awesome";
String procurado = "awesome";

if (texto.contains(procurado)) {
  print("Encontrou '$procurado' em: $texto");
} else {
  print("Não encontrou '$procurado'");
}
// Output: Encontrou 'awesome' em: Flutter é awesome
```

---

## Casos de Uso

### Validação de Email

```dart
String email = "joao.silva@email.com";

bool emailValido = email.contains("@") && email.contains(".");

if (emailValido) {
  print("Email parece válido");
} else {
  print("Email inválido");
}
// Output: Email parece válido
```

### Filtro de URL

```dart
List<String> urls = [
  "https://google.com",
  "https://github.com",
  "ftp://servidor.com",
  "https://stackoverflow.com"
];

// Filtrar apenas URLs HTTPS
List<String> urlsSeguras = urls.where((url) => url.contains("https://")).toList();
print("URLs seguras: $urlsSeguras");
// Output: URLs seguras: [https://google.com, https://github.com, https://stackoverflow.com]
```

### Busca de Palavras-chave

```dart
String descricao = "Este produto é feito de plástico resistente";

List<String> palavrasChave = ["plástico", "metal", "madeira"];

for (String palavra in palavrasChave) {
  if (descricao.contains(palavra)) {
    print("Encontrado: $palavra");
  }
}
// Output: Encontrado: plástico
```

### Verificação de Tipo de Arquivo

```dart
String arquivo = "documento.pdf";

if (arquivo.contains(".pdf")) {
  print("É um arquivo PDF");
} else if (arquivo.contains(".doc")) {
  print("É um documento Word");
} else {
  print("Tipo desconhecido");
}
// Output: É um arquivo PDF
```

### Validação de Senha

```dart
String senha = "MyPassword123!";

bool temMaiuscula = senha.contains(RegExp(r'[A-Z]'));
bool temNumero = senha.contains(RegExp(r'[0-9]'));
bool temEspecial = senha.contains(RegExp(r'[!@#\$%^&*]'));

print("Maiúscula: $temMaiuscula, Número: $temNumero, Especial: $temEspecial");
// Output: Maiúscula: true, Número: true, Especial: true
```

### Filtro de Logs

```dart
List<String> logs = [
  "INFO: Aplicação iniciada",
  "ERROR: Conexão perdida",
  "INFO: Usuário conectado",
  "ERROR: Arquivo não encontrado"
];

// Mostrar apenas erros
List<String> erros = logs.where((log) => log.contains("ERROR")).toList();
print("Erros encontrados: ${erros.length}");
// Output: Erros encontrados: 2
```

---

## Sensibilidade a Maiúsculas

### Problema

```dart
String texto = "Flutter";

print(texto.contains("flutter"));  // false (minúscula)
print(texto.contains("Flutter"));  // true (exato)
```

### Solução: toLowerCase()

```dart
String texto = "Flutter";
String procuro = "flutter";

if (texto.toLowerCase().contains(procuro.toLowerCase())) {
  print("Encontrou (ignorando maiúsculas)");
} else {
  print("Não encontrou");
}
// Output: Encontrou (ignorando maiúsculas)
```

---

## Tabela Resumida

| Método | Sintaxe | Retorna |
|--------|---------|---------|
| contains() | `str.contains("x")` | `bool` |
| Sensível | Maiúsculas e minúsculas | `true` |
| Case-insensitive | `.toLowerCase().contains()` | Solução |

---

## ✅ Padrões Recomendados

### Busca Múltipla

```dart
String titulo = "Introdução ao Dart e Flutter";
List<String> termos = ["Dart", "Flutter", "Python"];

for (String termo in termos) {
  if (titulo.contains(termo)) {
    print("✓ Contém '$termo'");
  } else {
    print("✗ Não contém '$termo'");
  }
}
// Output:
// ✓ Contém 'Dart'
// ✓ Contém 'Flutter'
// ✗ Não contém 'Python'
```

### Busca com Índice

```dart
String mensagem = "Dart é incrível!";

if (mensagem.contains("incrível")) {
  int indice = mensagem.indexOf("incrível");
  print("'incrível' encontrado no índice $indice");
} else {
  print("Não encontrado");
}
// Output: 'incrível' encontrado no índice 9
```

---

## Ver Também
- [Aula 15: startsWith](aula15-startswith.md) - Verificar início
- [Aula 16: endsWith](aula16-endswith.md) - Verificar final
- [Aula 06: Split](aula06-split.md) - Dividir por texto

