void main() {
  aula1();
  aula2();
}

aula1() {
  //==============AULA1-FUNCAO=================
  print("primeira aula de função");
  print("primeira aula de função");
  print("primeira aula de função");
  print("primeira aula de função");
}

aula2() {
  //==============AULA2-FUNCAO SYNC=================

  print("Função sync1");
  for (var i = 0; i < 100; i++) {
    print("$i - Função sync");
  }
  print("Função sync2");
  for (var i = 0; i < 100; i++) {
    print("$i - Função sync");
  }
  print("Função sync3");
  for (var i = 0; i < 100; i++) {
    print("$i - Função sync");
  }
  print("Função sync4");
  for (var i = 0; i < 100; i++) {
    print("$i - Função sync");
  }
}

aula3() {
  //==============AULA3-FUNCAO ASYNC=================
}
