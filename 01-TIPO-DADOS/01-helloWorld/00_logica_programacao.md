# Lógica de Programação

A Lógica de Programação é a base fundamental para qualquer desenvolvedor. Antes de aprender a sintaxe de uma linguagem específica (como Dart, C# ou Python), é necessário entender **como pensar** como um programador. É a técnica de encadear pensamentos para atingir determinado objetivo.

---

## Índice

1. [O que é Lógica de Programação?](#o-que-é-lógica-de-programação)
2. [O que é um Algoritmo?](#o-que-é-um-algoritmo)
3. [Variáveis e Dados](#variáveis-e-dados)
4. [Estruturas de Decisão (Condicionais)](#estruturas-de-decisão-condicionais)
5. [Estruturas de Repetição (Loops)](#estruturas-de-repetição-loops)
6. [Funções e Modularização](#funções-e-modularização)
7. [Fluxogramas](#fluxogramas)
8. [Conclusão](#conclusão)

---

## O que é Lógica de Programação?

Lógica de programação é a organização coesa de uma sequência de instruções voltadas à resolução de um problema. É o "idioma" que usamos para estruturar a solução antes de traduzi-la para uma linguagem de programação que o computador entenda.

O computador não é inteligente; ele é apenas extremamente rápido e obediente. Ele fará exatamente o que você mandar, nem mais, nem menos. A lógica é a habilidade de dar essas ordens na sequência correta.

---

## O que é um Algoritmo?

Um algoritmo é uma **sequência finita de passos bem definidos** para realizar uma tarefa ou resolver um problema.

O exemplo clássico é uma **receita de bolo**:

1.  Separe os ingredientes.
2.  Quebre os ovos.
3.  Misture a farinha.
4.  Se a massa estiver dura, adicione leite.
5.  Leve ao forno por 40 minutos.

Na programação, todo software é um conjunto de algoritmos complexos trabalhando juntos.

### Exemplo de Algoritmo (Trocar uma lâmpada):

1.  Pegar uma escada.
2.  Posicionar a escada embaixo da lâmpada.
3.  Subir na escada.
4.  A lâmpada está quente?
    - **Se sim:** Esperar esfriar.
    - **Se não:** Prosseguir.
5.  Desenroscar a lâmpada queimada.
6.  Enroscar a lâmpada nova.
7.  Descer da escada.
8.  Testar o interruptor.

---

## Variáveis e Dados

Para processar informações, o computador precisa armazená-las na memória. Damos nomes a esses espaços de memória chamando-os de **Variáveis**.

Imagine uma variável como uma **caixa com uma etiqueta**.

- A etiqueta é o **nome** da variável.
- O conteúdo da caixa é o **valor**.
- O tipo de caixa define o que cabe dentro (**tipo de dado**).

### Tipos de Dados Comuns:

- **Texto (String):** "Olá", "João", "Rua 10".
- **Inteiro (Int):** 10, -5, 0, 2025.
- **Decimal (Double/Float):** 10.5, 3.14, -0.01.
- **Booleano (Bool):** Verdadeiro (True) ou Falso (False).

---

## Estruturas de Decisão (Condicionais)

Os algoritmos não são lineares o tempo todo. Frequentemente precisamos tomar decisões baseadas em condições. É o famoso "SE... ENTÃO... SENÃO".

Na vida real:

> "SE estiver chovendo, levo guarda-chuva. SENÃO, vou de óculos escuros."

Na lógica de programação:

```text
SE (idade >= 18) ENTÃO
    Exibir "Pode dirigir"
SENÃO
    Exibir "Não pode dirigir"
FIM_SE
```

---

## Estruturas de Repetição (Loops)

Muitas vezes precisamos repetir uma tarefa várias vezes. Em vez de escrever a mesma instrução 100 vezes, usamos loops.

Existem dois tipos principais:

### 1. Enquanto (While)

Repete **enquanto** uma condição for verdadeira.

> "Enquanto o tanque não estiver cheio, continue colocando gasolina."

### 2. Para (For)

Repete por um número **determinado** de vezes.

> "Para cada degrau da escada (de 1 até 10), suba um passo."

---

## Funções e Modularização

À medida que os programas crescem, eles ficam complexos. Para organizar, dividimos o problema grande em problemas menores. Esses pequenos blocos de código são chamados de **Funções** (ou métodos/sub-rotinas).

Uma função realiza uma tarefa específica e pode ser reutilizada.

Exemplo: Em vez de escrever o código para "Calcular Imposto de Renda" em todos os lugares do sistema, você cria uma função `CalcularImposto()` e a chama sempre que precisar.

---

## Fluxogramas

Fluxogramas são representações gráficas de algoritmos. Eles usam formas geométricas para ilustrar os passos, decisões e fluxo do processo.

- **Retângulo:** Processamento/Ação.
- **Losango:** Decisão (Sim/Não).
- **Elipse:** Início ou Fim.
- **Setas:** Direção do fluxo.

Eles são ótimos para planejar a lógica antes de escrever qualquer código.

---

## Conclusão

A Lógica de Programação é independente da linguagem. Se você tem uma boa lógica, conseguirá programar em Dart, Java, C# ou qualquer outra linguagem; a única coisa que muda é a sintaxe (as palavras-chave).

O segredo para aprender lógica é **prática**. Resolva exercícios, crie pequenos algoritmos no papel e desafie-se a pensar em como resolver problemas do dia a dia passo a passo.
