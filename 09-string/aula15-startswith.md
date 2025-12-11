# startsWith - Verificação de Início

## Índice
- [Método startsWith()](#método-startswith)
- [Usando startsWith()](#usando-startswith)
- [Casos de Uso](#casos-de-uso)

---

## Método startsWith()

Verifica se uma string começa com um prefixo específico:

### Sintaxe

```dart
bool resultado = minhaString.startsWith(prefixo);
bool resultado = minhaString.startsWith(prefixo, posicao);
```

### Parâmetros

- **prefixo:** O texto a procurar no início
- **posicao:** (opcional) Iniciar verificação em qual índice

### Características

- **Retorna:** `true` se começa, `false` caso contrário
- **Sensível:** Maiúsculas e minúsculas
- **Posição:** Pode começar de um índice específico
- **Eficiente:** O(n) onde n é o tamanho do prefixo

---

## Usando startsWith()

### Verificação Simples

```dart
String url = "https://www.google.com";
String email = "usuario@email.com";

print("URL é HTTPS? ${url.startsWith("https")}");      // true
print("Email é Gmail? ${email.startsWith("user")}");   // true
print("URL é HTTP? ${url.startsWith("http")}");        // false
```

### Validação em Condições

```dart
String protocolo = "https://example.com";

if (protocolo.startsWith("https")) {
  print("Conexão segura ✓");
} else if (protocolo.startsWith("http")) {
  print("Conexão insegura ⚠");
} else {
  print("Protocolo desconhecido");
}
// Output: Conexão segura ✓
```

### Com Posição

```dart
String texto = "O Dart é incrível";

// Verificar a partir do índice 2
print(texto.startsWith("Dart", 2));   // true
print(texto.startsWith("Dart", 3));   // false
```

---

## Casos de Uso

### Validação de URL

```dart
String url = "https://www.github.com/usuario";

bool isSegura = url.startsWith("https");
bool isWWW = url.startsWith("https://www");

print("URL segura: $isSegura");
print("Começa com WWW: $isWWW");
// Output:
// URL segura: true
// Começa com WWW: true
```

### Filtro de Email

```dart
List<String> emails = [
  "admin@company.com",
  "user@company.com",
  "support@company.com",
  "john@gmail.com"
];

// Apenas emails da company
List<String> adminEmails = emails
    .where((e) => e.startsWith("admin"))
    .toList();

print("Emails de admin: $adminEmails");
// Output: Emails de admin: [admin@company.com]
```

### Roteamento de API

```dart
String rota = "/api/v1/usuarios";

if (rota.startsWith("/api/v1")) {
  print("Usar versão 1 da API");
} else if (rota.startsWith("/api/v2")) {
  print("Usar versão 2 da API");
}
// Output: Usar versão 1 da API
```

### Comentários de Código

```dart
List<String> linhas = [
  "// Este é um comentário",
  "int x = 10;",
  "/* Comentário bloco",
  "String nome = 'Dart';"
];

// Filtrar comentários de linha
List<String> comentarios = linhas
    .where((l) => l.startsWith("//"))
    .toList();

print("Comentários: $comentarios");
// Output: Comentários: [// Este é um comentário]
```

### Filtro de Logs

```dart
List<String> logs = [
  "INFO: Aplicação iniciada",
  "WARN: Memória baixa",
  "ERROR: Falha na conexão",
  "INFO: Requisição processada"
];

// Mostrar apenas ERROS
List<String> erros = logs
    .where((l) => l.startsWith("ERROR"))
    .toList();

print("Erros: $erros");
// Output: Erros: [ERROR: Falha na conexão]
```

### Extensão de Arquivo

```dart
List<String> arquivos = [
  "documento.pdf",
  "imagem.jpg",
  "script.dart",
  "arquivo.pdf"
];

// Buscar PDFs
List<String> pdfs = arquivos
    .where((f) => f.endsWith(".pdf") || f.startsWith("arquivo"))
    .toList();

print("Arquivos relevantes: $pdfs");
// Output: Arquivos relevantes: [documento.pdf, arquivo.pdf]
```

### Namespace/Pacote

```dart
String nomeClasse = "com.company.usuario.User";

if (nomeClasse.startsWith("com.company")) {
  print("Classe interna");
} else {
  print("Classe externa");
}
// Output: Classe interna
```

---

## Comparação com Contains

| Método | Posição | Busca |
|--------|---------|-------|
| `startsWith()` | Início | Prefixo |
| `contains()` | Qualquer | Substring |
| `endsWith()` | Fim | Sufixo |

---

## Sensibilidade a Maiúsculas

### Problema

```dart
String url = "HTTPS://example.com";

print(url.startsWith("https"));    // false
print(url.startsWith("HTTPS"));    // true
```

### Solução

```dart
String url = "HTTPS://example.com";

// Converter para minúsculas
print(url.toLowerCase().startsWith("https"));  // true
```

---

## ✅ Padrões Recomendados

### Validador de Prefixo

```dart
bool temPrefixoValido(String texto, List<String> prefixos) {
  for (String prefixo in prefixos) {
    if (texto.startsWith(prefixo)) {
      return true;
    }
  }
  return false;
}

List<String> protocolos = ["https", "http", "ftp"];
print(temPrefixoValido("https://example.com", protocolos));  // true
```

### Filtro de Múltiplos Prefixos

```dart
List<String> arquivos = [
  ".gitignore",
  "main.dart",
  ".env",
  "README.md"
];

// Mostrar apenas ocultos
List<String> ocultos = arquivos
    .where((f) => f.startsWith("."))
    .toList();

print("Arquivos ocultos: $ocultos");
// Output: Arquivos ocultos: [.gitignore, .env]
```

### Com Default Value

```dart
String buscarTipo(String arquivo) {
  if (arquivo.startsWith(".")) {
    return "Arquivo oculto";
  } else if (arquivo.startsWith("README")) {
    return "Documentação";
  } else {
    return "Arquivo normal";
  }
}

print(buscarTipo(".gitignore"));
// Output: Arquivo oculto
```

---

## Ver Também
- [Aula 16: endsWith](aula16-endswith.md) - Verificar fim
- [Aula 11: contains](aula11-contains.md) - Verificar conteúdo
- [Aula 05: substring](aula05-substring.md) - Extrair prefixo

