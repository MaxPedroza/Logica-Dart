void main() {
    // ========== OPERADORES DE ATRIBUIÇÃO ==========
    // Formas diferentes de somar valores em Dart
    
    // Forma 1: Declaração tradicional com var
    var a = 5; // 'var' deixa o Dart inferir o tipo (int neste caso)

    /* 
       // Forma 2: Soma tradicional
       a = a + 1;          // Atribui a + 1 de volta a 'a'. Resultado: 6
       
       // Forma 3: Operador de atribuição reduzida
       a += 1;             // Equivalente a: a = a + 1. Resultado: 7
       
       // Forma 4: Operador de incremento (forma reduzidíssima)
       a++;                // Incrementa 'a' em 1. Resultado: 8
       
       // Forma 5: Soma tradicional com valor maior
       a = a + 5;          // Atribui a + 5 de volta a 'a'. Resultado: 13
    */
    
    // Imprime o valor de 'a' (que é 5, pois as linhas acima estão comentadas)
    print(a);

    // ========== CONVERSÃO DE STRING PARA INT ==========
    var text = "1";  // Declara uma String com o valor "1"
    
    // Opção 1: int.parse() - Converte String para int
    // var number = int.parse(text);  // Lançaria exceção se text não for um número válido
    
    // Opção 2: int.tryParse() com operador ?? (null coalescing)
    // int.tryParse() retorna null se a conversão falhar
    // O operador ?? retorna 0 se o resultado for null (tratamento de erro seguro)
    var number = int.tryParse(text) ?? 0;  // Converte "1" para 1, ou retorna 0 se falhar
    
    // Soma 'number' (1) com 'a' (5) e imprime o resultado: 6
    print(number + a);
}