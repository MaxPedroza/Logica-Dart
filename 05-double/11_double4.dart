void main() {
    // ========== DECLARAÇÃO DE VARIÁVEIS DOUBLE ==========
    // Declara 'a' com valor 10.5 (Dart infere como double)
    var a = 10.5;
    // Declara 'b' com valor 2.5 (Dart infere como double)
    var b = 2.5;
    
    // ========== OPERAÇÕES ARITMÉTICAS COM DOUBLE ==========
    
    // Operação de SOMA: 10.5 + 2.5 = 13.0
    var soma = a + b;
    // Imprime o resultado da soma
    print(soma);  // Resultado: 13.0

    // Operação de SUBTRAÇÃO: 10.5 - 2.5 = 8.0
    var subtracao = a - b;
    // Imprime o resultado da subtração
    print(subtracao);  // Resultado: 8.0

    // Operação de MULTIPLICAÇÃO: 10.5 * 2.5 = 26.25
    var multiplicacao = a * b;
    // Imprime o resultado da multiplicação
    print(multiplicacao);  // Resultado: 26.25

    // Operação de DIVISÃO: 10.5 / 2.5 = 4.2
    // A divisão de doubles retorna um double com casas decimais
    var divisao = a / b;
    // Imprime o resultado da divisão
    print(divisao);  // Resultado: 4.2
}