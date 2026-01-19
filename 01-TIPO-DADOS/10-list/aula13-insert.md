# insert e insertAll - Inserir Itens em Posição

## Índice
- [Método insert()](#método-insert)
- [Método insertAll()](#método-insertall)
- [Usando insert() e insertAll()](#usando-insert-e-insertall)
- [Casos de Uso](#casos-de-uso)

---

## Método insert()

Insere um item em uma posição específica:

### Sintaxe

```dart
minhaLista.insert(indice, elemento);
```

### Características

- **Retorna:** void (não retorna nada)
- **Efeito:** Insere e desloca itens
- **Posição:** Baseada em 0
- **Modifica:** A lista original

---

## Método insertAll()

Insere múltiplos itens em uma posição específica:

### Sintaxe

```dart
minhaLista.insertAll(indice, elementos);
```

### Características

- **Retorna:** void (não retorna nada)
- **Efeito:** Insere lista e desloca itens
- **Posição:** Baseada em 0
- **Parâmetro:** Iterable (lista, set, etc)

---

## Usando insert() e insertAll()

### insert - Inserção Simples

```dart
var numerosInsert = <int>[1, 2, 4, 5];
print("Lista inicial: $numerosInsert");

print("Inserindo o número 3 na posição índice 2...");
numerosInsert.insert(2, 3);
print("Lista atualizada: $numerosInsert");
// Output:
// Lista inicial: [1, 2, 4, 5]
// Inserindo o número 3 na posição índice 2...
// Lista atualizada: [1, 2, 3, 4, 5]
```

### insertAll - Inserção Múltipla

```dart
var lista1 = [1, 2, 5, 6];
print("Lista inicial: $lista1");

lista1.insertAll(2, [3, 4]);
print("Após insertAll em posição 2: $lista1");
// Output:
// Lista inicial: [1, 2, 5, 6]
// Após insertAll em posição 2: [1, 2, 3, 4, 5, 6]
```

### Inserir no Início

```dart
var nomes = ["Bruno", "Carlos"];

nomes.insert(0, "Ana");
print("Após inserir 'Ana' no início: $nomes");
// Output: Após inserir 'Ana' no início: [Ana, Bruno, Carlos]
```

### Inserir no Final

```dart
var cores = ["vermelho", "verde"];

cores.insert(cores.length, "azul");
print("Após inserir 'azul' no final: $cores");
// Output: Após inserir 'azul' no final: [vermelho, verde, azul]
```

---

## Casos de Uso

### Inserir na Posição de Classificação

```dart
var notas = [85, 92, 78];

// Inserir 88 na posição correta (mantendo ordem)
notas.insert(2, 88);
print("Notas: $notas");
// Output: Notas: [85, 92, 88, 78]
```

### Inserir Item em Lista Ordenada

```dart
var numeros = [10, 20, 40, 50];

// Inserir 30 na posição certa
numeros.insert(2, 30);
print("Sequência: $numeros");
// Output: Sequência: [10, 20, 30, 40, 50]
```

### Adicionar Menu Item

```dart
var menu = ["Arquivo", "Editar", "Ajuda"];

// Inserir "Exibir" entre "Editar" e "Ajuda"
menu.insert(2, "Exibir");
print("Menu: $menu");
// Output: Menu: [Arquivo, Editar, Exibir, Ajuda]
```

### Inserir Múltiplos Cabeçalhos

```dart
var dados = ["Linha 1", "Linha 2"];

dados.insertAll(0, ["Cabeçalho 1", "Cabeçalho 2"]);
print("Dados com cabeçalho: $dados");
// Output: Dados com cabeçalho: [Cabeçalho 1, Cabeçalho 2, Linha 1, Linha 2]
```

### Intercalar Listas

```dart
var pares = [2, 4, 6];
var impares = [1, 3, 5];

// Inserir ímpares entre pares
pares.insertAll(1, [impares[0], impares[1]]);
print("Intercalado: $pares");
// Output: Intercalado: [2, 1, 3, 4, 6]
```

---

## insert vs Alternativas

| Método | Inserção | Parâmetro |
|--------|----------|-----------|
| `insert()` | Um item | Elemento |
| `insertAll()` | Múltiplos | Lista |
| `add()` | Final apenas | Elemento |
| `addAll()` | Final apenas | Lista |

```dart
var lista = [1, 2, 5];

lista.insert(2, 3);        // [1, 2, 3, 5]
lista.insertAll(3, [4]);   // [1, 2, 3, 4, 5]
```

---

## Validação de Índice

### Verificar Antes de Inserir

```dart
void inserirSeguro(List lista, int indice, dynamic elemento) {
  if (indice >= 0 && indice <= lista.length) {
    lista.insert(indice, elemento);
    print("Inserido com sucesso");
  } else {
    print("Índice inválido");
  }
}

var numeros = [10, 20, 30];
inserirSeguro(numeros, 1, 15);
inserirSeguro(numeros, 10, 40);  // Inválido

print("Lista: $numeros");
// Output:
// Inserido com sucesso
// Índice inválido
// Lista: [10, 15, 20, 30]
```

---

## ✅ Padrões Recomendados

### Função Envolvida

```dart
void inserirNoLugar(List<int> lista, int elemento) {
  int indice = 0;
  
  // Encontrar posição para manter ordem
  for (int i = 0; i < lista.length; i++) {
    if (lista[i] > elemento) {
      indice = i;
      break;
    }
    indice = i + 1;
  }
  
  lista.insert(indice, elemento);
}

var numeros = [10, 30, 50];
inserirNoLugar(numeros, 20);
inserirNoLugar(numeros, 40);

print("Números ordenados: $numeros");
// Output: Números ordenados: [10, 20, 30, 40, 50]
```

### Inserir com Validação

```dart
bool inserirSePossivel(List lista, int indice, dynamic elemento) {
  if (indice >= 0 && indice <= lista.length) {
    lista.insert(indice, elemento);
    return true;
  }
  return false;
}

var items = [1, 2, 3];

if (inserirSePossivel(items, 1, 1.5)) {
  print("Inserido: $items");
} else {
  print("Falha na inserção");
}
// Output: Inserido: [1, 1.5, 2, 3]
```

### Intercalar Listas com insertAll

```dart
List<int> intercalar(List<int> l1, List<int> l2) {
  var resultado = [...l1];
  
  for (int i = 0; i < l2.length; i++) {
    resultado.insert(i * 2 + 1, l2[i]);
  }
  
  return resultado;
}

var pares = [2, 4, 6];
var impares = [1, 3, 5];

var intercalado = intercalar(pares, impares);
print("Intercalado: $intercalado");
// Output: Intercalado: [2, 1, 4, 3, 6, 5]
```

---

## Ver Também
- [Aula 02: add](aula02-add.md) - Adicionar no final
- [Aula 03: addAll](aula03-addall.md) - Adicionar múltiplos no final
- [Aula 05: removeAt](aula05-removeat.md) - Remover por índice

