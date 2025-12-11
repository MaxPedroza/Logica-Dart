# isNotEmpty - Verificação de String com Conteúdo

## Índice
- [Propriedade isNotEmpty](#propriedade-isnotempty)
- [Usando isNotEmpty](#usando-isnotempty)
- [Casos de Uso](#casos-de-uso)

---

## Propriedade isNotEmpty

Verifica se uma string contém pelo menos um caractere:

### Sintaxe

```dart
bool temConteudo = minhaString.isNotEmpty;
```

### Características

- **Retorna:** `true` se contém caracteres, `false` se vazia
- **Oposto de:** `isEmpty`
- **Rápido:** O(1) - verificação instantânea
- **Não verifica:** espaços em branco (espaços contam como conteúdo)

---

## Usando isNotEmpty

### Verificação Simples

```dart
String nome1 = "Maria";
String nome2 = "";
String nome3 = "   ";

print("Nome 1 tem conteúdo? ${nome1.isNotEmpty}");  // true
print("Nome 2 tem conteúdo? ${nome2.isNotEmpty}");  // false
print("Nome 3 tem conteúdo? ${nome3.isNotEmpty}");  // true (tem espaços)
```

### Validação em Condições

```dart
String input = "João Silva";

if (input.isNotEmpty) {
  print("Olá, $input!");
} else {
  print("Por favor, insira um nome");
}
// Output: Olá, João Silva!
```

### Processamento Seguro

```dart
String mensagem = "Novo evento";

if (mensagem.isNotEmpty) {
  print("Enviando notificação: $mensagem");
  // ... código para processar
} else {
  print("Mensagem vazia, ignora");
}
// Output: Enviando notificação: Novo evento
```

---

## Casos de Uso

### Validação de Entrada

```dart
String email = "user@email.com";
String senha = "";

if (email.isNotEmpty && senha.isNotEmpty) {
  print("Pode fazer login");
} else {
  print("Preencha email e senha");
}
// Output: Preencha email e senha
```

### Filtro de Comentários

```dart
List<String> comentarios = ["Ótimo!", "", "Não gostei", "", "Amei!"];

// Mostrar apenas comentários com conteúdo
List<String> comentariosValidos = comentarios
    .where((c) => c.isNotEmpty)
    .toList();

print("Comentários: $comentariosValidos");
// Output: Comentários: [Ótimo!, Não gostei, Amei!]
```

### Construção de URL

```dart
String dominio = "example.com";
String caminho = "api/usuarios";

if (dominio.isNotEmpty && caminho.isNotEmpty) {
  String url = "https://$dominio/$caminho";
  print("URL: $url");
} else {
  print("Dados incompletos");
}
// Output: URL: https://example.com/api/usuarios
```

### Adição Condicional

```dart
String titulo = "Meu Produto";
String descricao = "";

String resultado = titulo;
if (descricao.isNotEmpty) {
  resultado += " - $descricao";
}

print(resultado);
// Output: Meu Produto
```

### Busca e Filtro

```dart
List<String> usuarios = ["Ana", "", "Bruno", "", "Carlos"];

// Contar usuários válidos
int usuariosValidos = usuarios.where((u) => u.isNotEmpty).length;
print("Usuários cadastrados: $usuariosValidos");
// Output: Usuários cadastrados: 3
```

---

## Tabela Comparativa

| Propriedade | `""` | `"Texto"` | `"   "` |
|-------------|------|----------|---------|
| `.isEmpty` | `true` | `false` | `false` |
| `.isNotEmpty` | `false` | `true` | `true` |

---

## ✅ Padrões Recomendados

### Alternativa com Operador Ternário

```dart
String status = "Processando";
String mensagem = status.isNotEmpty 
    ? "Status: $status" 
    : "Sem status";

print(mensagem);
// Output: Status: Processando
```

### Validação Dupla

```dart
String nome = "Maria";

// Verifica se não é vazio E não é só espaços
if (nome.isNotEmpty && nome.trim().isNotEmpty) {
  print("Nome válido: $nome");
} else {
  print("Nome inválido");
}
// Output: Nome válido: Maria
```

### Operador `??` com isNotEmpty

```dart
String? entrada;
String padrao = "Sem valor";

String resultado = (entrada?.isNotEmpty ?? false) ? entrada! : padrao;
print(resultado);
// Output: Sem valor
```

---

## ⚠️ Cuidado com Espaços

```dart
String apenasEspacos = "     ";

print(apenasEspacos.isNotEmpty);           // true (tem caracteres)
print(apenasEspacos.trim().isNotEmpty);    // false (sem conteúdo)
```

---

## Ver Também
- [Aula 09: isEmpty](aula09-isempty.md) - Oposto de isNotEmpty
- [Aula 17: Trim](aula17-trim.md) - Remover espaços
- [Aula 07: Length](aula07-length.md) - Tamanho da string

