# trimRight - Remoção de Espaços à Direita

## Índice
- [Método trimRight()](#método-trimright)
- [Usando trimRight()](#usando-trimright)
- [Casos de Uso](#casos-de-uso)

---

## Método trimRight()

Remove espaços em branco apenas do final (lado direito) da string:

### Sintaxe

```dart
String resultado = minhaString.trimRight();
```

### Características

- **Retorna:** Nova string sem espaços no final
- **Remove:** Espaços, tabs, quebras de linha (apenas final)
- **Não remove:** Espaços no início
- **Original:** Não modifica a string original

---

## Usando trimRight()

### Remoção Simples

```dart
String texto1 = "  Olá  ";
String texto2 = "Dart\t";
String texto3 = "Flutter   ";

print("'${texto1.trimRight()}'");     // '  Olá'
print("'${texto2.trimRight()}'");     // 'Dart'
print("'${texto3.trimRight()}'");     // 'Flutter'
```

### Visualizar Diferença

```dart
String original = "   espaço direita   ";

print("Original: '${original}'");               // '   espaço direita   '
print("trimRight(): '${original.trimRight()}'");// '   espaço direita'
print("trim(): '${original.trim()}'");          // 'espaço direita'
```

### Manter Espaço à Esquerda

```dart
String indentado = "    código indentado    ";

String resultado = indentado.trimRight();
print("'$resultado'");  // '    código indentado'
```

---

## Casos de Uso

### Limpeza de Linhas de Arquivo

```dart
List<String> linhas = [
  "Primeira linha     ",
  "Segunda linha   ",
  "Terceira linha        "
];

// Remover espaços finais
List<String> linhasLimpas = linhas
    .map((l) => l.trimRight())
    .toList();

for (String linha in linhasLimpas) {
  print("'$linha'");
}
// Output:
// 'Primeira linha'
// 'Segunda linha'
// 'Terceira linha'
```

### Normalizar Entrada de Usuário

```dart
String entrada = "João Silva     ";

String normalizada = entrada.trimRight();
print("Entrada: '$entrada'");
print("Normalizada: '$normalizada'");
// Output:
// Entrada: 'João Silva     '
// Normalizada: 'João Silva'
```

### Formatação de Campo

```dart
String email = "usuario@email.com    ";

String emailLimpo = email.trimRight();
print("Email: '$emailLimpo'");
// Output: Email: 'usuario@email.com'
```

### Comparação de Strings

```dart
String str1 = "Dart   ";
String str2 = "Dart";

// Sem trim, são diferentes
print(str1 == str2);  // false

// Com trimRight, são iguais
print(str1.trimRight() == str2);  // true
```

### Processamento de CSV

```dart
String linhaCSV = "João , Silva , 30 ";

List<String> campos = linhaCSV
    .split(",")
    .map((c) => c.trim())  // Remove dos dois lados
    .toList();

print(campos);
// Output: [João, Silva, 30]
```

### Limpeza de Buffer

```dart
String bufferDados = "Dados importantes     \n";

String resultado = bufferDados.trimRight();
print("Buffer limpo: '$resultado'");
// Output: Buffer limpo: 'Dados importantes'
```

### Validação de Linha

```dart
String linha = "print('Hello')    ";

if (linha.trimRight().endsWith(")")) {
  print("Linha bem formada");
} else {
  print("Linha incompleta");
}
// Output: Linha bem formada
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
String comTab = "Texto\t\t";

print("'$comTab'");
print("'${comTab.trimRight()}'");
// Output:
// 'Texto		'
// 'Texto'
```

### Com Quebras de Linha

```dart
String comQuebra = "Texto\n\n";

print("Antes: ${comQuebra.length} caracteres");
print("Depois: ${comQuebra.trimRight().length} caracteres");
```

### Múltiplos Espaços

```dart
String multiplos = "Múltiplos espaços     ";

print("'$multiplos'");
print("'${multiplos.trimRight()}'");
// Output:
// 'Múltiplos espaços     '
// 'Múltiplos espaços'
```

---

## ✅ Padrões Recomendados

### Função de Limpeza

```dart
String limpador(String texto) {
  return texto
      .trimRight()      // Remove espaços finais
      .replaceAll(RegExp(r'\s+$'), '');  // Força remoção
}

print(limpador("Texto    "));
// Output: Texto
```

### Processamento de Arquivo

```dart
List<String> processarArquivo(List<String> linhas) {
  return linhas
      .map((l) => l.trimRight())
      .where((l) => l.isNotEmpty)
      .toList();
}

List<String> arquivo = [
  "Linha 1     ",
  "Linha 2   ",
  "     ",
  "Linha 3        "
];

print(processarArquivo(arquivo));
// Output: [Linha 1, Linha 2, Linha 3]
```

### Validação Segura

```dart
bool validar(String texto) {
  String limpo = texto.trimRight();
  return limpo.isNotEmpty && limpo.length > 2;
}

print(validar("OK     "));   // true
print(validar("X      "));   // false
print(validar("       "));   // false
```

### Preservar Indentação

```dart
String preservarIndentacao(String linha) {
  // Remove espaços finais mas mantém iniciais
  return linha.trimRight();
}

String codigo = "    if (true)     ";
print("'${preservarIndentacao(codigo)}'");
// Output: '    if (true)'
```

---

## Quando Usar?

- **Use `trimRight()`** quando precisar remover espaços apenas à direita
- **Use `trimLeft()`** quando precisar remover espaços apenas à esquerda
- **Use `trim()`** quando precisar remover dos dois lados
- **Combine com outras funções** para validação complexa

---

## Ver Também
- [Aula 17: trim](aula17-trim.md) - Remover ambos os lados
- [Aula 18: trimLeft](aula18-trimleft.md) - Remover espaços à esquerda
- [Aula 09: isEmpty](aula09-isempty.md) - Verificar vazio

