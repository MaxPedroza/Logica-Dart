# trimLeft - Remoção de Espaços à Esquerda

## Índice
- [Método trimLeft()](#método-trimleft)
- [Usando trimLeft()](#usando-trimleft)
- [Casos de Uso](#casos-de-uso)

---

## Método trimLeft()

Remove espaços em branco apenas do início (lado esquerdo) da string:

### Sintaxe

```dart
String resultado = minhaString.trimLeft();
```

### Características

- **Retorna:** Nova string sem espaços no início
- **Remove:** Espaços, tabs, quebras de linha (apenas início)
- **Não remove:** Espaços no final
- **Original:** Não modifica a string original

---

## Usando trimLeft()

### Remoção Simples

```dart
String texto1 = "  Olá  ";
String texto2 = "\tDart";
String texto3 = "   Flutter   ";

print("'${texto1.trimLeft()}'");    // 'Olá  '
print("'${texto2.trimLeft()}'");    // 'Dart'
print("'${texto3.trimLeft()}'");    // 'Flutter   '
```

### Visualizar Diferença

```dart
String original = "   espaço esquerda   ";

print("Original: '${original}'");               // '   espaço esquerda   '
print("trimLeft(): '${original.trimLeft()}'");  // 'espaço esquerda   '
print("trim(): '${original.trim()}'");          // 'espaço esquerda'
```

### Manter Espaço à Direita

```dart
String indentado = "    código indentado";

String resultado = indentado.trimLeft();
print("'$resultado'");  // 'código indentado'
```

---

## Casos de Uso

### Remover Indentação

```dart
String codigo = """
    void main() {
        print('Hello');
    }
""";

List<String> linhas = codigo.split("\n");
List<String> linhasLimpas = linhas
    .map((l) => l.trimLeft())
    .toList();

for (String linha in linhasLimpas) {
  print("'$linha'");
}
// Output:
// ''
// 'void main() {'
// '    print('Hello');'
// '    }'
```

### Processamento de Logs

```dart
List<String> logs = [
  "   INFO: Sistema iniciado",
  "     ERROR: Conexão perdida",
  "  WARN: Memória baixa"
];

// Remover espaços desnecessários
List<String> logsLimpos = logs
    .map((l) => l.trimLeft())
    .toList();

for (String log in logsLimpos) {
  print("'$log'");
}
```

### Formatação de Documento

```dart
String paragrafo = "   Este é o início de um parágrafo";

String formatado = paragrafo.trimLeft();
print("'$formatado'");
// Output: 'Este é o início de um parágrafo'
```

### Limpeza Seletiva

```dart
String entrada = "   João Silva   ";

// Remover apenas espaços do início
String resultado = entrada.trimLeft();
print("'$resultado'");  // 'João Silva   '
```

### Alinhamento à Direita

```dart
String numero1 = "   123";
String numero2 = "    45";
String numero3 = "     6";

// Se você quer alinhar à direita, trimLeft remove a indentação
List<String> numeros = [numero1, numero2, numero3]
    .map((n) => n.trimLeft())
    .toList();

for (String n in numeros) {
  print("'$n'");
}
// Output:
// '123'
// '45'
// '6'
```

### Normalizar Lista de Nomes

```dart
List<String> nomes = [
  "   Ana",
  "    Bruno",
  "  Carlos"
];

// Remover espaços iniciais
List<String> nomesNormalizados = nomes
    .map((n) => n.trimLeft())
    .toList();

print(nomesNormalizados);
// Output: [Ana, Bruno, Carlos]
```

---

## Comparação: trim vs trimLeft vs trimRight

| Método | Inicio | Final | Espaços Meio | Exemplo |
|--------|--------|-------|--------------|---------|
| `trim()` | ✓ | ✓ | ✗ | `"  text  ".trim()` → `"text"` |
| `trimLeft()` | ✓ | ✗ | ✗ | `"  text  ".trimLeft()` → `"text  "` |
| `trimRight()` | ✗ | ✓ | ✗ | `"  text  ".trimRight()` → `"  text"` |

---

## Casos Especiais

### Com Tabs

```dart
String comTab = "\t\tTexto";

print("'$comTab'");
print("'${comTab.trimLeft()}'");
// Output:
// '		Texto'
// 'Texto'
```

### Com Quebras de Linha

```dart
String comQuebra = "\n\nTexto";

print("Tem quebras: ${comQuebra.length} caracteres");
print("Após trimLeft: ${comQuebra.trimLeft().length} caracteres");
```

### Múltiplos Espaços

```dart
String multiplos = "     Muitos espaços";

print("'$multiplos'");
print("'${multiplos.trimLeft()}'");
// Output:
// '     Muitos espaços'
// 'Muitos espaços'
```

---

## ✅ Padrões Recomendados

### Limpeza de Indentação

```dart
String removeIndentacao(String texto) {
  List<String> linhas = texto.split("\n");
  return linhas
      .map((l) => l.trimLeft())
      .join("\n");
}

String codigo = """
    void main() {
        print('Hello');
    }
""";

print(removeIndentacao(codigo));
```

### Validação Esquerda

```dart
bool ehValidoEsquerda(String texto) {
  // Deve ter conteúdo após remover espaços à esquerda
  return texto.trimLeft().isNotEmpty;
}

print(ehValidoEsquerda("   Texto"));    // true
print(ehValidoEsquerda("      "));      // false
```

### Processar Linhas

```dart
String processar(String bloco) {
  return bloco
      .split("\n")
      .map((l) => l.trimLeft().trim())  // Remove dos dois lados
      .where((l) => l.isNotEmpty)
      .join("\n");
}

String entrada = """
    Linha 1
      Linha 2
    Linha 3
""";

print(processar(entrada));
```

---

## Quando Usar?

- **Use `trimLeft()`** quando precisar remover espaços apenas à esquerda
- **Use `trimRight()`** quando precisar remover espaços apenas à direita
- **Use `trim()`** quando precisar remover dos dois lados
- **Use `replaceAll()`** quando precisar remover espaços no meio

---

## Ver Também
- [Aula 17: trim](aula17-trim.md) - Remover ambos os lados
- [Aula 19: trimRight](aula19-trimright.md) - Remover espaços à direita
- [Aula 12: replaceAll](aula12-replaceall.md) - Substituir múltiplos espaços

