# elementAt - Acessar Item por Índice

## Índice
- [Método elementAt()](#método-elementat)
- [Usando elementAt()](#usando-elementat)
- [Casos de Uso](#casos-de-uso)

---

## Método elementAt()

Retorna o elemento na posição especificada:

### Sintaxe

```dart
var elemento = minhaLista.elementAt(indice);
```

### Características

- **Retorna:** O elemento no índice
- **Índice:** Baseado em 0
- **Erro:** Se índice inválido
- **Similar a:** `lista[indice]` (colchetes)

---

## Usando elementAt()

### Acesso Simples

```dart
var frutas = <String>["Maçã", "Banana", "Laranja", "Uva"];
print("Lista de frutas: $frutas");

var frutaNoIndice2 = frutas.elementAt(2);
print("Fruta no índice 2: $frutaNoIndice2");
// Output:
// Lista de frutas: [Maçã, Banana, Laranja, Uva]
// Fruta no índice 2: Laranja
```

### Primeira Posição

```dart
var numeros = [10, 20, 30, 40];

var primeiro = numeros.elementAt(0);
print("Primeiro elemento: $primeiro");
// Output: Primeiro elemento: 10
```

### Última Posição

```dart
var lista = [100, 200, 300];

var ultimo = lista.elementAt(lista.length - 1);
print("Último elemento: $ultimo");
// Output: Último elemento: 300
```

---

## Casos de Uso

### Acessar Dados de Usuário

```dart
var usuarios = ["Ana Silva", "Bruno Costa", "Carlos Santos"];

var nomeSegundo = usuarios.elementAt(1);
print("Segundo usuário: $nomeSegundo");
// Output: Segundo usuário: Bruno Costa
```

### Pegar Elemento Específico

```dart
var cores = ["vermelho", "verde", "azul"];

var segundaCor = cores.elementAt(1);
print("Segunda cor: $segundaCor");
// Output: Segunda cor: verde
```

### Iterar com Índice

```dart
var nomes = ["Ana", "Bruno", "Carlos"];

for (int i = 0; i < nomes.length; i++) {
  var nome = nomes.elementAt(i);
  print("Posição $i: $nome");
}
// Output:
// Posição 0: Ana
// Posição 1: Bruno
// Posição 2: Carlos
```

### Validar Acesso

```dart
var lista = [10, 20, 30];

int indice = 5;

try {
  var elemento = lista.elementAt(indice);
  print("Elemento: $elemento");
} catch (e) {
  print("Índice $indice inválido");
}
// Output: Índice 5 inválido
```

---

## elementAt() vs []

| Sintaxe | Tipo | Erro |
|--------|------|------|
| `lista[0]` | Subscript | RangeError |
| `lista.elementAt(0)` | Método | RangeError |

Ambos funcionam igual, apenas sintaxe diferente:

```dart
var lista = [10, 20, 30];

var valor1 = lista[1];           // 20
var valor2 = lista.elementAt(1); // 20
```

---

## Verificação de Índice

### Usar Método Seguro

```dart
int? acessarSeguro(List lista, int indice) {
  if (indice >= 0 && indice < lista.length) {
    return lista.elementAt(indice);
  }
  return null;
}

var numeros = [10, 20, 30];

var valor = acessarSeguro(numeros, 1);
print("Valor encontrado: $valor");
// Output: Valor encontrado: 20
```

### Com Validação

```dart
var lista = [100, 200, 300];

int indice = 2;

if (indice < lista.length) {
  print("Elemento: ${lista.elementAt(indice)}");
} else {
  print("Índice inválido");
}
// Output: Elemento: 300
```

---

## ✅ Padrões Recomendados

### Função Segura de Acesso

```dart
T? obterElemento<T>(List<T> lista, int indice) {
  try {
    return lista.elementAt(indice);
  } catch (e) {
    return null;
  }
}

var nomes = ["Ana", "Bruno"];

var nome = obterElemento(nomes, 0);
var invalido = obterElemento(nomes, 5);

print("Nome: $nome");
print("Inválido: $invalido");
// Output:
// Nome: Ana
// Inválido: null
```

### Mapear com Índices

```dart
var items = ["A", "B", "C"];
var resultado = <String>[];

for (int i = 0; i < items.length; i++) {
  var item = items.elementAt(i);
  resultado.add("[$i]: $item");
}

print(resultado);
// Output: [[0]: A, [1]: B, [2]: C]
```

### Pegar Múltiplos Elementos

```dart
List<T> obterMultiplos<T>(List<T> lista, List<int> indices) {
  var resultado = <T>[];
  
  for (var i in indices) {
    if (i >= 0 && i < lista.length) {
      resultado.add(lista.elementAt(i));
    }
  }
  
  return resultado;
}

var numeros = [10, 20, 30, 40, 50];
var indices = [0, 2, 4];
var selecionados = obterMultiplos(numeros, indices);

print("Selecionados: $selecionados");
// Output: Selecionados: [10, 30, 50]
```

---

## Ver Também
- [Aula 05: removeAt](aula05-removeat.md) - Remover por índice
- [Aula 10: indexOf](aula10-indexof.md) - Encontrar posição
- [Aula 07: contains](aula07-contains.md) - Verificar existência

