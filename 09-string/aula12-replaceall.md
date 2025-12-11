# replaceAll - Substituição Total

## Índice
- [Método replaceAll()](#método-replaceall)
- [Usando replaceAll()](#usando-replaceall)
- [Casos de Uso](#casos-de-uso)

---

## Método replaceAll()

Substitui TODAS as ocorrências de um padrão em uma string:

### Sintaxe

```dart
String resultado = minhaString.replaceAll(padrao, substituicao);
```

### Parâmetros

- **padrao:** O texto a encontrar (pode ser RegExp)
- **substituicao:** O texto que substituirá

### Características

- **Retorna:** Nova string com substituições
- **Original:** Não modifica a string original
- **Ocorrências:** Substitui TODAS
- **Suporta:** Strings ou expressões regulares

---

## Usando replaceAll()

### Substituição Simples

```dart
String texto = "Olá mundo, mundo feliz";

String resultado = texto.replaceAll("mundo", "Dart");
print("Original: $texto");
print("Resultado: $resultado");
// Output:
// Original: Olá mundo, mundo feliz
// Resultado: Olá Dart, Dart feliz
```

### Múltiplas Palavras

```dart
String mensagem = "Java é bom, Python é bom, C++ é bom";

String resultado = mensagem.replaceAll("bom", "ótimo");
print(resultado);
// Output: Java é ótimo, Python é ótimo, C++ é ótimo
```

### Caracteres Especiais

```dart
String telefone = "11-98765-4321";

String resultado = telefone.replaceAll("-", "");
print("Com hífen: $telefone");
print("Sem hífen: $resultado");
// Output:
// Com hífen: 11-98765-4321
// Sem hífen: 11987654321
```

---

## Casos de Uso

### Limpeza de Dados

```dart
String texto = "texto   com   múltiplos   espaços";

String resultado = texto.replaceAll("   ", " ");
print(resultado);
// Output: texto com múltiplos espaços
```

### Normalização de URL

```dart
String url = "meu site/pagina/sobre";

String resultado = url.replaceAll("/", "-");
print("Original: $url");
print("Resultado: $resultado");
// Output:
// Original: meu site/pagina/sobre
// Resultado: meu site-pagina-sobre
```

### Formatação de Documento

```dart
String cpf = "12345678900";

// Adicionar formatação
String resultado = cpf.replaceAll(RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'), r'$1.$2.$3-$4');
print("CPF formatado: $resultado");
// Output: CPF formatado: 123.456.789-00
```

### Remoção de Caracteres

```dart
String preco = "R$ 1.234,56";

// Remover símbolos e separadores
String apenas_numeros = preco.replaceAll(RegExp(r'[^\d,]'), '');
print("Apenas números: $apenas_numeros");
// Output: Apenas números: 1234,56
```

### Traduções Simples

```dart
String mensagem = "Hello World";

String resultado = mensagem
    .replaceAll("Hello", "Olá")
    .replaceAll("World", "Mundo");

print(resultado);
// Output: Olá Mundo
```

### Limpeza de HTML

```dart
String html = "<p>Olá <b>mundo</b></p>";

String texto = html
    .replaceAll("<p>", "")
    .replaceAll("</p>", "")
    .replaceAll("<b>", "")
    .replaceAll("</b>", "");

print(texto);
// Output: Olá mundo
```

### Corrigir Erros de Digitação

```dart
String texto = "Este texto tem erro de digitação: livraria";

String resultado = texto.replaceAll("livraria", "livraria");
print(resultado);
// Output: Este texto tem erro de digitação: livraria
```

### Customização de Mensagens

```dart
String template = "Olá {{nome}}, bem-vindo ao {{aplicacao}}!";

Map<String, String> dados = {
  "nome": "João",
  "aplicacao": "Meu App"
};

String resultado = template;
dados.forEach((chave, valor) {
  resultado = resultado.replaceAll("{{$chave}}", valor);
});

print(resultado);
// Output: Olá João, bem-vindo ao Meu App!
```

---

## Expressões Regulares

### Substituir com RegExp

```dart
String texto = "Encontre 123 números 456 aqui 789";

// Substituir todos os números por X
String resultado = texto.replaceAll(RegExp(r'\d'), 'X');
print(resultado);
// Output: Encontre XXX números XXX aqui XXX
```

### Substituir com Função

```dart
String texto = "abc 123 def 456 ghi";

String resultado = texto.replaceAll(
  RegExp(r'\d+'),
  (match) => "[${match.group(0)}]"
);
print(resultado);
// Output: abc [123] def [456] ghi
```

---

## Comparação com replaceFirst

| Método | Ocorrências | Exemplo |
|--------|------------|---------|
| `replaceAll()` | Todas | `"aaa".replaceAll("a", "b")` → `"bbb"` |
| `replaceFirst()` | Primeira | `"aaa".replaceFirst("a", "b")` → `"baa"` |

---

## ✅ Padrões Recomendados

### Cadeia de Substituições

```dart
String nome = "  João SILVA  ";

String resultado = nome
    .trim()                    // Remove espaços
    .replaceAll("SILVA", "Silva")  // Caso correto
    .replaceAll("João", "João");

print("'$resultado'");
// Output: 'João Silva'
```

### Limpeza de Entrada

```dart
String entrada = "   Texto   com   espaços   ";

String limpo = entrada
    .trim()
    .replaceAll(RegExp(r'\s+'), ' ');

print("'$limpo'");
// Output: 'Texto com espaços'
```

---

## Ver Também
- [Aula 13: replaceFirst](aula13-replacefirst.md) - Substituir primeira
- [Aula 14: replaceRange](aula14-replacerange.md) - Substituir intervalo
- [Aula 12: replaceAll](aula12-replaceall.md) - Referência completa

