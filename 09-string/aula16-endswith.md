# endsWith - Verificação de Final

## Índice
- [Método endsWith()](#método-endswith)
- [Usando endsWith()](#usando-endswith)
- [Casos de Uso](#casos-de-uso)

---

## Método endsWith()

Verifica se uma string termina com um sufixo específico:

### Sintaxe

```dart
bool resultado = minhaString.endsWith(sufixo);
```

### Parâmetros

- **sufixo:** O texto a procurar no final

### Características

- **Retorna:** `true` se termina, `false` caso contrário
- **Sensível:** Maiúsculas e minúsculas
- **Inverso de:** `startsWith()`
- **Eficiente:** O(n) onde n é o tamanho do sufixo

---

## Usando endsWith()

### Verificação Simples

```dart
String arquivo = "documento.pdf";
String email = "usuario@email.com";

print("É PDF? ${arquivo.endsWith(".pdf")}");        // true
print("É Gmail? ${email.endsWith("@gmail.com")}"); // false
print("É email? ${email.endsWith(".com")}");       // true
```

### Validação em Condições

```dart
String nomeArquivo = "foto.jpg";

if (nomeArquivo.endsWith(".jpg")) {
  print("Arquivo de imagem ✓");
} else if (nomeArquivo.endsWith(".png")) {
  print("Arquivo PNG ✓");
} else {
  print("Formato não suportado");
}
// Output: Arquivo de imagem ✓
```

---

## Casos de Uso

### Validação de Extensão

```dart
List<String> arquivos = [
  "documento.pdf",
  "imagem.jpg",
  "video.mp4",
  "script.dart",
  "estilo.css"
];

// Filtrar PDFs
List<String> pdfs = arquivos
    .where((f) => f.endsWith(".pdf"))
    .toList();

print("PDFs: $pdfs");
// Output: PDFs: [documento.pdf]
```

### Tipo de Arquivo

```dart
String nomeArquivo = "apresentacao.pptx";

String tipo = "";
if (nomeArquivo.endsWith(".pdf")) {
  tipo = "Documento";
} else if (nomeArquivo.endsWith(".jpg") || nomeArquivo.endsWith(".png")) {
  tipo = "Imagem";
} else if (nomeArquivo.endsWith(".pptx")) {
  tipo = "Apresentação";
} else {
  tipo = "Desconhecido";
}

print("Tipo: $tipo");
// Output: Tipo: Apresentação
```

### Validação de Email

```dart
String email = "usuario@company.com";

bool isCompanyEmail = email.endsWith("@company.com");

if (isCompanyEmail) {
  print("Email corporativo");
} else {
  print("Email pessoal");
}
// Output: Email corporativo
```

### Domínio de Website

```dart
List<String> urls = [
  "https://example.com",
  "https://example.org",
  "https://example.net",
  "https://example.br"
];

// Filtrar .com
List<String> domainsComerciais = urls
    .where((u) => u.endsWith(".com"))
    .toList();

print("Domínios .com: $domainsComerciais");
// Output: Domínios .com: [https://example.com]
```

### Versão de Arquivo

```dart
List<String> arquivos = [
  "backup_v1.zip",
  "backup_v2.zip",
  "backup_final.zip"
];

// Apenas versões numeradas
List<String> versoes = arquivos
    .where((a) => a.endsWith(".zip") && a.contains("_v"))
    .toList();

print("Versões: $versoes");
// Output: Versões: [backup_v1.zip, backup_v2.zip]
```

### Protocolo de URL

```dart
String url = "telnet://servidor.com";

bool isHTTP = url.endsWith(".com") || url.endsWith(".org");
bool isTelnet = url.startsWith("telnet://");

print("É HTTP(S): $isHTTP");
print("É Telnet: $isTelnet");
// Output:
// É HTTP(S): true
// É Telnet: true
```

### Formatação de Texto

```dart
String mensagem = "Esta é uma afirmação.";

if (mensagem.endsWith(".")) {
  print("Frase completa");
} else if (mensagem.endsWith("?")) {
  print("Pergunta");
} else if (mensagem.endsWith("!")) {
  print("Exclamação");
} else {
  print("Frase incompleta");
}
// Output: Frase completa
```

---

## Comparação: startsWith vs endsWith

| Método | Posição | Busca |
|--------|---------|-------|
| `startsWith()` | Início | Prefixo |
| `endsWith()` | Fim | Sufixo |
| `contains()` | Qualquer | Substring |

---

## Sensibilidade a Maiúsculas

### Problema

```dart
String arquivo = "DOCUMENTO.PDF";

print(arquivo.endsWith(".pdf"));    // false
print(arquivo.endsWith(".PDF"));    // true
```

### Solução

```dart
String arquivo = "DOCUMENTO.PDF";

// Converter para minúsculas
print(arquivo.toLowerCase().endsWith(".pdf"));  // true
```

---

## ✅ Padrões Recomendados

### Validador de Sufixo

```dart
bool temSufixoValido(String texto, List<String> sufixos) {
  for (String sufixo in sufixos) {
    if (texto.endsWith(sufixo)) {
      return true;
    }
  }
  return false;
}

List<String> extensoes = [".pdf", ".doc", ".txt"];
print(temSufixoValido("documento.pdf", extensoes));  // true
print(temSufixoValido("imagem.jpg", extensoes));     // false
```

### Função de Tipo

```dart
String obterTipo(String arquivo) {
  if (arquivo.endsWith(".pdf") || arquivo.endsWith(".doc")) {
    return "Documento";
  } else if (arquivo.endsWith(".jpg") || arquivo.endsWith(".png")) {
    return "Imagem";
  } else if (arquivo.endsWith(".mp4") || arquivo.endsWith(".avi")) {
    return "Vídeo";
  } else {
    return "Outro";
  }
}

print(obterTipo("foto.jpg"));
// Output: Imagem
```

### Filtro Case-Insensitive

```dart
List<String> arquivos = [
  "DOCUMENTO.PDF",
  "imagem.JPG",
  "script.DART"
];

// Filtrar PDFs (ignorando maiúsculas)
List<String> pdfs = arquivos
    .where((f) => f.toLowerCase().endsWith(".pdf"))
    .toList();

print("PDFs: $pdfs");
// Output: PDFs: [DOCUMENTO.PDF]
```

### Remover Sufixo

```dart
String nomeComExtensao = "documento.pdf";

// Remover extensão
String nomeSemExtensao = nomeComExtensao.endsWith(".pdf")
    ? nomeComExtensao.substring(0, nomeComExtensao.length - 4)
    : nomeComExtensao;

print("Nome: $nomeSemExtensao");
// Output: Nome: documento
```

---

## Ver Também
- [Aula 15: startsWith](aula15-startswith.md) - Verificar início
- [Aula 11: contains](aula11-contains.md) - Verificar conteúdo
- [Aula 05: substring](aula05-substring.md) - Extrair sufixo

