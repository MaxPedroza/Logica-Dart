# addAll - Adicionar Múltiplos Pares

## Índice
- [O que é addAll](#o-que-é-addall)
- [Sintaxe Básica](#sintaxe-básica)
- [Exemplos Práticos](#exemplos-práticos)
- [Sobrescrita de Chaves](#sobrescrita-de-chaves)
- [Comparação com Alternativas](#comparação-com-alternativas)

---

## O que é addAll

O método `addAll()` adiciona todos os pares chave-valor de outro map (ou Iterable) ao map atual, **modificando o map original**.

---

## Sintaxe Básica

```dart
mapa1.addAll(mapa2);
// Adiciona todos os pares de mapa2 em mapa1
```

---

## Exemplos Práticos

### Exemplo 1: Mesclar Dois Maps

```dart
void main() {
  var usuario = {
    'id': 1,
    'nome': 'Ana'
  };

  var info_adicional = {
    'email': 'ana@email.com',
    'telefone': '1234-5678'
  };

  // Adicionar todos os pares de info_adicional em usuario
  usuario.addAll(info_adicional);

  print("Usuário após addAll: $usuario");
  // Output: Usuário após addAll: {id: 1, nome: Ana, email: ana@email.com, telefone: 1234-5678}
}
```

### Exemplo 2: Mesclar Múltiplos Maps

```dart
void main() {
  var config = {'app': 'MeuApp', 'versao': '1.0'};

  config.addAll({'idioma': 'português', 'tema': 'escuro'});
  config.addAll({'som': true, 'vibracao': false});

  print("Configuração final: $config");
  // Output: Configuração final: {app: MeuApp, versao: 1.0, idioma: português, tema: escuro, som: true, vibracao: false}
}
```

### Exemplo 3: Adicionar de Lista de Mapas

```dart
void main() {
  var resultado = {'status': 'sucesso'};

  var respostas = [
    {'dados': 'informação 1'},
    {'timestamp': '2024-01-19'},
    {'usuario': 'Ana'}
  ];

  for (var resp in respostas) {
    resultado.addAll(resp);
  }

  print("Resultado: $resultado");
  // Output: Resultado: {status: sucesso, dados: informação 1, timestamp: 2024-01-19, usuario: Ana}
}
```

---

## Sobrescrita de Chaves

Se a chave **já existe**, o valor é **sobrescrito**.

```dart
void main() {
  var mapa1 = {'a': 1, 'b': 2, 'c': 3};
  var mapa2 = {'b': 20, 'c': 30, 'd': 40}; // 'b' e 'c' vão sobrescrever

  mapa1.addAll(mapa2);

  print("Mapa1 após addAll: $mapa1");
  // Output: Mapa1 após addAll: {a: 1, b: 20, c: 30, d: 40}
}
```

### Evitar Sobrescrita

Se não quer sobrescrever, verifique antes:

```dart
void main() {
  var mapa1 = {'a': 1, 'b': 2};
  var mapa2 = {'b': 20, 'c': 30};

  // Adicionar apenas pares cuja chave não existe em mapa1
  mapa2.forEach((chave, valor) {
    if (!mapa1.containsKey(chave)) {
      mapa1[chave] = valor;
    }
  });

  print("Mapa1 sem sobrescrita: $mapa1");
  // Output: Mapa1 sem sobrescrita: {a: 1, b: 2, c: 30}
}
```

---

## Comparação com Alternativas

### Vs. Spread Operator (...)

```dart
void main() {
  var mapa1 = {'a': 1, 'b': 2};
  var mapa2 = {'c': 3, 'd': 4};

  // ❌ addAll modifica mapa1
  mapa1.addAll(mapa2);
  print("Com addAll: $mapa1");
  // Output: Com addAll: {a: 1, b: 2, c: 3, d: 4}

  // ✅ Spread cria novo map (não modifica originals)
  var mapa3 = {'a': 1, 'b': 2};
  var mapa4 = {'c': 3, 'd': 4};
  var merged = {...mapa3, ...mapa4};
  print("Com spread: $merged");
  print("mapa3 original: $mapa3");
  // Output:
  // Com spread: {a: 1, b: 2, c: 3, d: 4}
  // mapa3 original: {a: 1, b: 2}
}
```

### Vs. addEntries

```dart
void main() {
  var mapa = {'a': 1};

  // ❌ addEntries: precisa de List<MapEntry>
  mapa.addEntries([
    MapEntry('b', 2),
    MapEntry('c', 3)
  ]);

  // ✅ addAll: usa outro Map diretamente
  var mapa2 = {'a': 1};
  mapa2.addAll({'b': 2, 'c': 3});

  print("addEntries: $mapa");
  print("addAll: $mapa2");
  // Output:
  // addEntries: {a: 1, b: 2, c: 3}
  // addAll: {a: 1, b: 2, c: 3}
}
```

---

## ✅ Padrões Recomendados

### 1. Quando Modificar Map Original: Use addAll

```dart
// ✅ BOM (modificar e continuar usando)
config.addAll({'debug': true, 'logLevel': 'info'});
```

### 2. Quando NÃO Quer Modificar: Use Spread

```dart
// ✅ BOM (criar novo map)
var merged = {...baseConfig, ...newConfig};
```

### 3. Para Múltiplos Maps

```dart
// ✅ BOM
var final = {};
final.addAll(config1);
final.addAll(config2);
final.addAll(config3);

// ✅ TAMBÉM BOM (mais conciso)
var final = {...config1, ...config2, ...config3};
```

### 4. Com Conditional

```dart
// ✅ BOM
var dados = {'base': 'valor'};
if (usuarioAdmin) {
  dados.addAll({'admin': true, 'permissoes': 'total'});
}

// ✅ TAMBÉM BOM (com spread)
var dados = {
  'base': 'valor',
  if (usuarioAdmin) ...{'admin': true, 'permissoes': 'total'}
};
```

---

## Ver Também
- [Aula 01: Declaração de Maps](aula01-declaracao.md)
- [Aula 02: Adicionando Pares (addEntry)](aula02-addentry.md)
- [Aula 09: update](aula09-update.md)
