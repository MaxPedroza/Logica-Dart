# replaceRange - Substituição de Intervalo

## Índice
- [Método replaceRange()](#método-replacerange)
- [Usando replaceRange()](#usando-replacerange)
- [Casos de Uso](#casos-de-uso)

---

## Método replaceRange()

Substitui um intervalo específico de caracteres:

### Sintaxe

```dart
String resultado = minhaString.replaceRange(inicio, fim, novoTexto);
```

### Parâmetros

- **inicio:** Índice do primeiro caractere (inclusivo)
- **fim:** Índice do último caractere (exclusivo)
- **novoTexto:** Texto que substituirá o intervalo

### Características

- **Retorna:** Nova string com substituição
- **Original:** Não modifica a string original
- **Intervalo:** [inicio, fim) - fim não incluído
- **Flexível:** Pode remover ou adicionar caracteres

---

## Usando replaceRange()

### Substituição Simples

```dart
String texto = "Hello World";

// Substituir "World" (índices 6 a 11)
String resultado = texto.replaceRange(6, 11, "Dart");
print("Original: $texto");
print("Resultado: $resultado");
// Output:
// Original: Hello World
// Resultado: Hello Dart
```

### Remover Caracteres

```dart
String texto = "JavaScript";

// Remover "Script" (indices 4 a 10)
String resultado = texto.replaceRange(4, 10, "");
print("Original: $texto");
print("Resultado: $resultado");
// Output:
// Original: JavaScript
// Resultado: Java
```

### Inserir Caracteres

```dart
String texto = "Dart";

// Inserir espaço no índice 4
String resultado = texto.replaceRange(4, 4, " Language");
print("Resultado: $resultado");
// Output: Resultado: Dart Language
```

### Substituir no Meio

```dart
String email = "user@example.com";

// Trocar domínio (índices 5 a 12)
String resultado = email.replaceRange(5, 12, "gmail");
print("Original: $email");
print("Resultado: $resultado");
// Output:
// Original: user@example.com
// Resultado: user@gmail.com
```

---

## Casos de Uso

### Editar Telefone

```dart
String telefone = "(11) 98765-4321";

// Alterar DDD - trocar "(11)" por "(21)"
String novo = telefone.replaceRange(0, 4, "(21)");
print("Original: $telefone");
print("Novo: $novo");
// Output:
// Original: (11) 98765-4321
// Novo: (21) 98765-4321
```

### Corrigir Data

```dart
String data = "25/13/2024";  // Mês inválido

// Corrigir mês (índices 3 a 5)
String corrigida = data.replaceRange(3, 5, "12");
print("Original: $data");
print("Corrigida: $corrigida");
// Output:
// Original: 25/13/2024
// Corrigida: 25/12/2024
```

### Censurar Palavra

```dart
String texto = "Este é um texto com uma palavra ruim aqui";

// Encontrar índice da palavra
int inicio = texto.indexOf("ruim");
int fim = inicio + 4;

// Censurar
String censurado = texto.replaceRange(inicio, fim, "****");
print(censurado);
// Output: Este é um texto com uma palavra **** aqui
```

### Capitalizar Primeira Letra

```dart
String nome = "joão";

// Trocar primeira letra por maiúscula (índice 0 a 1)
String capitalizado = nome.replaceRange(0, 1, "J");
print("Original: $nome");
print("Capitalizado: $capitalizado");
// Output:
// Original: joão
// Capitalizado: João
```

### Editar Caminho

```dart
String caminho = "/usuario/documentos/arquivo.txt";

// Trocar pasta (índices 1 a 8)
String novo = caminho.replaceRange(1, 8, "admin");
print("Original: $caminho");
print("Novo: $novo");
// Output:
// Original: /usuario/documentos/arquivo.txt
// Novo: /admin/documentos/arquivo.txt
```

### Substituir Padrão Específico

```dart
String codigo = "var x = 10; var y = 20;";

// Trocar primeiro "var" (índices 0 a 3)
String novo = codigo.replaceRange(0, 3, "int");
print(novo);
// Output: int x = 10; var y = 20;
```

---

## Encontrar Índices

### Usando indexOf

```dart
String texto = "Dart é uma linguagem";
String palavra = "linguagem";

int inicio = texto.indexOf(palavra);
int fim = inicio + palavra.length;

String resultado = texto.replaceRange(inicio, fim, "linguagem de programação");
print(resultado);
// Output: Dart é uma linguagem de programação
```

---

## Tabela de Exemplos

| Texto | replaceRange | Resultado |
|------|--------------|-----------|
| `"Hello"` | `(0, 5, "Hi")` | `"Hi"` |
| `"Dart"` | `(4, 4, "!")` | `"Dart!"` |
| `"Test"` | `(0, 1, "B")` | `"Best"` |
| `"Remove"` | `(2, 5, "")` | `"Reove"` |

---

## ✅ Padrões Recomendados

### Função Auxiliar

```dart
String substituirIntervalo(String texto, int inicio, int fim, String novo) {
  if (inicio < 0 || fim > texto.length || inicio > fim) {
    return texto;  // Validação
  }
  return texto.replaceRange(inicio, fim, novo);
}

String resultado = substituirIntervalo("Hello World", 6, 11, "Dart");
print(resultado);
// Output: Hello Dart
```

### Com Busca

```dart
String editar(String texto, String buscar, String novo) {
  int inicio = texto.indexOf(buscar);
  if (inicio == -1) return texto;  // Não encontrado
  
  int fim = inicio + buscar.length;
  return texto.replaceRange(inicio, fim, novo);
}

print(editar("Olá mundo", "mundo", "Dart"));
// Output: Olá Dart
```

### Validação de Índices

```dart
String texto = "Dart";

try {
  // Validar antes de usar
  int inicio = 1;
  int fim = 10;  // Fora do intervalo
  
  if (fim > texto.length) {
    print("Índice 'fim' fora do intervalo");
  } else {
    String resultado = texto.replaceRange(inicio, fim, "X");
    print(resultado);
  }
} catch (e) {
  print("Erro: $e");
}
// Output: Índice 'fim' fora do intervalo
```

---

## Ver Também
- [Aula 12: replaceAll](aula12-replaceall.md) - Substituir todas
- [Aula 13: replaceFirst](aula13-replacefirst.md) - Substituir primeira
- [Aula 05: substring](aula05-substring.md) - Extrair intervalo

