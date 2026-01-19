# Acessar Valores

## Índice
- [Formas de Acesso](#formas-de-acesso)
- [Acesso Direto com []](#acesso-direto-com-)
- [Acesso Seguro](#acesso-seguro)
- [Métodos de Consulta](#métodos-de-consulta)

---

## Formas de Acesso

Existem várias formas de acessar valores em um map em Dart.

---

## Acesso Direto com []

A forma mais comum. Use a chave entre colchetes.

```dart
void main() {
  var carro = {
    'marca': 'Toyota',
    'modelo': 'Corolla',
    'ano': 2023,
    'cor': 'prata'
  };

  // Acessar valores
  print("Marca: ${carro['marca']}");     // Toyota
  print("Modelo: ${carro['modelo']}");   // Corolla
  print("Ano: ${carro['ano']}");         // 2023
  print("Cor: ${carro['cor']}");         // prata
}
```

### Retorna null se Não Existir

```dart
void main() {
  var mapa = {'a': 1, 'b': 2};

  print(mapa['a']);     // 1
  print(mapa['c']);     // null (chave não existe)
}
```

⚠️ **Cuidado:** Acessar chave que não existe **não lança erro**, mas retorna `null`.

---

## Acesso Seguro

Use operadores para acesso mais seguro e defensivo.

### Operador ?? (Coalescing)

```dart
void main() {
  var usuario = {'nome': 'Ana', 'email': 'ana@email.com'};

  // Se não existir, usar valor padrão
  var telefone = usuario['telefone'] ?? 'não informado';
  var idade = usuario['idade'] ?? 25;

  print("Telefone: $telefone");  // não informado
  print("Idade: $idade");         // 25
}
```

### Operador ?. (Safe Access)

```dart
void main() {
  var dados = {
    'usuario': {'nome': 'Ana', 'ativo': true}
  };

  // Acessar nested de forma segura
  print(dados['usuario']?['nome']);   // Ana
  print(dados['admin']?['nome']);     // null (não lança erro)
}
```

### Verificação com containsKey

```dart
void main() {
  var config = {'tema': 'escuro', 'idioma': 'português'};

  // Verificar se existe antes de acessar
  if (config.containsKey('som')) {
    print("Som: ${config['som']}");
  } else {
    print("Chave 'som' não existe");
  }
}
```

---

## Métodos de Consulta

Dart oferece métodos úteis para acessar dados de forma alternativa.

### Método keys

Retorna todas as chaves como `Iterable`.

```dart
void main() {
  var pessoas = {
    'Ana': 25,
    'Bruno': 30,
    'Carlos': 28
  };

  // Obter lista de chaves
  var chaves = pessoas.keys.toList();
  print("Chaves: $chaves");  // [Ana, Bruno, Carlos]

  // Iterar sobre chaves
  for (var chave in pessoas.keys) {
    print("$chave: ${pessoas[chave]} anos");
  }
}
```

### Método values

Retorna todos os valores como `Iterable`.

```dart
void main() {
  var cidades = {
    'SP': 'São Paulo',
    'RJ': 'Rio de Janeiro',
    'MG': 'Minas Gerais'
  };

  // Obter lista de valores
  var valores = cidades.values.toList();
  print("Valores: $valores");
  // [São Paulo, Rio de Janeiro, Minas Gerais]

  // Iterar sobre valores
  for (var valor in cidades.values) {
    print("Cidade: $valor");
  }
}
```

### Método entries

Retorna pares chave-valor como `Iterable<MapEntry>`.

```dart
void main() {
  var notas = {'Ana': 85, 'Bruno': 90, 'Carlos': 88};

  // Obter entradas
  for (var entrada in notas.entries) {
    print("${entrada.key}: ${entrada.value}");
  }
  // Output:
  // Ana: 85
  // Bruno: 90
  // Carlos: 88
}
```

---

## Exemplos Práticos

### Exemplo 1: Acessar e Exibir

```dart
void main() {
  var livro = {
    'titulo': 'Clean Code',
    'autor': 'Robert C. Martin',
    'ano': 2008,
    'paginas': 464
  };

  print("=== Informações do Livro ===");
  print("Título: ${livro['titulo']}");
  print("Autor: ${livro['autor']}");
  print("Ano: ${livro['ano']}");
  print("Páginas: ${livro['paginas']}");
}
```

### Exemplo 2: Acessar Valores Dinâmicos

```dart
void main() {
  var aluno = {
    'nome': 'Pedro',
    'notas': [85, 90, 88],
    'endereco': {
      'rua': 'Av. Paulista',
      'numero': 1000,
      'cidade': 'São Paulo'
    }
  };

  // Acessar valores primitivos
  print("Nome: ${aluno['nome']}");

  // Acessar lista
  print("Notas: ${aluno['notas']}");

  // Acessar map aninhado
  print("Cidade: ${aluno['endereco']['cidade']}");
}
```

### Exemplo 3: Acesso Seguro em Estruturas Aninhadas

```dart
void main() {
  var usuario = {
    'nome': 'Ana',
    'perfil': {
      'bio': 'Desenvolvedora',
      'redes': {
        'twitter': '@ana_dev'
      }
    }
  };

  // Acesso seguro com ?
  print(usuario['perfil']?['redes']?['twitter']);        // @ana_dev
  print(usuario['admin']?['permissoes']?['delete']);     // null (seguro)
  print(usuario['perfil']?['status'] ?? 'não definido'); // não definido
}
```

---

## ✅ Padrões Recomendados

### 1. Para Chaves Garantidas: Acesso Direto

```dart
// ✅ BOM (sabe que chave existe)
var valor = mapa['chave_conhecida'];
```

### 2. Para Chaves Opcionais: Use ?? ou ?

```dart
// ✅ BOM (valor padrão)
var valor = mapa['chave_opcional'] ?? 'padrão';

// ✅ BOM (safe navigation)
var valor = mapa['chave']?['subchave'];
```

### 3. Para Iteração: Use entries, keys ou values

```dart
// ✅ BOM (acesso a ambos)
mapa.entries.forEach((e) => print('${e.key}: ${e.value}'));

// ✅ BOM (apenas chaves)
mapa.keys.forEach((k) => print(k));

// ✅ BOM (apenas valores)
mapa.values.forEach((v) => print(v));
```

### 4. Sempre Validar antes de Acessar Aninhados

```dart
// ✅ BOM
if (usuario?.isNotEmpty ?? false) {
  var nome = usuario['perfil']?['nome'];
}
```

---

## Ver Também
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 05: containsKey](aula05-containskey.md)
- [Aula 06: containsValue](aula06-containsvalue.md)
