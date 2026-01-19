# containsKey - Verificar Chaves

## Índice
- [O que é containsKey](#o-que-é-containskey)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Comparação com Alternativas](#comparação-com-alternativas)

---

## O que é containsKey

O método `containsKey()` verifica se uma **chave específica existe** no map, retornando `true` ou `false`.

---

## Sintaxe Básica

```dart
bool temChave = mapa.containsKey('chave');
// true se a chave existe, false caso contrário
```

---

## Exemplos Práticos

### Exemplo 1: Verificação Simples

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com'
  };

  // Verificar se chaves existem
  print(usuario.containsKey('nome'));     // true
  print(usuario.containsKey('email'));    // true
  print(usuario.containsKey('telefone')); // false
  print(usuario.containsKey('admin'));    // false
}
```

### Exemplo 2: Condição com if

```dart
void main() {
  var config = {
    'servidor': 'localhost',
    'porta': 8080,
    'debug': true
  };

  // Acessar com segurança
  if (config.containsKey('debug')) {
    print("Debug ativado: ${config['debug']}");
  }

  if (config.containsKey('ssl')) {
    print("SSL: ${config['ssl']}");
  } else {
    print("Chave 'ssl' não configurada");
  }
}
```

### Exemplo 3: Verificar Múltiplas Chaves

```dart
void main() {
  var formulario = {
    'nome': 'Maria',
    'email': 'maria@email.com',
    'idade': 28
  };

  // Verificar se todos os campos obrigatórios existem
  var temTodos = formulario.containsKey('nome') &&
                 formulario.containsKey('email') &&
                 formulario.containsKey('idade');

  if (temTodos) {
    print("Formulário completo!");
  } else {
    print("Faltam campos obrigatórios");
  }
}
```

### Exemplo 4: Validação Antes de Processar

```dart
void main() {
  var pedido = {
    'id': 123,
    'produto': 'Notebook',
    'quantidade': 2
  };

  // Validar antes de acessar
  if (pedido.containsKey('preco')) {
    var total = pedido['quantidade'] * pedido['preco'];
    print("Total: $total");
  } else {
    print("Preço não informado - não é possível calcular total");
  }
}
```

### Exemplo 5: Filtrar Maps com Chaves Específicas

```dart
void main() {
  var usuarios = [
    {'id': 1, 'nome': 'Ana', 'email': 'ana@email.com'},
    {'id': 2, 'nome': 'Bruno'},
    {'id': 3, 'nome': 'Carlos', 'email': 'carlos@email.com'}
  ];

  // Encontrar usuários que têm email
  var comEmail = usuarios.where((u) => u.containsKey('email')).toList();

  print("Usuários com email:");
  for (var user in comEmail) {
    print("- ${user['nome']}: ${user['email']}");
  }
  // Output:
  // Usuários com email:
  // - Ana: ana@email.com
  // - Carlos: carlos@email.com
}
```

---

## Comparação com Alternativas

### Vs. Acesso Direto com ??

```dart
void main() {
  var mapa = {'a': 1, 'b': 2};

  // ❌ Não recomendado (menos legível)
  var valor = mapa['c'] ?? 'não existe';

  // ✅ Melhor (mais claro)
  if (mapa.containsKey('c')) {
    var valor = mapa['c'];
  } else {
    var valor = 'não existe';
  }
}
```

### Vs. Safe Navigation com ?.

```dart
void main() {
  var usuario = {'nome': 'Ana', 'perfil': {'bio': 'Dev'}};

  // ❌ Pode não ser claro
  var bio = usuario['perfil']?['bio'];

  // ✅ Mais explícito
  if (usuario.containsKey('perfil')) {
    var perfil = usuario['perfil'];
    if (perfil is Map && perfil.containsKey('bio')) {
      var bio = perfil['bio'];
    }
  }
}
```

---

## ✅ Padrões Recomendados

### 1. Sempre Verificar Chaves Opcionais

```dart
// ✅ BOM
if (mapa.containsKey('opcional')) {
  processar(mapa['opcional']);
}

// ❌ EVITE (pode ser null)
processar(mapa['opcional']);
```

### 2. Validação em Lote

```dart
// ✅ BOM (função auxiliar)
bool temTodas(Map map, List<String> chaves) {
  return chaves.every((chave) => map.containsKey(chave));
}

if (temTodas(usuario, ['nome', 'email', 'telefone'])) {
  print("Todos os campos obrigatórios presentes");
}
```

### 3. Com Getter Auxiliar

```dart
// ✅ BOM (extensão ou método)
extension MapHelper on Map {
  bool temCampo(String campo) => this.containsKey(campo);
  
  dynamic obter(String campo, [dynamic padrao]) {
    return containsKey(campo) ? this[campo] : padrao;
  }
}

// Usar
var idade = usuario.obter('idade', 18);
```

### 4. Para Segurança em Estruturas Aninhadas

```dart
// ✅ BOM
if (dados.containsKey('usuario') &&
    dados['usuario'] is Map &&
    dados['usuario'].containsKey('nome')) {
  print(dados['usuario']['nome']);
}

// ✅ MAIS SIMPLES (com safe navigation)
print(dados['usuario']?['nome']);
```

---

## Tabela de Comparação: Métodos de Verificação

| Método | Retorna | Verifica |
|--------|---------|----------|
| `containsKey(chave)` | bool | Se chave existe |
| `containsValue(valor)` | bool | Se valor existe |
| `mapa[chave]` | valor ou null | O valor (ou null) |
| `mapa[chave] ?? padrão` | valor ou padrão | Com valor padrão |

---

## Ver Também
- [Aula 04: Acessar Valores](aula04-acesso.md)
- [Aula 06: containsValue](aula06-containsvalue.md)
- [Aula 12: length e isEmpty](aula12-length-isempty.md)
