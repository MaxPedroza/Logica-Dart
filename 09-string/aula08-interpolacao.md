# Interpolação de Strings

## Índice
- [Interpolação Simples](#interpolação-simples)
- [Interpolação com Expressões](#interpolação-com-expressões)
- [Interpolação vs Concatenação](#interpolação-vs-concatenação)

---

## Interpolação Simples

Inserir variáveis e expressões dentro de strings usando `$variavel`:

### Forma 1: `$variavel`

```dart
String nome = "Maria";
int idadeEx8 = 30;

// Interpolação simples
String mensagem1 = "Meu nome é $nome e tenho $idadeEx8 anos";
print("Exemplo 1: $mensagem1");
// Output: Exemplo 1: Meu nome é Maria e tenho 30 anos
```

### Múltiplas Interpolações

```dart
String primeiro = "João";
String segundo = "Silva";
String cidade = "São Paulo";

String apresentacao = "$primeiro $segundo mora em $cidade";
print(apresentacao);
// Output: João Silva mora em São Paulo
```

---

## Interpolação com Expressões

### Forma 2: `${expressão}`

Para expressões mais complexas, use `${}`:

```dart
int anoAtual = 2024;
int anoNascimento = 1994;

String mensagem2 = "Nasci em $anoNascimento e em ${anoAtual - anoNascimento} anos terei ${anoAtual + 10} anos";
print("Exemplo 2: $mensagem2");
// Output: Exemplo 2: Nasci em 1994 e em 30 anos terei 2034 anos
```

### Chamada de Métodos

```dart
String fruta = "banana";

String mensagem3 = "Gosto de ${fruta.toUpperCase()}";
print("Exemplo 3: $mensagem3");
// Output: Exemplo 3: Gosto de BANANA
```

### Interpolação Complexa

```dart
String nome4 = "João";
String sobrenome4 = "Silva";
String email = "joao.silva@email.com";

String apresentacao = "Olá, meu nome é ${nome4.toUpperCase()} ${sobrenome4.toUpperCase()}, meu email é $email";
print("Exemplo 4: $apresentacao");
// Output: Olá, meu nome é JOÃO SILVA, meu email é joao.silva@email.com
```

---

## Interpolação vs Concatenação

### Concatenação com `+` (Não Recomendado)

```dart
String nome = "Maria";
int idade = 30;

// ❌ Concatenação (verboso)
String resultado1 = "Nome: " + nome + ", Idade: " + idade.toString();
print(resultado1);
```

**Problemas:**
- ❌ Verboso
- ❌ Números precisam de `.toString()`
- ❌ Menos legível
- ❌ Mais lento

### Interpolação (Recomendado)

```dart
String nome = "Maria";
int idade = 30;

// ✅ Interpolação (simples)
String resultado2 = "Nome: $nome, Idade: $idade";
print(resultado2);
```

**Vantagens:**
- ✅ Mais conciso
- ✅ Números automaticamente convertidos
- ✅ Muito mais legível
- ✅ Melhor performance

---

## Exemplos Práticos

### Exercício Prático

```dart
String exercicio8nome = "Lucas";
int exercicio8idade = 25;
String exercicio8mensagem = "Oi, sou $exercicio8nome e tenho $exercicio8idade anos";
print("Exercício 8: $exercicio8mensagem");
// Output: Exercício 8: Oi, sou Lucas e tenho 25 anos
```

### Formatação de Preço

```dart
String produto = "Notebook";
double preco = 3500.50;

String resultado = "Produto: $produto - Preço: R$ $preco";
print(resultado);
// Output: Produto: Notebook - Preço: R$ 3500.5
```

### Cálculo em Interpolação

```dart
int quantidade = 5;
double precoUnitario = 25.00;

String resultado = "Comprando $quantidade itens a R$ $precoUnitario cada = R$ ${quantidade * precoUnitario}";
print(resultado);
// Output: Comprando 5 itens a R$ 25.0 cada = R$ 125.0
```

### Operação Ternária

```dart
int idade = 25;

String resultado = "Você é ${idade >= 18 ? "maior de idade" : "menor de idade"}";
print(resultado);
// Output: Você é maior de idade
```

---

## Tabela Resumida

| Tipo | Sintaxe | Exemplo |
|------|---------|---------|
| Variável simples | `$var` | `"Olá, $nome"` |
| Expressão | `${expr}` | `"Total: ${10 + 20}"` |
| Método | `${var.método()}` | `"${texto.toUpperCase()}"` |
| Ternária | `${cond ? a : b}` | `"${idade >= 18 ? 'sim' : 'não'}"` |
| Cálculo | `${expr}` | `"${a * b}"` |

---

## ✅ Boas Práticas

1. **Sempre prefira interpolação** sobre concatenação com `+`
2. **Use `$var`** para variáveis simples
3. **Use `${expr}`** para expressões complexas
4. **Evite `+`** para strings
5. **Mantenha legibilidade** com espaçamento

