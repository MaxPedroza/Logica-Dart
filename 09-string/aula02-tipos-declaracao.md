# Tipos de Declaração de Strings

## Índice
- [Type Inference com var](#type-inference-com-var)
- [Tipo Explícito String](#tipo-explícito-string)
- [Tipo Object](#tipo-object)
- [Tipo Dynamic](#tipo-dynamic)
- [Comparação de Tipos](#comparação-de-tipos)

---

## Type Inference com var

O Dart pode **inferir automaticamente** que uma variável é String:

```dart
// Tipo inferido automaticamente
var stringVar = "Usando var (tipo inferido)";
print("Exemplo 1 - var: $stringVar");
// Output: Exemplo 1 - var: Usando var (tipo inferido)
```

**Vantagens:**
- ✅ Menos verboso
- ✅ Dart infere o tipo corretamente

**Desvantagens:**
- ❌ Menos explícito

---

## Tipo Explícito String

A forma mais clara e **recomendada** de declarar strings:

```dart
// Tipo explícito (RECOMENDADO)
String stringExplicita = "Tipo explícito String (recomendado)";
print("Exemplo 2 - String: $stringExplicita");
// Output: Exemplo 2 - String: Tipo explícito String (recomendado)
```

**Vantagens:**
- ✅ Claro que é uma string
- ✅ Não pode mudar de tipo depois
- ✅ Seguro com null safety

---

## Tipo Object

Tipo genérico que aceita qualquer valor:

```dart
// Object é genérico
Object stringObject = "Tipo Object (genérico)";
print("Exemplo 3 - Object: $stringObject");
// Output: Exemplo 3 - Object: Tipo Object (genérico)

// Mas depois pode virar outro tipo
Object valor = "texto";
valor = 42;  // Agora é um número!
```

**Desvantagens:**
- ❌ Perde type safety
- ❌ Menos seguro que String

---

## Tipo Dynamic

Tipo dinâmico que permite atribuição de qualquer tipo depois:

```dart
// Dynamic (evitar quando possível)
dynamic stringDynamic = "Tipo dynamic (pode mudar de tipo depois)";
print("Exemplo 4 - dynamic: $stringDynamic");
// Output: Exemplo 4 - dynamic: Tipo dynamic (pode mudar de tipo depois)

// Depois pode virar outro tipo
stringDynamic = 42;
print(stringDynamic);  // Output: 42
```

**Desvantagens:**
- ❌ Não é tipo-seguro
- ❌ Pode causar erros em runtime

---

## Comparação de Tipos

```dart
// 1. Tipo explícito (RECOMENDADO)
String nome1 = "Maria";

// 2. Tipo inferido
var nome2 = "Maria";

// 3. Dinâmico (EVITAR)
dynamic nome3 = "Maria";

// 4. Nullable
String? nome4 = "Maria";

// 5. Object (menos recomendado)
Object nome5 = "Maria";
```

## Tabela Resumida

| Tipo | Segurança | Verbosidade | Flexibilidade | Recomendado |
|------|-----------|-------------|---------------|-------------|
| `String s` | ⭐⭐⭐ Máxima | Média | Nenhuma | ✅ SIM |
| `var s` | ⭐⭐⭐ Alta | Baixa | Pouca | ✅ SIM |
| `dynamic s` | ⭐ Nenhuma | Baixa | Máxima | ❌ NÃO |
| `Object s` | ⭐⭐ Baixa | Média | Média | ⚠️ CUIDADO |
| `String? s` | ⭐⭐⭐ Alta | Média | Com null | ✅ OPCIONAL |

---

## ✅ Boas Práticas

1. **Sempre use `String`** quando souber que é uma string
2. **Use `var`** quando o tipo é óbvio pelo valor
3. **Evite `dynamic`** - use apenas se absolutamente necessário
4. **Não use `Object`** para strings - use `String`
5. **Use `String?`** quando a string pode ser null

