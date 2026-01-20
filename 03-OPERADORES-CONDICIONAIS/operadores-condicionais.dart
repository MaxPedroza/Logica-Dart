void main(){

//==================AULA 01 - SWITCH CASE=======================

  var indexMonth - 1;
  String month;
  switch (indexMonth) {
    case 1:
      month = "Janeiro"
      break;
    case 2:
      month = "Fevereiro"
      break;
    default:
      month = "VALOR INVÁLIDO"
  } 
  print(month);

  switch (indexMonth) {
    case 1:                                                                              //Utilizando bloco de código
    {
      month = "Janeiro"
      final a = month;
      break;
    }
      
    case 2:
    {
      month = "Fevereiro"
      final a = month;
      break;
    }
  }

//===============AULA 02 - OPERADOR CONDICIONAL =================

  var idade = 18;
  String status = (idade >= 18) ? "Maior de idade" : "Menor de idade";
  print(status);



//================AULA 03 - OPERADOR TERNARIO ===================  
  
  int a = 5;
  int b = 10;
  String resultado = (a > b) ? "A é maior que B" : "B é maior que A";
  print(resultado);
  
  var numero = 10;
  String parOuImpar = (numero % 2 == 0) ? "Par" : "Ímpar";
  print(parOuImpar);




}