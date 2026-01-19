# clear - Limpar Map

## Índice
- [O que é clear](#o-que-é-clear)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Casos de Uso](#casos-de-uso)

---

## O que é clear

O método `clear()` remove **todos os pares** do map, deixando-o vazio. Não retorna nada (void).

---

## Sintaxe Básica

```dart
mapa.clear();
// Remove todos os pares do map
// Map fica vazio e pronto para novos dados
```

---

## Exemplos Práticos

### Exemplo 1: Limpar Simples

```dart
void main() {
  var dados = {
    'id': 1,
    'nome': 'Ana',
    'email': 'ana@email.com',
    'ativo': true
  };

  print("Antes: $dados");
  print("Tamanho antes: ${dados.length}");

  // Limpar map
  dados.clear();

  print("Depois: $dados");  // {}
  print("Tamanho depois: ${dados.length}");  // 0
  print("Está vazio? ${dados.isEmpty}");  // true
}
```

### Exemplo 2: Limpar Cache

```dart
void main() {
  var cache = {
    'usuario_1': {'nome': 'Ana', 'dados': '...'},
    'usuario_2': {'nome': 'Bruno', 'dados': '...'},
    'usuario_3': {'nome': 'Carlos', 'dados': '...'}
  };

  print("Cache com ${cache.length} itens");

  // Limpar cache quando necessário (logout, reset, etc)
  cache.clear();

  print("Cache limpo, agora vazio: ${cache.isEmpty}");
}
```

### Exemplo 3: Limpar e Reutilizar

```dart
void main() {
  var sessao = {
    'id': '123',
    'usuario': 'Ana',
    'token': 'abc123'
  };

  print("Sessão ativa: $sessao");

  // Limpar sessão
  sessao.clear();
  print("Sessão após logout: $sessao");

  // Reutilizar map para nova sessão
  sessao['id'] = '456';
  sessao['usuario'] = 'Bruno';
  sessao['token'] = 'xyz789';
  print("Nova sessão: $sessao");
}
```

### Exemplo 4: Limpar com Condição (Alternativa)

```dart
void main() {
  var configuracoes = {
    'tema': 'escuro',
    'idioma': 'português',
    'debug': true,
    'som': false,
    'vibracao': true
  };

  // Se precisa limpar apenas algumas configs
  var nao_resetar = ['tema', 'idioma'];

  // Opção 1: removeWhere para remover seletivamente
  configuracoes.removeWhere((k, v) => !nao_resetar.contains(k));
  print("Config após remover seletivamente: $configuracoes");
  // Output: Config após remover seletivamente: {tema: escuro, idioma: português}

  // Opção 2: clear total
  configuracoes.clear();
  print("Config após clear: $configuracoes");  // {}
}
```

### Exemplo 5: Verificar Antes e Depois

```dart
void main() {
  var dados = {'a': 1, 'b': 2, 'c': 3};

  // Verificar estado
  print("Dados contém 'a'? ${dados.containsKey('a')}");  // true
  print("Dados vazio? ${dados.isEmpty}");  // false
  print("Tamanho: ${dados.length}");  // 3

  // Limpar
  dados.clear();

  // Verificar novamente
  print("Dados contém 'a'? ${dados.containsKey('a')}");  // false
  print("Dados vazio? ${dados.isEmpty}");  // true
  print("Tamanho: ${dados.length}");  // 0
}
```

---

## Casos de Uso Comuns

### 1. Logout de Usuário

```dart
void logout(Map<String, dynamic> sessao) {
  // Limpar dados da sessão
  sessao.clear();
  print("Sessão encerrada");
}

void main() {
  var sessao = {
    'usuario': 'Ana',
    'token': 'abc123',
    'timestamp': 1234567890
  };

  logout(sessao);
}
```

### 2. Reset de Configurações

```dart
void resetarConfiguracao() {
  var config = {
    'tema': 'claro',
    'idioma': 'inglês',
    'tamanho_fonte': 12
  };

  // Restaurar padrões
  config.clear();
  config['tema'] = 'claro';
  config['idioma'] = 'português';
  config['tamanho_fonte'] = 14;
}
```

### 3. Limpar Buffer/Cache

```dart
class CacheTemporario {
  final Map<String, dynamic> cache = {};

  void adicionar(String chave, dynamic valor) {
    cache[chave] = valor;
  }

  void limpar() {
    cache.clear();
    print("Cache temporário limpo");
  }
}

void main() {
  var temp = CacheTemporario();
  temp.adicionar('arquivo1', 'dados');
  temp.adicionar('arquivo2', 'mais dados');
  temp.limpar();  // Cache vazio
}
```

---

## ⚠️ Cuidados Importantes

### Diferença: clear vs remove

```dart
void main() {
  var map1 = {'a': 1, 'b': 2, 'c': 3};
  var map2 = {'a': 1, 'b': 2, 'c': 3};

  // remove: remove UM par específico
  map1.remove('a');
  print("Após remove('a'): $map1");  // {b: 2, c: 3}

  // clear: remove TODOS os pares
  map2.clear();
  print("Após clear(): $map2");  // {}
}
```

### Não Há Volta

```dart
void main() {
  var dados = {'importante': 'valor'};

  // ⚠️ CUIDADO: clear é irreversível!
  dados.clear();

  // Não é possível recuperar os dados
  // Salve antes de fazer clear se precisar dos dados
}
```

---

## ✅ Padrões Recomendados

### 1. Salvar Antes de Limpar (se necessário)

```dart
// ✅ BOM
var backup = Map.from(mapa);
mapa.clear();
```

### 2. Verificar Antes de Limpar

```dart
// ✅ BOM
if (mapa.isNotEmpty) {
  mapa.clear();
}
```

### 3. Use Apenas Quando Realmente Necessário

```dart
// ✅ BOM (casos específicos)
// - Logout/Logout
// - Reset de configurações
// - Limpar cache
// - Liberar memória
```

### 4. Alternativa: Criar Novo Map

```dart
// ✅ TAMBÉM BOM (em vez de clear)
var map1 = {'a': 1, 'b': 2};
var map2 = <String, int>{};  // Novo map vazio
```

---

## Ver Também
- [Aula 07: remove](aula07-remove.md)
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 12: length e isEmpty](aula12-length-isempty.md)
