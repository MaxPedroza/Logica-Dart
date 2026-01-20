# Switch/Case em Dart

Este documento detalha o funcionamento, sintaxes e aplicações práticas da estrutura switch/case na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é Switch/Case?](#2-o-que-é-switchcase)
- [3. Sintaxe Básica](#3-sintaxe-básica)
- [4. Como Funciona](#4-como-funciona)
- [5. Exemplos Básicos](#5-exemplos-básicos)
- [6. Break e Default](#6-break-e-default)
- [7. Fall-Through (Casos Múltiplos)](#7-fall-through-casos-múltiplos)
- [8. Switch com Diferentes Tipos](#8-switch-com-diferentes-tipos)
- [9. Casos Práticos](#9-casos-práticos)
- [10. Switch vs If/Else](#10-switch-vs-ifelse)
- [11. Boas Práticas](#11-boas-práticas)

---

## 1. Introdução

A estrutura **Switch/Case** é usada para executar **diferentes blocos de código** baseado em **diferentes valores** de uma variável. É especialmente útil quando você tem **muitas opções exclusivas** baseadas em um valor específico.

```dart
void main() {
  var indexMonth = 3;
  String month;

  switch (indexMonth) {
    case 1:
      month = "Janeiro";
      break;
    case 2:
      month = "Fevereiro";
      break;
    default:
      month = "VALOR INVÁLIDO";
  }
  print(month); // Output: Março
}
```

## 2. O que é Switch/Case?

Switch/Case permite selecionar **um entre vários caminhos** baseado no **valor de uma expressão**:

- **SWITCH** → A variável que será testada
- **CASE** → Um valor específico a ser comparado
- **BREAK** → Sai do switch (importante!)
- **DEFAULT** → O que fazer se nenhum case corresponder

### Características

- 📌 Compara uma variável com múltiplos valores
- 📌 Mais legível que múltiplos if/else if para muitas opções
- 📌 Requer `break` para sair do bloco
- 📌 Suporta `default` como alternativa padrão

## 3. Sintaxe Básica

```dart
switch (expressão) {
  case valor1:
    // Código se expressão == valor1
    break;
  
  case valor2:
    // Código se expressão == valor2
    break;
  
  case valor3:
    // Código se expressão == valor3
    break;
  
  default:
    // Código se nenhum case corresponder
}
```

## 4. Como Funciona

1. A **expressão** é avaliada uma única vez
2. O valor é **comparado com cada case** de cima para baixo
3. Quando encontra um **match**, executa o código daquele case
4. Continua executando até encontrar um **`break`** ou o fim do switch
5. Se nenhum case corresponder, executa o **`default`** (se existir)

### Fluxo Visual

```
entrada → switch(valor)
    ↓
case 1? → Não → case 2? → Não → case 3? → Não → default?
    ↓ Sim         ↓ Sim         ↓ Sim         ↓ Sim
  execute      execute      execute      execute
    ↓             ↓             ↓             ↓
  break         break         break       (fim)
    ↓             ↓             ↓
    └─────────────┴─────────────┴─→ saída
```

## 5. Exemplos Básicos

### Exemplo 1: Meses do Ano

```dart
int mes = 3;
String nomeMes;

switch (mes) {
  case 1:
    nomeMes = "Janeiro";
    break;
  case 2:
    nomeMes = "Fevereiro";
    break;
  case 3:
    nomeMes = "Março";
    break;
  case 4:
    nomeMes = "Abril";
    break;
  case 5:
    nomeMes = "Maio";
    break;
  case 6:
    nomeMes = "Junho";
    break;
  default:
    nomeMes = "Mês inválido";
}

print(nomeMes); // Output: Março
```

### Exemplo 2: Dias da Semana

```dart
String diaDaSemana = "segunda";
String tipo;

switch (diaDaSemana) {
  case "segunda":
  case "terça":
  case "quarta":
  case "quinta":
  case "sexta":
    tipo = "Dia útil";
    break;
  case "sábado":
  case "domingo":
    tipo = "Fim de semana";
    break;
  default:
    tipo = "Dia inválido";
}

print(tipo); // Output: Dia útil
```

## 6. Break e Default

### Break

O `break` é **obrigatório** para sair do switch. Sem ele, o código continua executando os próximos cases (Fall-Through).

```dart
int numero = 1;

switch (numero) {
  case 1:
    print("Um");
    break; // Sem isso, executaria também o case 2
  case 2:
    print("Dois");
    break;
}
```

### Default

O `default` é executado se **nenhum case corresponder**. É opcional mas recomendado:

```dart
String status = "desconhecido";

switch (status) {
  case "ativo":
    print("Sistema ativo");
    break;
  case "inativo":
    print("Sistema inativo");
    break;
  default:
    print("Status não reconhecido");
}
// Output: Status não reconhecido
```

## 7. Fall-Through (Casos Múltiplos)

Você pode usar a mesma ação para múltiplos values:

```dart
int dia = 6;

switch (dia) {
  case 1:
  case 2:
  case 3:
  case 4:
  case 5:
    print("Dia útil");
    break;
  case 6:
  case 7:
    print("Fim de semana");
    break;
  default:
    print("Dia inválido");
}
// Output: Fim de semana
```

## 8. Switch com Diferentes Tipos

Switch funciona com vários tipos de dados:

### Com Strings

```dart
String cor = "azul";

switch (cor) {
  case "vermelho":
    print("Parar");
    break;
  case "amarelo":
    print("Atenção");
    break;
  case "verde":
    print("Seguir");
    break;
  default:
    print("Cor desconhecida");
}
```

### Com Enums

```dart
enum Status { ativo, inativo, bloqueado }

Status statusUsuario = Status.ativo;

switch (statusUsuario) {
  case Status.ativo:
    print("Usuário pode acessar");
    break;
  case Status.inativo:
    print("Usuário deve reativar");
    break;
  case Status.bloqueado:
    print("Acesso bloqueado");
    break;
}
```

## 9. Casos Práticos

### Caso 1: Sistema de Permissões

```dart
String role = "editor";

switch (role) {
  case "admin":
    print("Acesso total: ler, escrever, deletar");
    break;
  case "editor":
    print("Acesso: ler, escrever");
    break;
  case "viewer":
    print("Acesso: ler");
    break;
  default:
    print("Role desconhecido");
}
// Output: Acesso: ler, escrever
```

### Caso 2: Processador de Comandos

```dart
String comando = "salvar";

switch (comando) {
  case "salvar":
    print("Salvando arquivo...");
    break;
  case "abrir":
    print("Abrindo arquivo...");
    break;
  case "fechar":
    print("Fechando arquivo...");
    break;
  case "sair":
    print("Encerrando aplicação...");
    break;
  default:
    print("Comando desconhecido");
}
```

### Caso 3: Classificação de Erro HTTP

```dart
int codigoErro = 404;
String mensagem;

switch (codigoErro) {
  case 400:
    mensagem = "Requisição inválida";
    break;
  case 401:
    mensagem = "Não autorizado";
    break;
  case 403:
    mensagem = "Acesso proibido";
    break;
  case 404:
    mensagem = "Não encontrado";
    break;
  case 500:
    mensagem = "Erro interno do servidor";
    break;
  default:
    mensagem = "Erro desconhecido";
}

print("$codigoErro - $mensagem");
// Output: 404 - Não encontrado
```

### Caso 4: Processador de Operações Matemáticas

```dart
double a = 10;
double b = 5;
String operacao = "*";
double resultado;

switch (operacao) {
  case "+":
    resultado = a + b;
    break;
  case "-":
    resultado = a - b;
    break;
  case "*":
    resultado = a * b;
    break;
  case "/":
    if (b != 0) {
      resultado = a / b;
    } else {
      print("Erro: divisão por zero");
      return;
    }
    break;
  default:
    print("Operação desconhecida");
    return;
}

print("$a $operacao $b = $resultado");
// Output: 10 * 5 = 50
```

### Caso 5: Processador de Tipo de Arquivo

```dart
String extensao = "pdf";

switch (extensao) {
  case "jpg":
  case "png":
  case "gif":
    print("Abrindo visualizador de imagens");
    break;
  case "doc":
  case "docx":
    print("Abrindo editor de texto");
    break;
  case "pdf":
    print("Abrindo leitor de PDF");
    break;
  case "mp3":
  case "wav":
    print("Abrindo player de áudio");
    break;
  default:
    print("Tipo de arquivo desconhecido");
}
```

## 10. Switch vs If/Else

| Aspecto | Switch | If/Else |
|:-------:|:-----:|:------:|
| **Melhor para** | Múltiplas opções exclusivas baseadas em **um valor** | Condições **complexas** e **diferentes** |
| **Legibilidade** | Mais clara para muitas opções | Mais clara para poucas opções |
| **Tipos Suportados** | int, String, enum, bool | Qualquer expressão booleana |
| **Exemplo** | Mês (1-12) | idade >= 18 && temRenda |

### Quando Usar Each

**Prefira Switch quando:**
```dart
// ✅ Múltiplas opções baseadas em UM valor
switch (mes) {
  case 1: // Janeiro
  case 2: // Fevereiro
  case 3: // Março
  // ...
}
```

**Prefira If/Else quando:**
```dart
// ✅ Condições complexas e diferentes
if ((idade >= 18) && (temRenda > 1000)) {
  print("Pode pedir empréstimo");
} else if (idade >= 16) {
  print("Pode trabalhar");
} else {
  print("Menor de idade");
}
```

## 11. Boas Práticas

### ✅ Recomendado

```dart
// Sempre use break
switch (valor) {
  case 1:
    print("Um");
    break; // IMPORTANTE!
  default:
    print("Outro");
}

// Sempre inclua default
switch (cor) {
  case "vermelho":
    print("Parar");
    break;
  case "verde":
    print("Seguir");
    break;
  default: // ✅ Sempre inclua!
    print("Cor desconhecida");
}

// Use para múltiplas opções simples
switch (diaSemana) {
  case "seg": case "ter": case "qua": case "qui": case "sex":
    print("Dia útil");
    break;
  case "sab": case "dom":
    print("Fim de semana");
    break;
}
```

### ❌ Evite

```dart
// ERRO: Esquecer break (Fall-Through não intencional)
switch (numero) {
  case 1:
    print("Um"); // vai executar também o case 2!
  case 2:
    print("Dois");
    break;
}

// ERRO: Falta de default para casos desconhecidos
switch (status) {
  case "ativo":
    break;
  case "inativo":
    break;
  // E se for outro valor?
}

// ERRO: Lógica complexa em case
switch (valor) {
  case 1 + 2: // Sintaxe inválida em Dart
    print("Três");
    break;
}
```

## Resumo

- 📌 Use **Switch** para múltiplas opções baseadas em **um valor**
- 📌 Sempre use **`break`** para sair do switch
- 📌 Sempre inclua **`default`** para casos não previstos
- 📌 Use **fall-through** (`case` sem `break`) para múltiplos valores com a mesma ação
- 📌 Switch é mais legível que vários if/else para muitas opções

---

**Veja também:**
- [Condicional IF/ELSE](condicional.md) - Estruturas de decisão
- [Operador Ternário (`? :`))](ternario.md) - Versão compacta para duas opções
- [Operador AND (`&&`)](../02-OPERADORES-DE-LOGICA/logica_and.md) - Combinando condições
- [Operador OR (`||`)](../02-OPERADORES-DE-LOGICA/logica_or.md) - Alternativas