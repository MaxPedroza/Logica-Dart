# keys e values - Acessar Coleções

## Índice
- [O que são keys e values](#o-que-são-keys-e-values)
- [Propriedade keys](#propriedade-keys)
- [Propriedade values](#propriedade-values)
- [Exemplos Práticos](#exemplos-práticos)
- [Conversão para List](#conversão-para-list)

---

## O que são keys e values

- **keys:** Propriedade que retorna uma coleção (Iterable) de todas as **chaves** do map
- **values:** Propriedade que retorna uma coleção (Iterable) de todos os **valores** do map

Ambas retornam um `Iterable`, não uma `List`, então podem ser transformadas em list quando necessário.

---

## Propriedade keys

Acessa todas as chaves do map.

### Sintaxe

```dart
Iterable<String> chaves = mapa.keys;
```

### Exemplo 1: Obter Chaves

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com',
    'telefone': '1234-5678'
  };

  // Obter chaves
  print("Chaves: ${usuario.keys}");
  // Output: Chaves: (id, nome, email, telefone)

  // Converter para List
  var listaChaves = usuario.keys.toList();
  print("Chaves como lista: $listaChaves");
  // Output: Chaves como lista: [id, nome, email, telefone]
}
```

### Exemplo 2: Iterar sobre Chaves

```dart
void main() {
  var config = {
    'servidor': 'localhost',
    'porta': 8080,
    'debug': true
  };

  print("Configurações disponíveis:");
  for (var chave in config.keys) {
    print("- $chave");
  }
  // Output:
  // Configurações disponíveis:
  // - servidor
  // - porta
  // - debug
}
```

### Exemplo 3: Verificar Existência de Chave

```dart
void main() {
  var opcoes = {
    'tema': 'escuro',
    'idioma': 'português',
    'notificacoes': true
  };

  var procurada = 'som';

  if (opcoes.keys.contains(procurada)) {
    print("Chave '$procurada' encontrada");
  } else {
    print("Chave '$procurada' não encontrada");
  }
}
```

---

## Propriedade values

Acessa todos os valores do map.

### Sintaxe

```dart
Iterable<dynamic> valores = mapa.values;
```

### Exemplo 1: Obter Valores

```dart
void main() {
  var notas = {
    'Ana': 85,
    'Bruno': 92,
    'Carlos': 88,
    'Diana': 95
  };

  // Obter valores
  print("Notas: ${notas.values}");
  // Output: Notas: (85, 92, 88, 95)

  // Converter para List
  var listaNotas = notas.values.toList();
  print("Notas como lista: $listaNotas");
  // Output: Notas como lista: [85, 92, 88, 95]
}
```

### Exemplo 2: Calcular com values

```dart
void main() {
  var precos = {
    'notebook': 3000.00,
    'mouse': 50.00,
    'teclado': 150.00,
    'monitor': 1200.00
  };

  // Calcular total dos valores
  var total = precos.values.reduce((a, b) => a + b);
  print("Total: R\$ ${total.toStringAsFixed(2)}");
  // Output: Total: R\$ 4400.00

  // Encontrar maior valor
  var maiorPreco = precos.values.reduce((a, b) => a > b ? a : b);
  print("Maior preço: R\$ ${maiorPreco.toStringAsFixed(2)}");
}
```

### Exemplo 3: Verificar Valor

```dart
void main() {
  var cidades = {
    'SP': 'São Paulo',
    'RJ': 'Rio de Janeiro',
    'MG': 'Minas Gerais',
    'BA': 'Bahia'
  };

  var procurada = 'Rio de Janeiro';

  if (cidades.values.contains(procurada)) {
    print("Cidade '$procurada' encontrada no map");
  }
}
```

---

## Exemplos Práticos

### Exemplo 1: Contar Chaves

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com',
    'telefone': '1234-5678',
    'endereco': 'Rua X, 123'
  };

  var totalChaves = usuario.keys.length;
  print("Total de campos do usuário: $totalChaves");
  // Output: Total de campos do usuário: 5
}
```

### Exemplo 2: Listar Campos Disponíveis

```dart
void main() {
  var pessoa = {
    'nome': 'Pedro',
    'email': 'pedro@email.com',
    'ativo': true
  };

  print("Campos disponíveis no objeto pessoa:");
  pessoa.keys.forEach((campo) => print("- \$campo"));
  // Output:
  // Campos disponíveis no objeto pessoa:
  // - nome
  // - email
  // - ativo
}
```

### Exemplo 3: Filtrar Valores

```dart
void main() {
  var pontuacoes = {
    'jogador1': 450,
    'jogador2': 320,
    'jogador3': 580,
    'jogador4': 275,
    'jogador5': 610
  };

  // Encontrar valores acima de 400
  var acima400 = pontuacoes.values.where((v) => v > 400).toList();
  print("Jogadores com mais de 400 pontos:");
  print("Pontuações: $acima400");

  // Encontrar chaves correspondentes
  pontuacoes.forEach((jogador, pontos) {
    if (pontos > 400) {
      print("- $jogador: $pontos pontos");
    }
  });
}
```

### Exemplo 4: Comparar keys e values

```dart
void main() {
  var mapa = {
    'maçã': 'fruta',
    'cenoura': 'vegetal',
    'pão': 'grão'
  };

  print("=== Análise ===");
  print("Total de pares: ${mapa.length}");
  print("Chaves: ${mapa.keys.toList()}");
  print("Valores: ${mapa.values.toList()}");
  
  print("Chaves em maiúsculas: ");
  mapa.keys.forEach((k) => print("- ${k.toUpperCase()}"));
}
```

---

## Conversão para List

### toList()

```dart
void main() {
  var config = {
    'debug': true,
    'porta': 8080,
    'host': 'localhost'
  };

  // Converter keys para lista
  List<String> chaves = config.keys.toList();
  print("Chaves como List: $chaves");
  print("Tipo: ${chaves.runtimeType}");

  // Converter values para lista
  List<dynamic> valores = config.values.toList();
  print("Valores como List: $valores");
}
```

### toSet()

```dart
void main() {
  var frequencias = {
    'palavra1': 5,
    'palavra2': 3,
    'palavra3': 5,
    'palavra4': 3
  };

  // Valores únicos
  var valoresUnicos = frequencias.values.toSet();
  print("Frequências únicas: $valoresUnicos");
  // Output: Frequências únicas: {5, 3}
}
```

---

## ✅ Padrões Recomendados

### 1. Iterar sobre Chaves: Use keys

```dart
// ✅ BOM
for (var chave in mapa.keys) {
  print(chave);
}

// ✅ TAMBÉM BOM (forEach)
mapa.keys.forEach((k) => print(k));
```

### 2. Iterar sobre Valores: Use values

```dart
// ✅ BOM
for (var valor in mapa.values) {
  print(valor);
}

// ✅ TAMBÉM BOM (forEach)
mapa.values.forEach((v) => print(v));
```

### 3. Iterar sobre Pares: Use entries ou forEach

```dart
// ✅ BOM (ambos pares)
mapa.forEach((k, v) => print('$k: $v'));

// ✅ TAMBÉM BOM
for (var e in mapa.entries) {
  print('${e.key}: ${e.value}');
}
```

### 4. Contar Elementos

```dart
// ✅ BOM (usar length)
var qtd = mapa.length;  // Sempre preferir a mapa.length
var qtd = mapa.keys.length;  // Menos eficiente
```

---

## Tabela Comparativa

| Propriedade | Retorna | Tipo | Usa |
|---|---|---|---|
| `keys` | Chaves | Iterable<K> | Iterar chaves, buscar |
| `values` | Valores | Iterable<V> | Iterar valores, calcular |
| `entries` | Pares | Iterable<MapEntry> | Iterar pares |
| `length` | Quantidade | int | Contar pares |

---

## Ver Também
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 10: forEach](aula10-foreach.md)
- [Aula 12: length e isEmpty](aula12-length-isempty.md)
