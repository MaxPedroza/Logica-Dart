# replaceFirst - Substituição da Primeira Ocorrência

## Índice
- [Método replaceFirst()](#método-replacefirst)
- [Usando replaceFirst()](#usando-replacefirst)
- [Casos de Uso](#casos-de-uso)

---

## Método replaceFirst()

Substitui apenas a PRIMEIRA ocorrência de um padrão:

### Sintaxe

```dart
String resultado = minhaString.replaceFirst(padrao, substituicao);
```

### Parâmetros

- **padrao:** O texto a encontrar (primeira ocorrência)
- **substituicao:** O texto que substituirá

### Características

- **Retorna:** Nova string com primeira substituição
- **Original:** Não modifica a string original
- **Ocorrências:** Substitui apenas a primeira
- **Suporta:** Strings ou expressões regulares

---

## Usando replaceFirst()

### Substituição Simples

```dart
String texto = "Dart é bom, muito bom, muito muito bom";

String resultado = texto.replaceFirst("bom", "ótimo");
print("Original: $texto");
print("Resultado: $resultado");
// Output:
// Original: Dart é bom, muito bom, muito muito bom
// Resultado: Dart é ótimo, muito bom, muito muito bom
```

### Primeira Palavra

```dart
String frase = "O Python é ótimo e Python é popular";

String resultado = frase.replaceFirst("Python", "Dart");
print(resultado);
// Output: O Dart é ótimo e Python é popular
```

### Corrigir Primeiro Erro

```dart
String mensagem = "Você tem um erro, um erro grave";

String corrigido = mensagem.replaceFirst("erro", "problema");
print(corrigido);
// Output: Você tem um problema, um erro grave
```

---

## Casos de Uso

### Edição de Documento

```dart
String documento = "Versão 1.0 (primeira versão) - Versão 1.0 é estável";

// Corrigir primeira versão
String resultado = documento.replaceFirst("Versão 1.0", "Versão 1.1");
print(resultado);
// Output: Versão 1.1 (primeira versão) - Versão 1.0 é estável
```

### Log de Eventos

```dart
String log = "ERRO: conexão perdida, ERRO: timeout, ERRO: falha";

// Tratou o primeiro erro
String resultado = log.replaceFirst("ERRO:", "✓ RESOLVIDO:");
print(resultado);
// Output: ✓ RESOLVIDO: conexão perdida, ERRO: timeout, ERRO: falha
```

### Renomear Arquivo

```dart
String caminho = "dados/backup/dados_v1/dados_v1_final.txt";

// Trocar primeira ocorrência de "dados"
String novo = caminho.replaceFirst("dados", "arquivos");
print(novo);
// Output: arquivos/backup/dados_v1/dados_v1_final.txt
```

### Editar Código

```dart
String codigo = "var x = 10; var y = 20; var z = 30;";

// Trocar primeira declaração
String resultado = codigo.replaceFirst("var", "int");
print(resultado);
// Output: int x = 10; var y = 20; var z = 30;
```

### Resposta a Consulta

```dart
String consulta = "Procuro Dart, também quero saber sobre Dart, Dart é bom?";

String resposta = consulta.replaceFirst(
  "Procuro Dart",
  "Encontrei Dart"
);
print(resposta);
// Output: Encontrei Dart, também quero saber sobre Dart, Dart é bom?
```

### Apenas Primeira Menção

```dart
List<String> mencoes = [
  "João gosta de futebol",
  "João joga futebol",
  "João é bom em futebol"
];

// Destacar primeiro "João"
List<String> resultado = mencoes.map((m) {
  return m.replaceFirst("João", "🏆 João");
}).toList();

for (String r in resultado) {
  print(r);
}
// Output:
// 🏆 João gosta de futebol
// 🏆 João joga futebol
// 🏆 João é bom em futebol
```

---

## Expressões Regulares

### Substituição com Padrão

```dart
String texto = "123 ABC 456 DEF 789 GHI";

// Substituir primeiro número
String resultado = texto.replaceFirst(RegExp(r'\d+'), "NUM");
print(resultado);
// Output: NUM ABC 456 DEF 789 GHI
```

### Remover Primeira Tag

```dart
String html = "<div>Conteúdo</div><div>Outro</div>";

// Remove primeira tag
String resultado = html.replaceFirst(RegExp(r'<[^>]+>'), "");
print(resultado);
// Output: Conteúdo</div><div>Outro</div>
```

---

## Comparação: replaceFirst vs replaceAll

| Método | Primeira | Todas | Exemplo |
|--------|----------|-------|---------|
| `replaceFirst()` | ✓ | ✗ | `"aaa".replaceFirst("a", "b")` → `"baa"` |
| `replaceAll()` | ✗ | ✓ | `"aaa".replaceAll("a", "b")` → `"bbb"` |

---

## ✅ Padrões Recomendados

### Processa um Item de Cada Vez

```dart
String tarefas = "[ ] Tarefa 1\n[ ] Tarefa 2\n[ ] Tarefa 3";

// Marcar primeira como concluída
String resultado = tarefas.replaceFirst("[ ]", "[x]");
print(resultado);
// Output:
// [x] Tarefa 1
// [ ] Tarefa 2
// [ ] Tarefa 3
```

### Substituir Apenas Primeira Instância

```dart
String texto = "gato gato gato";

// Apenas o primeiro "gato"
String resultado = texto.replaceFirst("gato", "felino");
print(resultado);
// Output: felino gato gato
```

### Com Validação

```dart
String titulo = "Dart Flutter Dart";

if (titulo.contains("Dart")) {
  String novo = titulo.replaceFirst("Dart", "Go");
  print(novo);
} else {
  print("Não contém 'Dart'");
}
// Output: Go Flutter Dart
```

---

## Ver Também
- [Aula 12: replaceAll](aula12-replaceall.md) - Substituir todas
- [Aula 14: replaceRange](aula14-replacerange.md) - Substituir intervalo
- [Aula 11: contains](aula11-contains.md) - Verificar conteúdo

