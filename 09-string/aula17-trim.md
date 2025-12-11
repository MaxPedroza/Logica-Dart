# trim - Remoção de Espaços em Branco

## Índice
- [Método trim()](#método-trim)
- [Usando trim()](#usando-trim)
- [Casos de Uso](#casos-de-uso)

---

## Método trim()

Remove espaços em branco do início e final da string:

### Sintaxe

```dart
String resultado = minhaString.trim();
```

### Características

- **Retorna:** Nova string sem espaços nas extremidades
- **Remove:** Espaços, tabs, quebras de linha
- **Não remove:** Espaços no meio do texto
- **Original:** Não modifica a string original

---

## Usando trim()

### Remoção Simples

```dart
String texto1 = "  Olá  ";
String texto2 = "\nDart\t";
String texto3 = "  Flutter  ";

print("'${texto1.trim()}'");   // 'Olá'
print("'${texto2.trim()}'");   // 'Dart'
print("'${texto3.trim()}'");   // 'Flutter'
```

### Visualizar Diferença

```dart
String original = "   texto   ";

print("Original: '${original}'");        // '   texto   '
print("Com trim: '${original.trim()}'"); // 'texto'
```

### Validação de Entrada

```dart
String entrada = "  João Silva  ";

if (entrada.trim().isNotEmpty) {
  print("Olá, ${entrada.trim()}!");
} else {
  print("Por favor, insira um nome");
}
// Output: Olá, João Silva!
```

---

## Casos de Uso

### Limpeza de Formulário

```dart
String email = "   usuario@email.com   ";
String senha = "  senha123  ";

String emailLimpo = email.trim();
String senhaLimpa = senha.trim();

print("Email: '$emailLimpo'");
print("Senha: '$senhaLimpa'");
// Output:
// Email: 'usuario@email.com'
// Senha: 'senha123'
```

### Processamento de Arquivo

```dart
List<String> linhas = [
  "  linha 1  ",
  "  linha 2  ",
  "  linha 3  "
];

// Limpar todas as linhas
List<String> linhasLimpas = linhas.map((l) => l.trim()).toList();

for (String linha in linhasLimpas) {
  print("'$linha'");
}
// Output:
// 'linha 1'
// 'linha 2'
// 'linha 3'
```

### Validação de Valor

```dart
String valor = "   ";

if (valor.trim().isEmpty) {
  print("Campo vazio!");
} else {
  print("Campo preenchido: ${valor.trim()}");
}
// Output: Campo vazio!
```

### Normalização de Dados

```dart
List<String> nomes = [
  "  Ana  ",
  "  Bruno  ",
  "  Carlos  "
];

// Normalizar todos
List<String> nomesPuros = nomes.map((n) => n.trim()).toList();

print(nomesPuros);
// Output: [Ana, Bruno, Carlos]
```

### Busca Corrigida

```dart
String busca = "  dart flutter  ";

String buscaPura = busca.trim();
print("Procurando por: '$buscaPura'");
// Output: Procurando por: 'dart flutter'
```

### Limpeza de CSV

```dart
String linhaCSV = " João , Silva , 30 ";

List<String> campos = linhaCSV
    .split(",")
    .map((c) => c.trim())
    .toList();

print(campos);
// Output: [João, Silva, 30]
```

### Validação com Trim

```dart
String entrada = "   ";

// ❌ Errado - apenas isEmpty
if (entrada.isEmpty) {
  print("Não executa!");  // Não executa, pois tem espaços
}

// ✅ Correto - com trim
if (entrada.trim().isEmpty) {
  print("Campo realmente vazio!");  // Executa
}
// Output: Campo realmente vazio!
```

---

## Diferença entre trim, trimLeft, trimRight

| Método | Inicio | Final | Exemplo |
|--------|--------|-------|---------|
| `trim()` | ✓ | ✓ | `"  text  ".trim()` → `"text"` |
| `trimLeft()` | ✓ | ✗ | `"  text  ".trimLeft()` → `"text  "` |
| `trimRight()` | ✗ | ✓ | `"  text  ".trimRight()` → `"  text"` |

---

## Casos de Espaçamento

### Espaços no Meio

```dart
String texto = "Olá   mundo";

// trim() NÃO remove espaços no meio
print("'${texto.trim()}'");  // 'Olá   mundo'

// Para remover múltiplos espaços, use replaceAll
String limpo = texto.replaceAll(RegExp(r'\s+'), ' ');
print("'$limpo'");  // 'Olá mundo'
```

### Tabs e Quebras de Linha

```dart
String texto = "\tOlá\n";

print("Com caracteres especiais: '$texto'");
print("Após trim: '${texto.trim()}'");
// Output:
// Com caracteres especiais: '	Olá
// '
// Após trim: 'Olá'
```

---

## ✅ Padrões Recomendados

### Validação Segura

```dart
bool ehValido(String entrada) {
  String trimado = entrada.trim();
  return trimado.isNotEmpty && trimado.length >= 3;
}

print(ehValido("  João  "));    // true
print(ehValido("  ab  "));      // false
print(ehValido("     "));       // false
```

### Limpeza e Processamento

```dart
List<String> processar(List<String> dados) {
  return dados
      .map((d) => d.trim())
      .where((d) => d.isNotEmpty)
      .toList();
}

List<String> entrada = ["  Ana  ", "  ", "  Bruno  ", "", "  Carlos  "];
print(processar(entrada));
// Output: [Ana, Bruno, Carlos]
```

### Com Capitalização

```dart
String formatar(String texto) {
  String trimado = texto.trim();
  if (trimado.isEmpty) return "";
  
  return trimado[0].toUpperCase() + trimado.substring(1).toLowerCase();
}

print(formatar("  joÃo silva  "));
// Output: João silva
```

### Função Auxiliar

```dart
String sanitizar(String entrada) {
  return entrada
      .trim()
      .replaceAll(RegExp(r'\s+'), ' ');  // Múltiplos espaços → um
}

print(sanitizar("  texto   com    espaços  "));
// Output: texto com espaços
```

---

## Ver Também
- [Aula 18: trimLeft](aula18-trimleft.md) - Remover espaços à esquerda
- [Aula 19: trimRight](aula19-trimright.md) - Remover espaços à direita
- [Aula 09: isEmpty](aula09-isempty.md) - Verificar vazio

