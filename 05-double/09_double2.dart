void main() {
    // ========== FORMA 1: DINÂMICA (var sem inicialização) ==========
    // Declara 'a' com 'var' sem inicializar imediatamente
    // A variável fica sem tipo definido até receber um valor
    var a;
    // Atribui o valor 5.55 (double) à variável 'a'
    // Dart infere que 'a' é do tipo double baseado no valor atribuído
    a = 5.55;
    
    // ========== FORMA 2: INFERÊNCIA COM INICIALIZAÇÃO ==========
    // Declara 'b' com 'var' e inicializa imediatamente com 5.55
    // Dart infere automaticamente que é um double baseado no valor inicial
    var b = 5.55;

    // ========== FORMA 3: TIPO EXPLÍCITO SEM INICIALIZAÇÃO ==========
    // Declara explicitamente que 'c' é do tipo 'double'
    // A variável não é inicializada neste momento (será null até receber um valor)
    double c;
    // Atribui o valor 5.55 à variável 'c'
    c = 5.55;

    // ========== FORMA 4: TIPO EXPLÍCITO COM INICIALIZAÇÃO ==========
    // Declara explicitamente que 'd' é do tipo 'double'
    // Inicializa imediatamente com o valor 5.55 na mesma linha
    // Esta é a forma mais clara e recomendada
    double d = 5.55;
}

