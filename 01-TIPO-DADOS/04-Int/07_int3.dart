void main() {
    // ========== DECLARAÇÃO DAS VARIÁVEIS ==========
    // Declara uma variável inteira 'a' com valor 10
    var a = 10;
    // Declara uma variável inteira 'b' com valor 3
    var b = 3;
    
    // ========== OPERAÇÕES ARITMÉTICAS ==========
    
    // Operação de SOMA: 10 + 3 = 13
    var somar = a + b;  // operação de soma
    print(somar);       // Imprime: 13

    // Operação de SUBTRAÇÃO: 10 - 3 = 7
    var subtrair = a - b;  // operação de subtração
    print(subtrair);       // Imprime: 7

    // Operação de MULTIPLICAÇÃO: 10 * 3 = 30
    var multiplicar = a * b;  // operação de multiplicação
    print(multiplicar);        // Imprime: 30
    
    // Operação de DIVISÃO: 10 / 3 = 3.3333... (retorna double com casas decimais)
    var dividir = a / b;  // operação de divisão
    print(dividir);       // Imprime: 3.3333333333333335
    
    // ========== DIVISÃO INTEIRA ==========
    // Operação de DIVISÃO INTEIRA: 10 ~/ 3 = 3 (retorna apenas a parte inteira)
    // O operador ~/ realiza divisão inteira (retorna apenas a parte inteira sem decimais)
    // O til (~) faz parte da sintaxe do operador, representando "truncamento" do resultado
    var dividir2 = a  ~/ b;  // operação de divisão inteira
    print(dividir);          // Imprime: 3.3333333333333335 (imprime dividir, não dividir2)
}