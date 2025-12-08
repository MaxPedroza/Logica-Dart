# Enumerações (Enum) em Dart

Este documento explora o uso de **Enums** em Dart, desde definições simples até recursos avançados como métodos e propriedades.

## Índice

- [1. O que é um Enum?](#1-o-que-é-um-enum)
- [2. Definições Básicas](#2-definições-básicas)
- [3. Enums Avançados: Métodos e Propriedades](#3-enums-avançados-métodos-e-propriedades)
- [4. Manipulação e Uso Prático](#4-manipulação-e-uso-prático)
  - [4.1 Acesso e Iteração](#41-acesso-e-iteração)
  - [4.2 Comparação e Switch Case](#42-comparação-e-switch-case)
  - [4.3 Conversão e Busca (String <-> Enum)](#43-conversão-e-busca-string---enum)
  - [4.4 Métodos e Propriedades do Enum](#44-métodos-e-propriedades-do-enum)
- [5. Funções Auxiliares e Boas Práticas](#5-funções-auxiliares-e-boas-práticas)

## 1. O que é um Enum?

Um **Enum** (enumeração) é um tipo de dado especial que define um conjunto fixo de constantes. É ideal para representar:

- Dias da semana
- Cores
- Status de pedidos
- Níveis de acesso

## 2. Definições Básicas

Abaixo, definimos alguns enums simples para ilustrar o conceito.

```dart
// Define um enum chamado Cor com as cores básicas
enum Cor {
  vermelho, // Representa a cor vermelha
  verde,    // Representa a cor verde
  azul,     // Representa a cor azul
  amarelo,  // Representa a cor amarela
  preto,    // Representa a cor preta
  branco,   // Representa a cor branca
}

// Define um enum para os dias da semana
enum DiaSemana {
  segunda, // Segunda-feira
  terca,   // Terça-feira
  quarta,  // Quarta-feira
  quinta,  // Quinta-feira
  sexta,   // Sexta-feira
  sabado,  // Sábado
  domingo, // Domingo
}

// Define um enum para os status de um pedido
enum StatusPedido {
  pendente,    // Pedido criado mas não processado
  processando, // Pedido em processamento
  enviado,     // Pedido enviado para entrega
  entregue,    // Pedido entregue ao cliente
  cancelado,   // Pedido cancelado
}

// Define um enum para tamanhos de produtos
enum Tamanho {
  pequeno,     // Tamanho pequeno
  medio,       // Tamanho médio
  grande,      // Tamanho grande
  extraGrande, // Tamanho extra grande
}
```

## 3. Enums Avançados: Métodos e Propriedades

Em Dart, enums são classes e podem ter seus próprios métodos e propriedades.

```dart
// Define um enum para níveis de usuário com métodos e propriedades
enum Nivel {
  iniciante,     // Nível inicial
  intermediario, // Nível intermediário
  avancado,      // Nível avançado
  expert,        // Nível expert

  // O ponto e vírgula é necessário para separar os valores dos membros
  ;

  // Getter que retorna um inteiro representando os pontos necessários
  int get pontosNecessarios {
    switch (this) {
      case Nivel.iniciante: return 0;
      case Nivel.intermediario: return 100;
      case Nivel.avancado: return 500;
      case Nivel.expert: return 1000;
    }
  }

  // Getter que retorna uma descrição textual do nível
  String get descricao {
    switch (this) {
      case Nivel.iniciante: return "Você está começando";
      case Nivel.intermediario: return "Você tem experiência básica";
      case Nivel.avancado: return "Você é avançado";
      case Nivel.expert: return "Você é um expert";
    }
  }
}
```

## 4. Manipulação e Uso Prático

A função `main` abaixo demonstra diversas formas de interagir com enums.

### 4.1 Acesso e Iteração

```dart
void main() {
  print("========== USANDO ENUMS SIMPLES ==========\n");

  // Acessar valores
  Cor corFavorita = Cor.azul;
  print("Cor favorita: $corFavorita");
  print("Nome: ${corFavorita.name}");
  print("Índice: ${corFavorita.index}");

  print("\n========== ITERANDO SOBRE VALORES ==========\n");

  // Iterar sobre todos os valores
  for (Cor cor in Cor.values) {
    print("  - $cor (índice: ${cor.index})");
  }
```

### 4.2 Comparação e Switch Case

```dart
  print("\n========== COMPARAÇÃO E SWITCH ==========\n");

  Cor cor1 = Cor.vermelho;
  Cor cor2 = Cor.vermelho;
  print("Iguais? ${cor1 == cor2}"); // true

  DiaSemana dia = DiaSemana.sexta;

  switch (dia) {
    case DiaSemana.segunda:
    case DiaSemana.terca:
    case DiaSemana.quarta:
    case DiaSemana.quinta:
      print("Dia de semana");
      break;
    case DiaSemana.sexta:
      print("Sextou!");
      break;
    case DiaSemana.sabado:
    case DiaSemana.domingo:
      print("Fim de semana");
      break;
  }
```

### 4.3 Conversão e Busca (String <-> Enum)

```dart
  print("\n========== CONVERSÃO E BUSCA ==========\n");

  // String -> Enum
  try {
    Cor azul = Cor.values.byName('azul');
    print("Encontrado: $azul");
  } catch (e) {
    print("Não encontrado");
  }

  // Enum -> String
  print("Nome do status: ${StatusPedido.enviado.name}");
```

### 4.4 Métodos e Propriedades do Enum

```dart
  print("\n========== MÉTODOS DO ENUM ==========\n");

  Nivel nivel = Nivel.expert;
  print("${nivel.name}: ${nivel.descricao} (${nivel.pontosNecessarios} pts)");
}
```

## 5. Funções Auxiliares e Boas Práticas

Exemplos de como usar enums em funções e dicas de boas práticas.

```dart
// Função que descreve o status de um pedido
void descrevePedido(StatusPedido status) {
  switch (status) {
    case StatusPedido.pendente: print("Aguardando...");
    case StatusPedido.processando: print("Processando...");
    case StatusPedido.enviado: print("Enviado!");
    case StatusPedido.entregue: print("Entregue!");
    case StatusPedido.cancelado: print("Cancelado.");
  }
}

// Boas Práticas:
// 1. Use enums para valores fixos conhecidos.
// 2. Prefira switch cases exaustivos.
// 3. Valide strings antes de converter para enum.
```
