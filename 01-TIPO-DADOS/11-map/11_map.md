# Maps em Dart

Um `Map` (ou Dicionário) é uma coleção que armazena pares de chave-valor. Cada chave é única e mapeia para um único valor. Se você vem de outras linguagens, pode conhecê-los como _Dicionários_ ou _Objetos_.

---

## 📚 Documentação por Aula

> Acesse os arquivos de documentação detalhada para cada tema:

| # | Tema | Arquivo |
|---|------|---------|
| 1 | Declaração de Maps | [aula01-declaracao.md](aula01-declaracao.md) |
| 2 | Adicionando Pares (add Entry) | [aula02-addentry.md](aula02-addentry.md) |
| 3 | addAll - Adicionar Múltiplos Pares | [aula03-addall.md](aula03-addall.md) |
| 4 | Acessar Valores | [aula04-acesso.md](aula04-acesso.md) |
| 5 | containsKey - Verificar Chaves | [aula05-containskey.md](aula05-containskey.md) |
| 6 | containsValue - Verificar Valores | [aula06-containsvalue.md](aula06-containsvalue.md) |
| 7 | remove - Remover Pares | [aula07-remove.md](aula07-remove.md) |
| 8 | clear - Limpar Map | [aula08-clear.md](aula08-clear.md) |
| 9 | update - Atualizar Valores | [aula09-update.md](aula09-update.md) |
| 10 | forEach - Iterar Pares | [aula10-foreach.md](aula10-foreach.md) |
| 11 | keys e values - Acessar Coleções | [aula11-keys-values.md](aula11-keys-values.md) |
| 12 | length e isEmpty | [aula12-length-isempty.md](aula12-length-isempty.md) |
| 13 | Métodos Avançados | [aula13-metodos-avancados.md](aula13-metodos-avancados.md) |

---

## Índice

1. [Introdução](#introdução)
2. [Declarando Maps](#declarando-maps)
3. [Adicionando Pares](#adicionando-pares)
4. [Acessando Valores](#acessando-valores)
5. [Removendo Pares](#removendo-pares)
6. [Verificando Existência](#verificando-existência)
7. [Iterando sobre Maps](#iterando-sobre-maps)
8. [Métodos Úteis](#métodos-úteis)
9. [Boas Práticas](#boas-práticas)

---

## Introdução

Um `Map` em Dart armazena dados como pares chave-valor. São ideais para organizar dados relacionados e fazer consultas rápidas.

```dart
// Um map simples de nomes e idades
Map<String, int> idades = {
  'Ana': 25,
  'Bruno': 30,
  'Carlos': 28
};
```

---

## Declarando Maps

Existem várias formas de criar maps em Dart, dependendo da sua necessidade.

### Map Literal

A forma mais comum e recomendada.

```dart
// Map com tipo explícito
Map<String, String> cidades = {
  'Brasil': 'Brasília',
  'França': 'Paris',
  'Japão': 'Tóquio'
};

// Com inferência de tipo (var)
var telefones = {
  'Ana': '1234-5678',
  'Bruno': '8765-4321'
};
```

### Map Vazio

```dart
// Map vazio tipado
var vazio = <String, int>{};

// Com construtor
Map<String, String> outroVazio = {};
```

### Construtores Especiais

- **Map.from():** Cria um novo map a partir de outro.
- **Map.of():** Cria um map imutável (view).
- **Map.unmodifiable():** Cria um map completamente imutável.

```dart
var original = {'a': 1, 'b': 2};

// Criar cópia
var copia = Map.from(original);

// Map imutável
var imutavel = Map.unmodifiable(original);
// imutavel['c'] = 3; // ERRO!
```

---

## Adicionando Pares

Para maps de tamanho dinâmico, você pode adicionar pares a qualquer momento.

```dart
void main() {
  var pessoa = <String, dynamic>{};

  // Adicionar pares usando atribuição direta
  pessoa['nome'] = 'Ana';
  pessoa['idade'] = 25;
  pessoa['email'] = 'ana@email.com';

  // Ou usando o método addEntries
  pessoa.addEntries([
    MapEntry('cidade', 'São Paulo'),
    MapEntry('profissao', 'Desenvolvedora')
  ]);

  // Ou usando addAll para mesclar maps
  pessoa.addAll({
    'pais': 'Brasil',
    'estado': 'SP'
  });

  print(pessoa);
  // {nome: Ana, idade: 25, email: ana@email.com, cidade: São Paulo, profissao: Desenvolvedora, pais: Brasil, estado: SP}
}
```

---

## Acessando Valores

Você acessa valores usando a chave entre colchetes `[]` ou o método `[]?` para acesso seguro.

```dart
void main() {
  var carro = {
    'marca': 'Toyota',
    'modelo': 'Corolla',
    'ano': 2023
  };

  // Acesso direto
  print(carro['marca']); // Toyota
  print(carro['ano']); // 2023

  // Acesso seguro (retorna null se não existir)
  print(carro['cor']); // null
  print(carro['cor'] ?? 'Desconhecido'); // Desconhecido

  // Usando o método containsKey
  if (carro.containsKey('modelo')) {
    print('Modelo: ${carro['modelo']}'); // Corolla
  }
}
```

---

## Removendo Pares

Dart oferece métodos flexíveis para remover pares.

```dart
void main() {
  var configuracoes = {
    'tema': 'escuro',
    'idioma': 'português',
    'notificacoes': true,
    'som': false
  };

  // Remover um par específico pela chave
  configuracoes.remove('som');

  // Remover com condição
  configuracoes.removeWhere((chave, valor) => valor == false);

  // Remover e retornar o valor
  var idioma = configuracoes.remove('idioma'); // português

  // Limpar todo o map
  configuracoes.clear();

  print(configuracoes); // {}
}
```

---

## Verificando Existência

Dart oferece métodos úteis para verificar se chaves ou valores existem.

```dart
void main() {
  var usuario = {
    'nome': 'Pedro',
    'email': 'pedro@email.com',
    'ativo': true
  };

  // Verificar se uma chave existe
  if (usuario.containsKey('nome')) {
    print('Chave "nome" existe');
  }

  // Verificar se um valor existe
  if (usuario.containsValue(true)) {
    print('Valor true existe no map');
  }

  // Verificar tamanho
  print('Total de pares: ${usuario.length}'); // 3

  // Verificar se está vazio
  print('Está vazio? ${usuario.isEmpty}'); // false
  print('Tem itens? ${usuario.isNotEmpty}'); // true
}
```

---

## Iterando sobre Maps

Como percorrer todos os pares chave-valor de um map?

### forEach

A maneira mais comum e legível.

```dart
var cores = {
  'primaria': 'azul',
  'secundaria': 'verde',
  'terciaria': 'amarelo'
};

cores.forEach((chave, valor) {
  print('$chave: $valor');
});
// Output:
// primaria: azul
// secundaria: verde
// terciaria: amarelo
```

### For-in com entries

Útil quando você precisa de controle total.

```dart
var frutas = {'maçã': 5, 'banana': 3, 'laranja': 7};

for (var entrada in frutas.entries) {
  print('${entrada.key}: ${entrada.value} unidades');
}
```

### Iterando apenas chaves

```dart
for (var chave in frutas.keys) {
  print('Chave: $chave');
}
```

### Iterando apenas valores

```dart
for (var valor in frutas.values) {
  print('Valor: $valor');
}
```

---

## Métodos Úteis

A classe `Map` é muito poderosa e oferece muitos métodos.

- **keys:** Retorna uma coleção de todas as chaves.
- **values:** Retorna uma coleção de todos os valores.
- **entries:** Retorna uma coleção de MapEntry.
- **update(chave, funcao):** Atualiza um valor com base em uma função.
- **putIfAbsent(chave, valor):** Adiciona se a chave não existir.
- **map():** Transforma cada entrada (retorna um novo Map).

```dart
var dados = {'a': 1, 'b': 2, 'c': 3};

// Acessar chaves
print(dados.keys.toList()); // [a, b, c]

// Acessar valores
print(dados.values.toList()); // [1, 2, 3]

// Atualizar um valor
dados.update('a', (valor) => valor * 10); // {'a': 10, 'b': 2, 'c': 3}

// Adicionar se não existir
dados.putIfAbsent('d', () => 4); // {'a': 10, 'b': 2, 'c': 3, 'd': 4}

// Transformar map
var dobrado = dados.map((chave, valor) => MapEntry(chave, valor * 2));
```

---

## Boas Práticas

1. **Use Tipagem:** Sempre especifique os tipos de chave e valor (`Map<String, int>`).
   ```dart
   // ✅ BOM
   Map<String, int> notas = {'Ana': 85, 'Bruno': 90};

   // ❌ EVITE
   var dados = {};  // Tipo incerto
   ```

2. **Prefira Literais:** Use `{}` em vez de `new Map()`.

3. **Cuidado com `const`:** Maps `const` são imutáveis.
   ```dart
   const fixa = {'a': 1};
   // fixa['b'] = 2; // ERRO!
   ```

4. **Validação antes de Acesso:** Sempre verifique se a chave existe.
   ```dart
   if (map.containsKey('chave')) {
     var valor = map['chave'];
   }
   ```

5. **Spread Operator (...):** Use `...` para mesclar maps facilmente.
   ```dart
   var map1 = {'a': 1, 'b': 2};
   var map2 = {'c': 3, 'd': 4};
   var merged = {...map1, ...map2}; // {'a': 1, 'b': 2, 'c': 3, 'd': 4}
   ```

6. **Valores Padrão:** Use `??` para fornecer valores padrão.
   ```dart
   var configuracao = mapa['chave'] ?? 'valor_padrao';
   ```

7. **Pares Múltiplos:** Para adicionar vários pares, use `addAll` ou spread operator.
   ```dart
   // ✅ MELHOR
   map.addAll({'a': 1, 'b': 2});
   // ou
   var novoMap = {...map, 'a': 1, 'b': 2};
   ```

---

## Comparação: Map vs List

| Característica | Map | List |
|---|---|---|
| **Acesso** | Por chave (qualquer tipo) | Por índice (0, 1, 2...) |
| **Ordem** | Mantém inserção (em Dart) | Mantém ordem |
| **Chaves Únicas** | Sim | Não (índices únicos) |
| **Uso** | Dados estruturados | Coleções homogêneas |
| **Velocidade Lookup** | O(1) | O(n) |

---

## Ver Também
- [Listas em Dart](../10-list/10_list.md) - Estrutura de dados ordenada
- [Sets em Dart](../set/) - Coleção de valores únicos
