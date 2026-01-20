# Funções em Dart

Este documento detalha o funcionamento, tipos e aplicações práticas de funções na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é uma Função?](#2-o-que-é-uma-função)
- [3. Sintaxe Básica](#3-sintaxe-básica)
- [4. Tipo de Retorno](#4-tipo-de-retorno)
- [5. Parâmetros](#5-parâmetros)
- [6. Parâmetros Nomeados](#6-parâmetros-nomeados)
- [7. Parâmetros Opcionais](#7-parâmetros-opcionais)
- [8. Valor Padrão](#8-valor-padrão)
- [9. Funções Anônimas (Arrow Functions)](#9-funções-anônimas-arrow-functions)
- [10. Funções de Primeira Classe](#10-funções-de-primeira-classe)
- [11. Casos Práticos](#11-casos-práticos)
- [12. Boas Práticas](#12-boas-práticas)

---

## 1. Introdução

Uma **função** é um bloco de código reutilizável que realiza uma tarefa específica. Funções permitem:

- 📌 Reutilizar código
- 📌 Organizar lógica complexa
- 📌 Facilitar testes
- 📌 Melhorar legibilidade
- 📌 Separar responsabilidades

```dart
// Exemplo básico
int soma(int a, int b) {
  return a + b;
}

void main() {
  print(soma(15, 16)); // Output: 31
}
```

## 2. O que é uma Função?

Uma função é um trecho de código independente que:

- **Recebe** inputs (parâmetros/argumentos)
- **Processa** a lógica
- **Retorna** um resultado (ou void se não retorna nada)

### Anatomia de uma Função

```dart
int          soma      (int a, int b)  {
 ↓           ↓         ↓       ↓ ↓      ↓
tipo_retorno nome      tipo  param   corpo
retornado             param
```

## 3. Sintaxe Básica

### Função com Retorno

```dart
tipo_retorno nomeDaFuncao(tipo parametro1, tipo parametro2) {
  // Lógica da função
  return resultado;
}
```

### Função sem Retorno (void)

```dart
void nomeDaFuncao(tipo parametro1, tipo parametro2) {
  // Lógica da função (não retorna nada)
}
```

## 4. Tipo de Retorno

O tipo de retorno especifica **qual tipo de dado** a função retorna.

### Retorna int

```dart
int soma(int a, int b) {
  return a + b;
}

void main() {
  int resultado = soma(5, 3);
  print(resultado); // 8
}
```

### Retorna String

```dart
String saudacao(String nome) {
  return "Olá, $nome!";
}

void main() {
  print(saudacao("Maria")); // Olá, Maria!
}
```

### Retorna double

```dart
double calcularMedia(double nota1, double nota2) {
  return (nota1 + nota2) / 2;
}

void main() {
  print(calcularMedia(8.0, 9.0)); // 8.5
}
```

### Retorna bool

```dart
bool ehPar(int numero) {
  return numero % 2 == 0;
}

void main() {
  print(ehPar(4));  // true
  print(ehPar(5));  // false
}
```

### Sem Retorno (void)

```dart
void imprimirMensagem(String mensagem) {
  print(mensagem);
  print("Mensagem exibida!");
}

void main() {
  imprimirMensagem("Olá"); // Não retorna nada
}
```

## 5. Parâmetros

Parâmetros são as variáveis que a função recebe.

### Parâmetros Posicionais

```dart
int subtracao(int a, int b) {
  return a - b;
}

void main() {
  print(subtracao(10, 3)); // 7 (ordem importa!)
  print(subtracao(3, 10)); // -7
}
```

### Múltiplos Parâmetros

```dart
void preencherFormulario(String nome, String email, int idade) {
  print("Nome: $nome");
  print("Email: $email");
  print("Idade: $idade");
}

void main() {
  preencherFormulario("João", "joao@email.com", 25);
}
```

## 6. Parâmetros Nomeados

Parâmetros nomeados usam `{}` e podem ser passados em qualquer ordem.

```dart
void preencherFormulario({
  required String nome,
  required String email,
  required int idade,
}) {
  print("Nome: $nome");
  print("Email: $email");
  print("Idade: $idade");
}

void main() {
  // Podem ser passados em qualquer ordem
  preencherFormulario(
    idade: 25,
    nome: "João",
    email: "joao@email.com",
  );
  
  // Ou na ordem original
  preencherFormulario(
    nome: "Maria",
    email: "maria@email.com",
    idade: 30,
  );
}
```

### required vs opcional

```dart
// REQUIRED (obrigatório)
void funcao1({required String nome}) {
  print(nome);
}

// Opcional (pode omitir)
void funcao2({String? nome}) {
  print(nome ?? "Sem nome");
}

void main() {
  funcao1(nome: "João");     // ✅ Obrigatório
  // funcao1();              // ❌ Erro!
  
  funcao2(nome: "Maria");    // ✅ OK
  funcao2();                 // ✅ OK (nome é null)
}
```

## 7. Parâmetros Opcionais

Parâmetros opcionais posicionais usam `[]`.

```dart
String saudacao(String nome, [String? sobrenome]) {
  if (sobrenome != null) {
    return "Olá, $nome $sobrenome!";
  }
  return "Olá, $nome!";
}

void main() {
  print(saudacao("João"));           // Olá, João!
  print(saudacao("João", "Silva"));  // Olá, João Silva!
}
```

## 8. Valor Padrão

Você pode fornecer valores padrão para parâmetros.

### Com Parâmetros Posicionais

```dart
void cumprimento(String nome, [String opcao = "Bem-vindo"]) {
  print("$opcao, $nome!");
}

void main() {
  cumprimento("João");                    // Bem-vindo, João!
  cumprimento("Maria", "Olá");            // Olá, Maria!
}
```

### Com Parâmetros Nomeados

```dart
void criarUsuario({
  required String nome,
  int idade = 18,
  String cidade = "São Paulo",
}) {
  print("Nome: $nome");
  print("Idade: $idade");
  print("Cidade: $cidade");
}

void main() {
  criarUsuario(nome: "João");
  // Output:
  // Nome: João
  // Idade: 18
  // Cidade: São Paulo
  
  criarUsuario(
    nome: "Maria",
    idade: 25,
    cidade: "Rio de Janeiro",
  );
}
```

## 9. Funções Anônimas (Arrow Functions)

Funções sem nome, frequentemente usadas em callbacks.

### Sintaxe Tradicional

```dart
int multiplicar(int a, int b) {
  return a * b;
}
```

### Arrow Function (Uma linha)

```dart
int multiplicar(int a, int b) => a * b;
```

### Função Anônima

```dart
var adicionar = (int a, int b) => a + b;

void main() {
  print(adicionar(5, 3)); // 8
}
```

### Em Callbacks

```dart
void executarOperacao(int a, int b, Function operacao) {
  print(operacao(a, b));
}

void main() {
  // Passando função anônima
  executarOperacao(10, 5, (a, b) => a - b);  // 5
  executarOperacao(10, 5, (a, b) => a + b);  // 15
  executarOperacao(10, 5, (a, b) => a * b);  // 50
}
```

## 10. Funções de Primeira Classe

Em Dart, funções são valores. Você pode:
- Armazenar em variáveis
- Passar como parâmetros
- Retornar de outras funções

### Armazenar em Variável

```dart
var saudacao = (String nome) => "Olá, $nome!";

void main() {
  print(saudacao("João")); // Olá, João!
}
```

### Passar como Parâmetro

```dart
void printName(Function() callback) => callback();

void main() {
  printName(() {
    print("Callback function");
  });
}
```

### Retornar de Função

```dart
Function(int, int) obterOperacao(String tipo) {
  if (tipo == "soma") {
    return (int a, int b) => a + b;
  } else if (tipo == "multiplicacao") {
    return (int a, int b) => a * b;
  }
  return (int a, int b) => 0;
}

void main() {
  var soma = obterOperacao("soma");
  print(soma(5, 3)); // 8
}
```

## 11. Casos Práticos

### Caso 1: Cálculo de Desconto

```dart
double aplicarDesconto(double preco, [double percentual = 10]) {
  return preco - (preco * percentual / 100);
}

void main() {
  print(aplicarDesconto(100));      // 90 (10% padrão)
  print(aplicarDesconto(100, 20));  // 80 (20% customizado)
}
```

### Caso 2: Validação de Email

```dart
bool validarEmail(String email) {
  return email.contains("@") && email.contains(".");
}

void main() {
  print(validarEmail("user@email.com"));   // true
  print(validarEmail("user.email.com"));   // false
}
```

### Caso 3: Classificação de Nota

```dart
String classificarNota(double nota) {
  if (nota >= 9) return "A";
  if (nota >= 8) return "B";
  if (nota >= 7) return "C";
  if (nota >= 6) return "D";
  return "F";
}

void main() {
  print(classificarNota(8.5)); // B
}
```

### Caso 4: Operações com Listas

```dart
int somarLista(List<int> numeros) {
  int total = 0;
  for (int num in numeros) {
    total += num;
  }
  return total;
}

void main() {
  print(somarLista([1, 2, 3, 4, 5])); // 15
}
```

### Caso 5: Função que Retorna Função

```dart
Function(int) multiplicador(int fator) {
  return (int numero) => numero * fator;
}

void main() {
  var vezes2 = multiplicador(2);
  var vezes3 = multiplicador(3);
  
  print(vezes2(5)); // 10
  print(vezes3(5)); // 15
}
```

## 12. Boas Práticas

### ✅ Recomendado

```dart
// Nomes descritivos
int calcularIdadeEmAnos(int anoNascimento) {
  return DateTime.now().year - anoNascimento;
}

// Uma responsabilidade
bool validarEmail(String email) {
  return email.contains("@");
}

// Parâmetros nomeados para clareza
void criarUsuario({
  required String nome,
  required String email,
  int idade = 18,
}) {
  // ...
}

// Usar arrow function para lógica simples
int dobrar(int x) => x * 2;

// Documentação
/// Calcula a soma de dois números.
/// 
/// [a] primeiro número
/// [b] segundo número
/// 
/// Retorna a soma de a e b
int soma(int a, int b) => a + b;
```

### ❌ Evite

```dart
// ❌ Nomes genéricos
void funcao1(int a, int b) {
  // o que esta função faz?
}

// ❌ Múltiplas responsabilidades
void processarDados(String dados) {
  // validar
  // salvar
  // enviar
  // registrar log
  // ... muito código!
}

// ❌ Parâmetros posicionais demais
void criar(String a, String b, int c, String d, bool e, double f) {
  // Difícil de lembrar a ordem
}

// ❌ Lógica complexa em arrow function
var resultado = (a, b) => a > b ? (a % 2 == 0 ? "a é maior e par" : "a é maior e ímpar") : "b é maior";

// ❌ Sem documentação
void funcaoComplexa(List<Map<String, dynamic>> dados) {
  // ?
}
```

## Resumo

| Tipo | Sintaxe | Exemplo |
|:----:|:-------:|:-------:|
| **Com Retorno** | `tipo nome(params) { ... return valor; }` | `int soma(int a, int b) { return a + b; }` |
| **Sem Retorno** | `void nome(params) { ... }` | `void print(String msg) { print(msg); }` |
| **Arrow Function** | `tipo nome(params) => expressão;` | `int dobro(int x) => x * 2;` |
| **Anônima** | `(params) => expressão` | `(a, b) => a + b` |

---

**Veja também:**
- [Funções Síncronas](function-sync.md) - Funções convencionais
- [Funções Assíncronas](function_async.md) - Async/await e Futures