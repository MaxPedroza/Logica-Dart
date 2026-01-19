# forEach - Iterar Pares

## Índice
- [O que é forEach](#o-que-é-foreach)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [forEach vs Alternativas](#foreach-vs-alternativas)

---

## O que é forEach

O método `forEach()` executa uma função para cada par chave-valor do map, permitindo processar todos os dados de forma elegante.

---

## Sintaxe Básica

```dart
mapa.forEach((chave, valor) {
  // Executar algo com chave e valor
});
```

---

## Exemplos Práticos

### Exemplo 1: Exibir Todos os Pares

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana Silva',
    'email': 'ana@email.com',
    'idade': 28
  };

  print("=== Dados do Usuário ===");
  usuario.forEach((chave, valor) {
    print("$chave: $valor");
  });
  // Output:
  // === Dados do Usuário ===
  // id: 1
  // nome: Ana Silva
  // email: ana@email.com
  // idade: 28
}
```

### Exemplo 2: Calcular Total

```dart
void main() {
  var precos = {
    'notebook': 3000.00,
    'mouse': 50.00,
    'teclado': 150.00,
    'monitor': 1200.00
  };

  double total = 0;

  precos.forEach((produto, preco) {
    print("$produto: R\$ ${preco.toStringAsFixed(2)}");
    total += preco;
  });

  print("Total: R\$ ${total.toStringAsFixed(2)}");
}
```

### Exemplo 3: Filtrar com forEach

```dart
void main() {
  var alunos = {
    'Ana': 85,
    'Bruno': 92,
    'Carlos': 78,
    'Diana': 88,
    'Elvio': 95
  };

  print("Alunos aprovados (nota >= 80):");
  alunos.forEach((nome, nota) {
    if (nota >= 80) {
      print("- $nome: $nota");
    }
  });
}
```

### Exemplo 4: Transformar Dados

```dart
void main() {
  var dados = {
    'altura_cm': 170,
    'peso_kg': 75,
    'idade_anos': 28
  };

  print("Dados originais: $dados");

  var transformado = {};
  dados.forEach((chave, valor) {
    var novaChave = chave.replaceAll('_cm', ' (cm)')
                        .replaceAll('_kg', ' (kg)')
                        .replaceAll('_anos', ' (anos)');
    transformado[novaChave] = valor;
  });

  print("Dados transformados: $transformado");
}
```

### Exemplo 5: Construir String

```dart
void main() {
  var produto = {
    'nome': 'Notebook',
    'marca': 'Dell',
    'preco': 3000.00,
    'garantia': '2 anos'
  };

  var descricao = '';
  produto.forEach((chave, valor) {
    descricao += '${chave.toUpperCase()}: $valor\n';
  });

  print("Descrição do Produto:");
  print(descricao);
}
```

---

## forEach com Índice

```dart
void main() {
  var cores = {
    'primaria': 'azul',
    'secundaria': 'verde',
    'terciaria': 'amarelo'
  };

  var indice = 0;
  cores.forEach((chave, valor) {
    indice++;
    print("$indice. $chave: $valor");
  });
  // Output:
  // 1. primaria: azul
  // 2. secundaria: verde
  // 3. terciaria: amarelo
}
```

---

## forEach vs Alternativas

### Vs. For-in com entries

```dart
void main() {
  var dados = {'a': 1, 'b': 2, 'c': 3};

  // ✅ forEach (funcional)
  dados.forEach((k, v) => print('$k: $v'));

  // ✅ for-in (imperativo)
  for (var entrada in dados.entries) {
    print('${entrada.key}: ${entrada.value}');
  }

  // Ambos funcionam bem
}
```

### Vs. For-in simples com keys

```dart
void main() {
  var map = {'nome': 'Ana', 'email': 'ana@email.com'};

  // ✅ forEach (acesso fácil a chave E valor)
  map.forEach((k, v) => print('$k = $v'));

  // ✅ for-in com keys (apenas chave, precisa buscar valor)
  for (var chave in map.keys) {
    print('$chave = ${map[chave]}');
  }
}
```

### Vs. map (transformação)

```dart
void main() {
  var numeros = {'a': 1, 'b': 2, 'c': 3};

  // ❌ forEach não retorna nada
  numeros.forEach((k, v) => print(v * 2));

  // ✅ map retorna novo Iterable
  var dobrados = numeros.entries.map((e) => e.value * 2);
  print(dobrados.toList());  // [2, 4, 6]
}
```

---

## ✅ Padrões Recomendados

### 1. Para Iteração Simples: Use forEach

```dart
// ✅ BOM (claro e conciso)
mapa.forEach((k, v) => print('$k: $v'));
```

### 2. Para Lógica Complexa: Use for-in

```dart
// ✅ BOM (mais controle)
for (var entrada in mapa.entries) {
  if (entrada.value > 10) {
    processar(entrada.key, entrada.value);
  }
}
```

### 3. Para Transformação: Use map

```dart
// ✅ BOM (retorna novo Iterable)
var transformado = mapa.entries
  .map((e) => '${e.key}=${e.value}')
  .toList();
```

### 4. Para Efeitos Colaterais: Use forEach

```dart
// ✅ BOM (forEach é para side effects)
usuarios.forEach((id, usuario) {
  enviar_email(usuario['email']);
  atualizar_timestamp(id);
});
```

---

## Exemplos Práticos Avançados

### Exemplo: Construir HTML

```dart
void main() {
  var usuario = {
    'nome': 'Ana',
    'email': 'ana@email.com',
    'telefone': '1234-5678'
  };

  var html = '<ul>';
  usuario.forEach((chave, valor) {
    html += '<li><strong>$chave:</strong> $valor</li>';
  });
  html += '</ul>';

  print(html);
  // Output: <ul><li><strong>nome:</strong> Ana</li>...
}
```

### Exemplo: Validação

```dart
void main() {
  var formulario = {
    'nome': 'Ana',
    'email': 'ana@email.com',
    'idade': 28,
    'cpf': ''  // Campo vazio
  };

  var camposVazios = <String>[];
  formulario.forEach((chave, valor) {
    if (valor.toString().isEmpty) {
      camposVazios.add(chave);
    }
  });

  if (camposVazios.isNotEmpty) {
    print("Campos vazios: ${camposVazios.join(', ')}");
  }
}
```

### Exemplo: Relatório

```dart
void main() {
  var vendas = {
    'Ana': 5000.00,
    'Bruno': 7500.00,
    'Carlos': 4200.00
  };

  var total = 0.0;
  var melhor = '';
  var melhorValor = 0.0;

  vendas.forEach((vendedor, valor) {
    total += valor;
    if (valor > melhorValor) {
      melhor = vendedor;
      melhorValor = valor;
    }
  });

  print("=== RELATÓRIO DE VENDAS ===");
  vendas.forEach((v, valor) {
    var percentual = (valor / total * 100).toStringAsFixed(1);
    print("$v: R\$ ${valor.toStringAsFixed(2)} ($percentual%)");
  });
  print("Total: R\$ ${total.toStringAsFixed(2)}");
  print("Melhor vendedor: $melhor (R\$ ${melhorValor.toStringAsFixed(2)})");
}
```

---

## Ver Também
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 11: keys e values](aula11-keys-values.md)
- [Aula 13: Métodos Avançados](aula13-metodos-avancados.md)
