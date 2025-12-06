// ========== BOAS E MÁS PRÁTICAS COM VARIÁVEIS DOUBLE ==========

void main() {
    // ========== BOAS PRÁTICAS ==========
    
    // Forma 1: Usar 'var' deixa o Dart inferir o tipo automaticamente
    // Dart identifica 1.0 como double e ajusta o tipo de 'a' automaticamente
    var a = 1.0;
    
    // Forma 2: Declaração explícita do tipo 'double' com inicialização
    // Esta é a forma mais clara e recomendada: tipo explícito + inicialização na mesma linha
    double b ;
    
    // Atribuição de  valor à variável 'b'
    b = 1.0;

    // ========== MÁ PRÁTICA ==========
    
    // Declarar o tipo explicitamente mas sem inicializar imediatamente
    // Deixa a variável sem um valor definido até que seja atribuído
    // Não é recomendado porque deixa a variável null desnecessariamente
    double c = 1.0;
}