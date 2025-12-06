void main() {
    // TIPO INT - Números inteiros (sem casas decimais)
    // O tipo 'int' representa números inteiros positivos, negativos ou zero
    // Exemplos: -100, -5, 0, 42, 1000
    var a = 1;

    // Declaração explícita do tipo 'int'
    // 'var' deixa o Dart inferir o tipo (neste caso int)
    // 'int' declara explicitamente que é um número inteiro
    int b  = 1;
    
    // 'late' permite declarar a variável sem inicializar imediatamente
    // A variável c será inicializada depois (neste caso com valor 3)
    late int  c;    // forma tardia de inicialização
    c = 3;
}

