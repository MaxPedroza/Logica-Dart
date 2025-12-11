# Concatenação de Strings

## Índice
- [Operador +](#operador-)
- [Interpolação (Recomendado)](#interpolação-recomendado)
- [Comparação](#comparação)
- [Exemplos Práticos](#exemplos-práticos)

---

## Operador +

Usar o operador `+` para unir strings:

```dart
// Exemplo 1: Concatenação simples
String primeiroNome = "Max";
String sobrenome = "Pedroza";
String nomeCompleto = primeiroNome + " " + sobrenome;
print("Exemplo 1 (operador +): $nomeCompleto");
// Output: Exemplo 1 (operador +): Max Pedroza

// Exemplo 2: Concatenação com múltiplas strings
String saudacao = "Olá, ";
String pessoa = "João";
String mensagem = saudacao + pessoa + "!";
print("Exemplo 2: $mensagem");
// Output: Exemplo 2: Olá, João!

// Exemplo 3: Concatenação com números (requer .toString())
String texto = "Tenho ";
int idade = 25;
String frase = texto + idade.toString() + " anos";
print("Exemplo 3 (com número): $frase");
// Output: Exemplo 3 (com número): Tenho 25 anos
```

---

## Interpolação (Recomendado)

**✅ PREFIRA SEMPRE INTERPOLAÇÃO** sobre concatenação com `+`:

```dart
String primeiroNome = "Max";
String sobrenome = "Pedroza";
int idade = 25;

// ✅ RECOMENDADO - Mais simples
String resultado = "$primeiroNome $sobrenome tem $idade anos";
print(resultado);
// Output: Max Pedroza tem 25 anos

// Com expressões
String resultado2 = "$primeiroNome $sobrenome tem ${idade + 5} anos daqui a 5 anos";
print(resultado2);
// Output: Max Pedroza tem 30 anos daqui a 5 anos
```

---

## Comparação

### Com Operador `+` (Não Recomendado)

```dart
String nome = "Maria";
int idade = 30;

// ❌ VERBOSO
String texto1 = "Nome: " + nome + ", Idade: " + idade.toString();
print(texto1);
```

**Problemas:**
- ❌ Números precisam de `.toString()`
- ❌ Menos legível
- ❌ Mais difícil de manter
- ❌ Mais lento (cria múltiplas strings)

### Com Interpolação `$` (Recomendado)

```dart
String nome = "Maria";
int idade = 30;

// ✅ SIMPLES
String texto2 = "Nome: $nome, Idade: $idade";
print(texto2);
```

**Vantagens:**
- ✅ Mais conciso
- ✅ Números automaticamente convertidos
- ✅ Muito mais legível
- ✅ Melhor performance

---

## Exemplos Práticos

### Exemplo 1: Dados de Compra

```dart
String produto = "Notebook";
double preco = 3500.50;
int quantidade = 2;

// ❌ Com +
String resultado1 = "Produto: " + produto + ", Preço: R$ " + preco.toString() + ", Quantidade: " + quantidade.toString();

// ✅ Com interpolação
String resultado2 = "Produto: $produto, Preço: R$ $preco, Quantidade: $quantidade";

print(resultado2);
// Output: Produto: Notebook, Preço: R$ 3500.5, Quantidade: 2
```

### Exemplo 2: Mensagem Personalizada

```dart
String meuPrimeiroNome = "João";
String meuSobrenome = "Silva";
String meuNomeCompleto = meuPrimeiroNome + " " + meuSobrenome;
print("Exercício 4: $meuNomeCompleto");
// Output: Exercício 4: João Silva
```

### Exemplo 3: URL com Parâmetros

```dart
String baseUrl = "https://api.example.com";
String endpoint = "users";
String userId = "123";

// ✅ Recomendado
String url = "$baseUrl/$endpoint/$userId";
print(url);
// Output: https://api.example.com/users/123
```

---

## ✅ Boas Práticas

1. **Prefira `$variavel`** em vez de `+` para concatenar
2. **Use `${expressão}`** para expressões complexas
3. **Evite `+`** para strings (use `$` ao invés)
4. **Mantenha legibilidade** com espaçamento
5. **Use StringBuffer** para múltiplas concatenações em loop

---

## Tabela de Comparação

| Aspecto | Operador `+` | Interpolação `$` |
|---------|--------------|------------------|
| Legibilidade | ⭐⭐ | ⭐⭐⭐ |
| Performance | ⭐⭐ | ⭐⭐⭐ |
| Simplicidade | ⭐⭐ | ⭐⭐⭐ |
| Necessidade de `.toString()` | Sim | Não |

