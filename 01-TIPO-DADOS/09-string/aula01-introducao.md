# Introdução a Strings

Uma **string** em Dart é uma sequência imutável de caracteres Unicode. As strings são fundamentais em programação e são usadas para:

- 📄 Representar texto e mensagens
- 🔍 Manipular dados textuais
- 📊 Processar e formatar dados
- 🌐 Comunicação com APIs

## O que é uma String?

Uma string é simplesmente um texto - um conjunto de caracteres agrupados. Em Dart, strings são objetos especiais que têm propriedades e métodos integrados.

## Exemplo Básico

```dart
// Criar uma string simples
String mensagem = "Olá, Dart!";
print(mensagem);  // Output: Olá, Dart!

// String com variáveis
String nome = "Maria";
String cumprimento = "Bem-vindo, $nome!";
print(cumprimento);  // Output: Bem-vindo, Maria!
```

## Características Principais

### 1. Imutabilidade
Strings são imutáveis, o que significa que não podem ser alteradas após criação. Qualquer operação em uma string cria uma **nova string**:

```dart
String original = "Dart";
String maiuscula = original.toUpperCase();

print(original);   // Output: Dart (não mudou)
print(maiuscula);  // Output: DART (nova string)
```

### 2. Unicode
Strings em Dart suportam Unicode, permitindo caracteres especiais e emojis:

```dart
String emoji = "🚀 Flutter é incrível! 🎯";
print(emoji);  // Output: 🚀 Flutter é incrível! 🎯

String acentuado = "São Paulo, Brasília, Recife";
print(acentuado);  // Output: São Paulo, Brasília, Recife
```

### 3. Sequência Indexada
Cada caractere tem uma posição (índice) começando do 0:

```dart
String palavra = "Dart";
// Índices:  0=D, 1=a, 2=r, 3=t

print(palavra[0]);  // Output: D
print(palavra[1]);  // Output: a
```

## Aspas Simples vs Duplas

Em Dart, você pode usar aspas simples (`'`) ou duplas (`"`). **Não há diferença funcional**:

```dart
// Aspas duplas
String nome = "João Silva";

// Aspas simples
String cidade = 'São Paulo';

// Ambas são strings válidas e idênticas
print(nome == "João Silva");   // Output: true
print(cidade == 'São Paulo');  // Output: true
```

## Por Que Strings são Importantes?

Em praticamente toda aplicação você precisará:

1. **Exibir informações** - texto na tela
2. **Processar entrada** - ler dados do usuário
3. **Comunicar com APIs** - enviar e receber dados
4. **Formatar saída** - preparar dados para exibição
5. **Validar dados** - verificar se dados estão corretos
6. **Manipular URLs** - trabalhar com endereços web

---

**Próximo:** Veja os outros arquivos de documentação para aprender sobre propriedades e métodos específicos!
