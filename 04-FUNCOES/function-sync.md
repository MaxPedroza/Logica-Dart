# Funções Síncronas em Dart

Este documento detalha o funcionamento e aplicações práticas de funções síncronas na linguagem Dart.

## Índice

- [1. Introdução](#1-introdução)
- [2. O que é Função Síncrona?](#2-o-que-é-função-síncrona)
- [3. Sintaxe Básica](#3-sintaxe-básica)
- [4. Exemplos Simples](#4-exemplos-simples)
- [5. Funções Síncronas vs Assíncronas](#5-funções-síncronas-vs-assíncronas)
- [6. Callbacks Síncronos](#6-callbacks-síncronos)
- [7. Tratamento de Erros](#7-tratamento-de-erros)
- [8. Casos Práticos](#8-casos-práticos)
- [9. Boas Práticas](#9-boas-práticas)

---

## 1. Introdução

Uma **função síncrona** é aquela que **executa de forma sequencial**, linha por linha, bloqueando o código seguinte até que termine completamente.

```dart
int soma(int a, int b) {
  return a + b;
}

void main() {
  print(soma(15, 16)); // Output: 31
}
```

## 2. O que é Função Síncrona?

Funções síncronas executam **imediatamente** e **bloqueiam** a execução até completarem:

- 📌 Execução **sequencial** e **previsível**
- 📌 Retorna resultado **imediatamente**
- 📌 Código **após** a chamada espera a função terminar
- 📌 Mais simples e fácil de entender
- 📌 ⚠️ Pode congelar a UI se for muito lenta

### Fluxo de Execução

```
main()
  ↓
chamar funcao()
  ↓
esperando...
  ↓
funcao() completa
  ↓
retorna resultado
  ↓
continua main()
```

## 3. Sintaxe Básica

```dart
tipo_retorno nomeFuncao(parametros) {
  // Lógica síncrona
  // Executa linha por linha
  return resultado;
}
```

### Exemplo Básico

```dart
int calcular(int a, int b) {
  int resultado = a + b;
  print("Calculando...");
  return resultado;
}

void main() {
  print("Antes");
  int valor = calcular(5, 3);
  print("Resultado: $valor");
  print("Depois");
}

// Output:
// Antes
// Calculando...
// Resultado: 8
// Depois
```

## 4. Exemplos Simples

### Exemplo 1: Operações Matemáticas

```dart
int soma(int a, int b) {
  return a + b;
}

void main() {
  print(soma(15, 16)); // 31
}
```

### Exemplo 2: Processamento de String

```dart
String formatarNome(String nome) {
  return nome.toUpperCase().trim();
}

void main() {
  String resultado = formatarNome("  joão silva  ");
  print(resultado); // JOÃO SILVA
}
```

### Exemplo 3: Validação

```dart
bool ehMaiorDeIdade(int idade) {
  return idade >= 18;
}

void main() {
  print(ehMaiorDeIdade(20)); // true
  print(ehMaiorDeIdade(15)); // false
}
```

### Exemplo 4: Com Múltiplos Passos

```dart
double calcularIMC(double peso, double altura) {
  double imc = peso / (altura * altura);
  return imc;
}

void main() {
  double meuIMC = calcularIMC(70, 1.75);
  print("Seu IMC: ${meuIMC.toStringAsFixed(2)}"); // Seu IMC: 22.86
}
```

## 5. Funções Síncronas vs Assíncronas

### Síncrona (Bloqueante)

```dart
String buscarDado() {
  // Simula uma operação demorada
  for (int i = 0; i < 1000000; i++) {
    // processando...
  }
  return "Dado carregado";
}

void main() {
  print("Inicio");
  String dado = buscarDado(); // Bloqueia aqui!
  print(dado);
  print("Fim");
}

// Output (tudo em ordem):
// Inicio
// Dado carregado
// Fim
```

### Assíncrona (Não-bloqueante)

```dart
Future<String> buscarDadoAsync() async {
  // Simula uma operação demorada
  await Future.delayed(Duration(seconds: 2));
  return "Dado carregado";
}

Future<void> main() async {
  print("Inicio");
  String dado = await buscarDadoAsync(); // Não bloqueia a UI
  print(dado);
  print("Fim");
}

// Output (não-bloqueante):
// Inicio
// (aguarda 2 segundos)
// Dado carregado
// Fim
```

## 6. Callbacks Síncronos

Funções como parâmetros que são executadas sincronamente.

```dart
void executarOperacao(int a, int b, Function(int, int) callback) {
  int resultado = callback(a, b);
  print("Resultado: $resultado");
}

void main() {
  executarOperacao(10, 5, (a, b) => a + b);      // 15
  executarOperacao(10, 5, (a, b) => a - b);      // 5
  executarOperacao(10, 5, (a, b) => a * b);      // 50
}
```

## 7. Tratamento de Erros

Funções síncronas podem lançar exceções que devem ser tratadas.

### Try/Catch

```dart
int dividir(int a, int b) {
  if (b == 0) {
    throw Exception("Divisão por zero!");
  }
  return a ~/ b;
}

void main() {
  try {
    print(dividir(10, 2));  // 5
    print(dividir(10, 0));  // Lança exceção
  } catch (e) {
    print("Erro: $e");
  }
}

// Output:
// 5
// Erro: Exception: Divisão por zero!
```

### Validação Preventiva

```dart
int calcularDesconto(double preco, [double percentual = 10]) {
  if (preco <= 0) {
    throw ArgumentError("Preço deve ser maior que 0");
  }
  if (percentual < 0 || percentual > 100) {
    throw ArgumentError("Percentual deve estar entre 0 e 100");
  }
  return (preco * (100 - percentual) / 100).toInt();
}

void main() {
  try {
    print(calcularDesconto(100));     // 90
    print(calcularDesconto(100, 25)); // 75
    print(calcularDesconto(-50));     // Erro!
  } catch (e) {
    print("Erro: $e");
  }
}
```

## 8. Casos Práticos

### Caso 1: Conversor de Temperatura

```dart
double celsiusParaFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitParaCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

void main() {
  print(celsiusParaFahrenheit(25));  // 77
  print(fahrenheitParaCelsius(77));  // 25
}
```

### Caso 2: Gerador de Senha

```dart
String gerarSenha(int comprimento) {
  const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  String senha = "";
  for (int i = 0; i < comprimento; i++) {
    senha += chars[(i * 7) % chars.length];
  }
  return senha;
}

void main() {
  print(gerarSenha(10)); // Gera uma senha
}
```

### Caso 3: Cálculo de Fatorial

```dart
int fatorial(int n) {
  if (n <= 1) return 1;
  return n * fatorial(n - 1);
}

void main() {
  print(fatorial(5)); // 120
}
```

### Caso 4: Verificador de Palindromo

```dart
bool ehPalindromo(String texto) {
  String limpo = texto.replaceAll(" ", "").toLowerCase();
  String invertido = limpo.split('').reversed.join('');
  return limpo == invertido;
}

void main() {
  print(ehPalindromo("arara"));        // true
  print(ehPalindromo("hello"));        // false
  print(ehPalindromo("a man a plan a canal panama")); // true
}
```

### Caso 5: Calculadora de Idade Exata

```dart
Map<String, int> calcularIdade(DateTime dataNascimento) {
  DateTime hoje = DateTime.now();
  int anos = hoje.year - dataNascimento.year;
  int meses = hoje.month - dataNascimento.month;
  int dias = hoje.day - dataNascimento.day;
  
  if (dias < 0) {
    meses--;
    dias += 30;
  }
  if (meses < 0) {
    anos--;
    meses += 12;
  }
  
  return {
    'anos': anos,
    'meses': meses,
    'dias': dias,
  };
}

void main() {
  DateTime nascimento = DateTime(2000, 5, 15);
  Map resultado = calcularIdade(nascimento);
  print("${resultado['anos']} anos, ${resultado['meses']} meses, ${resultado['dias']} dias");
}
```

## 9. Boas Práticas

### ✅ Recomendado

```dart
// Funções simples e diretas
int somar(int a, int b) => a + b;

// Com documentação
/// Calcula o quadrado de um número.
/// 
/// Recebe um número inteiro e retorna seu quadrado.
int quadrado(int numero) => numero * numero;

// Nomes descritivos
bool validarEmail(String email) {
  return email.contains("@") && email.contains(".");
}

// Tratamento de erros
String extrairNome(String nomeCompleto) {
  if (nomeCompleto.isEmpty) {
    throw ArgumentError("Nome não pode ser vazio");
  }
  return nomeCompleto.split(" ").first;
}

// Usar para operações rápidas
void processar() {
  print("Processando...");
  // operação rápida
}
```

### ❌ Evite

```dart
// ❌ Funções muito lentas e síncronas (congela UI)
void buscarDadosDoServidor() {
  // Requisição HTTP bloqueante
  // Isso travaria a aplicação!
}

// ❌ Sem tratamento de erros
void dividir(int a, int b) {
  return a / b; // E se b == 0?
}

// ❌ Nomes genéricos
void funcao1(int x, int y) {
  return x + y;
}

// ❌ Múltiplas responsabilidades
void processar(String dados) {
  // validar dados
  // salvar em banco
  // enviar para API
  // registrar log
  // muito código!
}

// ❌ Sem documentação em funções públicas
void metodoComplexa(List dados) {
  // ?
}
```

## Resumo

| Característica | Síncrona | Assíncrona |
|:--------------:|:--------:|:----------:|
| **Execução** | Sequencial, bloqueante | Não-bloqueante |
| **Retorno** | Imediato | Future/Promise |
| **Syntax** | `tipo nome() { ... }` | `Future<tipo> nome() async { ... }` |
| **Melhor para** | Operações rápidas | Operações demoradas (I/O, rede) |

---

**Veja também:**
- [Funções Assíncronas](function_async.md) - Async/await e Futures
- [Funções](function.md) - Conceitos gerais de funções