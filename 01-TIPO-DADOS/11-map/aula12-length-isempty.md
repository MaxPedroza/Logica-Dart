# length e isEmpty

## Índice
- [O que são length e isEmpty](#o-que-são-length-e-isempty)
- [Propriedade length](#propriedade-length)
- [Propriedade isEmpty](#propriedade-isempty)
- [Propriedade isNotEmpty](#propriedade-isnotempty)
- [Exemplos Práticos](#exemplos-práticos)

---

## O que são length e isEmpty

- **length:** Propriedade que retorna a quantidade de pares no map (tipo `int`)
- **isEmpty:** Propriedade que retorna `true` se o map está vazio, `false` caso contrário
- **isNotEmpty:** Propriedade que retorna `true` se o map possui pares, `false` se vazio

---

## Propriedade length

Retorna o número total de pares chave-valor.

### Sintaxe

```dart
int quantidade = mapa.length;
```

### Exemplo 1: Contar Pares

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com',
    'telefone': '1234-5678'
  };

  print("Total de campos: ${usuario.length}");
  // Output: Total de campos: 4
}
```

### Exemplo 2: Verificar Tamanho

```dart
void main() {
  var config = {
    'servidor': 'localhost',
    'porta': 8080
  };

  if (config.length > 2) {
    print("Config tem mais de 2 itens");
  } else if (config.length == 2) {
    print("Config tem exatamente 2 itens");
  }
}
```

### Exemplo 3: Usar em Loop

```dart
void main() {
  var dados = {
    'Ana': 85,
    'Bruno': 90,
    'Carlos': 88
  };

  print("Total de registros: ${dados.length}");

  // Usar length para validação
  if (dados.length > 0) {
    print("Processando ${dados.length} registros");
  }
}
```

---

## Propriedade isEmpty

Retorna `true` se o map não possui pares.

### Sintaxe

```dart
bool vazio = mapa.isEmpty;
```

### Exemplo 1: Verificar se Vazio

```dart
void main() {
  var mapa1 = <String, int>{};  // Vazio
  var mapa2 = {'a': 1};          // Não vazio

  print("mapa1 vazio? ${mapa1.isEmpty}");  // true
  print("mapa2 vazio? ${mapa2.isEmpty}");  // false
}
```

### Exemplo 2: Validar Antes de Processar

```dart
void main() {
  var cache = <String, dynamic>{};

  // Evitar operações em map vazio
  if (cache.isEmpty) {
    print("Cache vazio, nada para processar");
    // ... carregar dados
  } else {
    print("Cache tem ${cache.length} itens");
    // ... usar dados do cache
  }
}
```

### Exemplo 3: Tratamento de Erro

```dart
void main() {
  var resultado = <String, dynamic>{};

  void processar() {
    if (resultado.isEmpty) {
      throw Exception("Resultado vazio, falha no processamento");
    }
    print("Processando: $resultado");
  }

  // Tenta processar map vazio
  try {
    processar();
  } catch (e) {
    print("Erro: $e");
  }
}
```

---

## Propriedade isNotEmpty

Retorna `true` se o map possui pares.

### Sintaxe

```dart
bool temDados = mapa.isNotEmpty;
```

### Exemplo 1: Verificar se Possui Dados

```dart
void main() {
  var usuario = {'nome': 'Ana', 'email': 'ana@email.com'};

  if (usuario.isNotEmpty) {
    print("Usuário carregado: ${usuario['nome']}");
  } else {
    print("Nenhum usuário carregado");
  }
}
```

### Exemplo 2: Lógica com isNotEmpty

```dart
void main() {
  var pedido = <String, dynamic>{};

  print("Pedido preenchido? ${pedido.isNotEmpty}");  // false

  pedido['produto'] = 'Notebook';
  pedido['quantidade'] = 2;
  pedido['preco'] = 3000.00;

  print("Pedido preenchido? ${pedido.isNotEmpty}");  // true
}
```

### Exemplo 3: Executar Apenas se Houver Dados

```dart
void main() {
  var dados = {
    'id': 123,
    'nome': 'Projeto A',
    'status': 'ativo'
  };

  if (dados.isNotEmpty) {
    dados.forEach((k, v) => print("$k: $v"));
  }
}
```

---

## Exemplos Práticos

### Exemplo 1: Validação de Formulário

```dart
void main() {
  var formulario = <String, String>{};

  bool preenchido() => formulario.isNotEmpty && formulario.length == 3;

  formulario['nome'] = 'Ana';
  print("Completo? ${preenchido()}");  // false

  formulario['email'] = 'ana@email.com';
  formulario['telefone'] = '1234-5678';
  print("Completo? ${preenchido()}");  // true
}
```

### Exemplo 2: Cache com Limite

```dart
void main() {
  var cache = <String, dynamic>{};
  const maxSize = 5;

  void adicionar(String chave, dynamic valor) {
    if (cache.length >= maxSize) {
      var primeiraChave = cache.keys.first;
      cache.remove(primeiraChave);
      print("Cache cheio, removido: $primeiraChave");
    }
    cache[chave] = valor;
  }

  adicionar('item1', 'dados1');
  adicionar('item2', 'dados2');
  print("Cache: ${cache.length} itens");
}
```

### Exemplo 3: Relatório de Status

```dart
void main() {
  var usuarios = {
    'ana': {'status': 'ativo'},
    'bruno': {'status': 'ativo'},
    'carlos': {'status': 'inativo'}
  };

  print("=== Relatório ===");
  print("Total de usuários: ${usuarios.length}");
  print("Registros encontrados? ${usuarios.isNotEmpty}");

  if (usuarios.isNotEmpty) {
    usuarios.forEach((nome, info) {
      print("- $nome: ${info['status']}");
    });
  }
}
```

### Exemplo 4: Condições de Acesso

```dart
void main() {
  var usuario = <String, dynamic>{};

  // isEmpty útil para verificar não preenchido
  if (usuario.isEmpty) {
    usuario['id'] = 1;
    usuario['nome'] = 'Novo Usuário';
  }

  // isNotEmpty útil para verificar dados carregados
  if (usuario.isNotEmpty) {
    print("Usuário: ${usuario['nome']}");
  }
}
```

---

## ✅ Padrões Recomendados

### 1. Preferir isEmpty/isNotEmpty

```dart
// ✅ BOM
if (mapa.isEmpty) { }

// ❌ EVITE
if (mapa.length == 0) { }

// ✅ BOM
if (mapa.isNotEmpty) { }

// ❌ EVITE
if (mapa.length > 0) { }
```

### 2. Validação em Duas Etapas

```dart
// ✅ BOM
if (dados.isNotEmpty && dados.length >= 3) {
  processar(dados);
}
```

### 3. Com Operador Null-Coalescing

```dart
// ✅ BOM
var size = dados?.length ?? 0;
var vazio = dados?.isEmpty ?? true;
```

### 4. Em Loops Condicionais

```dart
// ✅ BOM
while (lista.isNotEmpty) {
  var item = lista.remove(lista.keys.first);
  processar(item);
}
```

---

## Tabela Comparativa

| Propriedade | Retorna | Usa |
|---|---|---|
| `length` | int | Contar, comparar quantidade |
| `isEmpty` | bool | Verificar se vazio |
| `isNotEmpty` | bool | Verificar se tem dados |

---

## Exemplos Avançados

### Exemplo: Sistema de Fila

```dart
void main() {
  var fila = <String, dynamic>{};

  void adicionar(String id, dynamic dado) {
    fila[id] = dado;
    print("Adicionado $id, fila tem ${fila.length} itens");
  }

  void processar() {
    if (fila.isNotEmpty) {
      var primeiro = fila.keys.first;
      print("Processando: $primeiro");
      fila.remove(primeiro);
    } else {
      print("Fila vazia, nada a processar");
    }
  }

  adicionar('task1', 'dados1');
  adicionar('task2', 'dados2');
  processar();
  processar();
  processar();  // Fila vazia
}
```

### Exemplo: Contador com Validação

```dart
void main() {
  var contador = <String, int>{};

  void incrementar(String chave) {
    if (contador.isEmpty) {
      contador[chave] = 1;
    } else {
      contador.update(chave, (v) => v + 1, ifAbsent: () => 1);
    }
  }

  incrementar('a');
  incrementar('a');
  incrementar('b');
  incrementar('a');

  print("Contador tem ${contador.length} chaves");
  print("Dados: $contador");
}
```

---

## Ver Também
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 05: containsKey](aula05-containskey.md)
