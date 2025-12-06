# 🧠 Lógica Essencial e Programação com Dart


---

## 🌟 Visão Geral do Curso

Este repositório é o material prático do curso **Lógica Essencial e Programação com Dart**.

Ele foi criado para construir uma ponte sólida entre a **Lógica Formal/Acadêmica** e sua **Aplicação Prática em Dart**, a linguagem por trás do Flutter. Ao final, você terá um raciocínio mais robusto para escrever códigos mais previsíveis e eficientes.

### 🎯 Para Quem é Este Curso?

* **Iniciantes:** Pessoas que precisam de uma introdução estruturada aos tipos de dados e estruturas de controle do Dart.
* **Desenvolvedores:** Programadores que desejam formalizar seu entendimento sobre operadores lógicos e estruturas de decisão.
* **Estudantes:** Quem busca ver os conceitos de Lógica em ação, longe de apenas exercícios de papel.

---

## 🗺️ Roteiro e Estrutura do Repositório

O conteúdo está organizado de forma sequencial, garantindo que a base do Dart seja sólida antes de avançar para a Lógica Aplicada.

### 📚 Módulos de Fundamentos (Dart Básico)

Estas pastas cobrem os tipos de dados e conceitos básicos que formam as "premissas" do seu código:

| Pasta | Tópico | Relevância Lógica |
| :--- | :--- | :--- |
| `01-helloWorld` | Sintaxe Inicial | O ponto de partida de qualquer argumento. |
| `02-variable` | Variáveis e Tipos | A definição de termos e entidades. |
| `03-bool` | **Booleano** | O fundamento da Lógica: Verdadeiro ou Falso. |
| `04-Int`, `05-double` | Tipos Numéricos | Operações e Conjuntos. |
| `06-duration`, `07-datetime` | Tipos de Tempo | Lógica de Sequência e Intervalos. |
| `08-enum` | Tipos Enumerados | Lógica de Conjuntos Fixos e Exclusivos. |

### ✨ Módulo Central: Lógica Proposicional Aplicada

Aqui, a lógica formal é traduzida diretamente para as decisões que o seu código toma.

| Arquivo/Pasta | Conceito Formal | Implementação em Dart |
| :--- | :--- | :--- |
| `logica_and.dart` | **Conjunção** ($\land$) | Operador `&&` (E) |
| `logica_or.dart` | **Disjunção** ($\lor$) | Operador `||` (OU) |
| `condicional.dart` | **Implicação** ($\to$) | Estrutura `if/else` |
| `ternario.dart` | **Implicação Curta** | Expressão Condicional Ternária (`? :`) |
| `switch_case.dart` | **Decisão Múltipla** | Estrutura `switch` |
| **`logic` (Pasta)** | **Lógica em Profundidade** | Implementações avançadas de conceitos formais. |

### 🛠️ Tópicos Avançados e Estruturas

Estruturas complexas que dependem de uma lógica interna refinada:

* `functions`: Modularidade e Regras de Escopo.
* `list`, `set`, `map`: Lógica de Organização e Acesso de Dados.
* `loop`: Lógica de **Repetição** e Iteração.
* `nullsafety`: Lógica de Tratamento de Incertezas.
* `poo`: **Programação Orientada a Objetos** (Classes, Herança).

---

## 💻 Requisitos e Como Executar

* **Pré-requisito:** **Dart SDK** (versão 3.x ou superior).
* **Editor:** Recomenda-se VS Code com a extensão Dart.

1.  **Clone o Repositório:**
    ```bash
    git clone https://github.com/MaxPedroza/Logica-Dart.git
    cd Logica-Dart
    ```

2.  **Execute um Exemplo:**
    Você pode executar qualquer arquivo `.dart` usando o comando `dart run`.

    ```bash
    # Exemplo de um conceito fundamental:
    dart run 03-bool/main.dart 
    
    # Exemplo de lógica aplicada:
    dart run logica_and.dart
    ```

---


* [**MaxPedroza**]([https://github.com/MaxPedroza])