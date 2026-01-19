# update - Atualizar Valores

## Índice
- [O que é update](#o-que-é-update)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [update vs Atribuição Direta](#update-vs-atribuição-direta)

---

## O que é update

O método `update()` modifica o valor associado a uma **chave existente**, aplicando uma função de transformação. Se a chave não existir, lança um erro (use `updateAll` ou com `ifAbsent` para evitar).

---

## Sintaxe Básica

```dart
mapa.update('chave', (valor_antigo) => novo_valor);
// Atualiza o valor da chave usando uma função
```

---

## Exemplos Práticos

### Exemplo 1: Incrementar Valor

```dart
void main() {
  var contadores = {
    'visitantes': 10,
    'cliques': 5,
    'compras': 2
  };

  print("Antes: $contadores");

  // Atualizar incrementando o valor
  contadores.update('visitantes', (valor) => valor + 1);
  contadores.update('cliques', (valor) => valor + 5);

  print("Depois: $contadores");
  // Output: Depois: {visitantes: 11, cliques: 10, compras: 2}
}
```

### Exemplo 2: Transformar String

```dart
void main() {
  var usuario = {
    'nome': 'ana silva',
    'email': 'ana@email.com',
    'estado': 'são paulo'
  };

  print("Antes: $usuario");

  // Converter para maiúsculas
  usuario.update('nome', (valor) => valor.toUpperCase());
  usuario.update('estado', (valor) => valor.toUpperCase());

  print("Depois: $usuario");
  // Output: Depois: {nome: ANA SILVA, email: ana@email.com, estado: SÃO PAULO}
}
```

### Exemplo 3: Atualizar com Lógica Complexa

```dart
void main() {
  var notas = {
    'Ana': 85,
    'Bruno': 90,
    'Carlos': 78
  };

  print("Notas originais: $notas");

  // Aumentar nota em 10% para todos com menos de 85
  notas.forEach((aluno, nota) {
    if (nota < 85) {
      notas.update(aluno, (n) => (n * 1.1).toInt());
    }
  });

  print("Notas ajustadas: $notas");
  // Output: Notas ajustadas: {Ana: 85, Bruno: 90, Carlos: 85}
}
```

### Exemplo 4: Atualizar Lista dentro de Map

```dart
void main() {
  var dados = {
    'tags': ['dart', 'flutter'],
    'categorias': ['programação']
  };

  print("Antes: $dados");

  // Adicionar elemento à lista
  dados.update('tags', (lista) {
    lista.add('mobile');
    return lista;
  });

  print("Depois: $dados");
  // Output: Depois: {tags: [dart, flutter, mobile], categorias: [programação]}
}
```

### Exemplo 5: Atualizar Map Aninhado

```dart
void main() {
  var usuario = {
    'nome': 'Ana',
    'endereco': {
      'rua': 'Av. Paulista',
      'numero': 1000,
      'cidade': 'São Paulo'
    }
  };

  print("Antes: $usuario");

  // Atualizar número da rua
  var endereco = usuario['endereco'] as Map;
  endereco.update('numero', (n) => 2000);

  print("Depois: $usuario");
  // Output: Depois: {nome: Ana, endereco: {rua: Av. Paulista, numero: 2000, cidade: São Paulo}}
}
```

---

## updateAll (Atualizar Todos)

O método `updateAll()` atualiza **todos os valores** do map usando uma função.

```dart
void main() {
  var precos = {
    'notebook': 3000.00,
    'mouse': 50.00,
    'teclado': 150.00
  };

  print("Preços antes: $precos");

  // Aumentar todos os preços em 10%
  precos.updateAll((chave, valor) => valor * 1.1);

  print("Preços com 10% de aumento: $precos");
  // Output: Preços com 10% de aumento: {notebook: 3300.0, mouse: 55.0, teclado: 165.0}
}
```

---

## update com ifAbsent

Use `ifAbsent` para adicionar a chave caso não exista.

```dart
void main() {
  var config = {'tempo': 30};

  print("Antes: $config");

  // Atualizar existente
  config.update('tempo', (v) => v + 10);

  // Adicionar se não existir (em vez de erro)
  config.update(
    'retentativas',
    (v) => v + 1,
    ifAbsent: () => 1
  );

  config.update(
    'tempo_espera',
    (v) => v * 2,
    ifAbsent: () => 5
  );

  print("Depois: $config");
  // Output: Depois: {tempo: 40, retentativas: 1, tempo_espera: 5}
}
```

---

## update vs Atribuição Direta

```dart
void main() {
  // Método 1: Atribuição direta
  var map1 = {'valor': 10};
  map1['valor'] = 20;  // Simples, direto

  // Método 2: update
  var map2 = {'valor': 10};
  map2.update('valor', (v) => v * 2);  // Com transformação

  // Método 3: +=, -=, etc
  var map3 = {'valor': 10};
  map3['valor'] = (map3['valor'] ?? 0) + 5;  // Com valor padrão

  print("Atribuição: $map1");
  print("Update: $map2");
  print("Aritmética: $map3");
}
```

---

## ✅ Padrões Recomendados

### 1. Para Atualizar com Transformação: Use update

```dart
// ✅ BOM (transformação clara)
mapa.update('chave', (v) => v.toUpperCase());

// ❌ MENOS CLARO (atribuição direta)
mapa['chave'] = mapa['chave'].toUpperCase();
```

### 2. Para Operações Aritméticas

```dart
// ✅ BOM (update com função)
contador.update('visitantes', (v) => v + 1);

// ✅ TAMBÉM BOM (atribuição simples)
contador['visitantes'] += 1;
```

### 3. Para Evitar Erro se Chave Não Existe

```dart
// ✅ BOM (com ifAbsent)
mapa.update('chave', (v) => v + 1, ifAbsent: () => 0);

// ✅ TAMBÉM BOM (verificar antes)
if (mapa.containsKey('chave')) {
  mapa.update('chave', (v) => v + 1);
}
```

### 4. Para Atualizar Múltiplos Valores

```dart
// ✅ BOM (updateAll)
precos.updateAll((k, v) => v * 1.1);

// ✅ TAMBÉM BOM (forEach)
precos.forEach((k, v) {
  precos[k] = v * 1.1;
});
```

---

## Tabela Comparativa

| Método | Atualiza | Chave Existe? | Retorna |
|--------|----------|---------------|---------|
| `update()` | Uma | Deve existir | novo valor |
| `updateAll()` | Todas | Sempre | void |
| `update() + ifAbsent` | Uma | Cria se não existir | novo valor |
| Atribuição `[]` | Uma | Cria se não existir | valor atribuído |

---

## Exemplos Avançados

### Exemplo: Contador de Frequência

```dart
void main() {
  var texto = 'flutter dart flutter dart flutter';
  var palavras = texto.split(' ');

  var frequencia = <String, int>{};

  // Contar frequência de cada palavra
  for (var palavra in palavras) {
    frequencia.update(
      palavra,
      (count) => count + 1,
      ifAbsent: () => 1
    );
  }

  print("Frequência: $frequencia");
  // Output: Frequência: {flutter: 3, dart: 2}
}
```

### Exemplo: Atualizar com Validação

```dart
void main() {
  var inventario = {
    'maças': 10,
    'bananas': 5,
    'laranjas': 8
  };

  void comprar(String fruta, int quantidade) {
    if (inventario.containsKey(fruta)) {
      var novo = inventario[fruta]! + quantidade;
      if (novo >= 0) {
        inventario.update(fruta, (_) => novo);
        print("$fruta atualizado para $novo");
      }
    }
  }

  comprar('maças', 3);      // ✅ OK
  comprar('uva', 2);        // ❌ Fruta não existe
  print("Inventário: $inventario");
}
```

---

## Ver Também
- [Aula 02: Adicionando Pares (addEntry)](aula02-addentry.md)
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 07: remove](aula07-remove.md)
