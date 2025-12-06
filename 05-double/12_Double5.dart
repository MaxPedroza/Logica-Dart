void main() {
  // Declara uma variável double 'a' com valor inicial 5.0
  var a = 5.0;
  
  // ========== FORMAS DE INCREMENTAR O VALOR DE 'a' EM 1 ==========
  
  // Forma 1: Atribuição tradicional
  // a = a + 1 significa: a recebe o seu valor atual (5.0) + 1, resultando em 6.0
  a = a + 1;

  // Forma 2: Operador de incremento (reduzida)
  // a++ incrementa 'a' em 1, resultando em 7.0
  a++;
  print(a);  // Imprime: 7.0

  // ========== FORMAS DE ADICIONAR 6 AO VALOR DE 'a' ==========
  
  // Forma 1: Atribuição tradicional
  // a = a + 6 significa: a recebe o seu valor atual (7.0) + 6, resultando em 13.0
  a = a + 6;
  
  // Forma 2: Operador de atribuição composta
  // a += 6 é equivalente a: a = a + 6, resultando em 19.0
  a += 6;
  print(a);  // Imprime: 19.0

  // ========== CONVERSÃO DE STRING PARA DOUBLE (COMENTADO) ==========
  /* 
  // Esta seção está comentada como exemplo de tratamento de erro
  var texto = "A10.55";  // String inválida (contém letra 'A')
  // double.tryParse() tenta converter, mas retorna null se falhar
  // O operador ?? (null coalescing) retorna 0.0 se a conversão falhar
  var number = double.tryParse(texto) ?? 0.0;
  number += a;
  print(number);
  */

  // ========== CONVERSÃO DE STRING PARA DOUBLE (ATIVO) ==========
  
  // Declara uma String contendo um número válido em formato double
  var texto1 = "10.55";
  
  // double.parse() converte a String "10.55" para o tipo double
  // Obs: double.parse() lançará exceção se a String não for um número válido
  var number1 = double.parse(texto1);
  
  // Adiciona o valor de 'a' (19.0) ao valor de number1 (10.55)
  // number1 = number1 + a, resultando em 29.55
  number1 += a;
  
  // Imprime o resultado final da soma
  print(number1);  // Imprime: 29.55
}