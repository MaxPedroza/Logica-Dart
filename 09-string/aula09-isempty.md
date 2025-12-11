# isEmpty - Verificação de String Vazia

## Índice
- [Propriedade isEmpty](#propriedade-isempty)
- [Usando isEmpty](#usando-isempty)
- [Casos de Uso](#casos-de-uso)

---

## Propriedade isEmpty

Verifica se uma string está vazia (sem caracteres):

### Sintaxe

```dart
bool isEmpty = minhaString.isEmpty;
```

### Características

- **Retorna:** `true` se vazia, `false` se contém caracteres
- **Não contabiliza:** espaços em branco vazios como vazios
- **Complexidade:** O(1) - verificação rápida

---

## Usando isEmpty

### Verificação Simples

```dart
String texto1 = "";
String texto2 = "Olá";
String texto3 = "   ";  // Contém espaços

print("Texto 1 é vazio? ${texto1.isEmpty}");     // true
print("Texto 2 é vazio? ${texto2.isEmpty}");     // false
print("Texto 3 é vazio? ${texto3.isEmpty}");     // false (tem espaços)
```

### Validação em Condições

```dart
String entrada = "";

if (entrada.isEmpty) {
  print("Campo obrigatório!");
} else {
  print("Campo preenchido: $entrada");
}
// Output: Campo obrigatório!
```

### Filtro em Listas

```dart
List<String> palavras = ["", "Dart", "", "Flutter", ""];

// Remover strings vazias
List<String> palavrasValidas = palavras.where((p) => !p.isEmpty).toList();
print("Palavras válidas: $palavrasValidas");
// Output: Palavras válidas: [Dart, Flutter]
```

---

## Casos de Uso

### Validação de Formulário

```dart
String nome = "";
String email = "";

bool formularioValido = nome.isNotEmpty && email.isNotEmpty;

if (formularioValido) {
  print("Formulário válido!");
} else {
  print("Preencha todos os campos!");
}
// Output: Preencha todos os campos!
```

### Conversão de Valores

```dart
String resultado = "";

if (resultado.isEmpty) {
  resultado = "Valor padrão";
}

print("Resultado: $resultado");
// Output: Resultado: Valor padrão
```

### Verificação de Arquivo

```dart
String conteudo = "";

if (conteudo.isEmpty) {
  print("Arquivo vazio ou não encontrado");
} else {
  print("Arquivo contém dados");
}
// Output: Arquivo vazio ou não encontrado
```

### Limpeza de Dados

```dart
List<String> nomes = ["Ana", "", "Bruno", "", "Carlos", ""];

// Contar vazias
int vazias = nomes.where((n) => n.isEmpty).length;
print("Nomes vazios: $vazias");
// Output: Nomes vazios: 3
```

---

## Tabela Resumida

| Verificação | Resultado | Exemplo |
|-------------|-----------|---------|
| `"".isEmpty` | `true` | String vazia |
| `"Olá".isEmpty` | `false` | Com conteúdo |
| `"   ".isEmpty` | `false` | Espaços não contam |
| `" ".isEmpty` | `false` | Um espaço não é vazio |

---

## ⚠️ Importante

Não confunda com `isBlank` (que não existe nativamente em Dart):

```dart
String comEspacos = "   ";

// isEmpty retorna false (tem espaços)
print(comEspacos.isEmpty);  // false

// Para verificar se tem apenas espaços, use trim()
print(comEspacos.trim().isEmpty);  // true
```

---

## Ver Também
- [Aula 07: Length](aula07-length.md) - Verificar tamanho
- [Aula 10: isNotEmpty](aula10-isnotempty.md) - Oposto de isEmpty
- [Aula 17: Trim](aula17-trim.md) - Remover espaços

