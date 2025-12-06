void main() {
    // TIPO BOOL - Valores booleanos (verdadeiro ou falso)
    // O tipo 'bool' aceita apenas dois valores: true (verdadeiro) ou false (falso)
    // Geralmente é usado em comparações e condições lógicas
    
    final a = "max";
    final b =  "dev";

    // O operador == compara se os valores são iguais
    // Retorna true se são iguais, false se são diferentes
    // Neste caso: "max" == "dev" retorna false
    print(a==b);

    // ========== DECLARANDO VARIÁVEIS BOOL ==========
    
    print("\n========== DECLARANDO VARIÁVEIS BOOL ==========\n");
    
    // Declaração com tipos explícitos
    bool ligado = true;
    bool desligado = false;
    
    print("ligado: $ligado");
    print("desligado: $desligado");
    
    // Usando 'var' - Dart infere o tipo como bool
    var ativo = true;
    var inativo = false;
    
    print("ativo: $ativo");
    print("inativo: $inativo");

    // ========== OPERADORES DE COMPARAÇÃO ==========
    
    print("\n========== OPERADORES DE COMPARAÇÃO ==========\n");
    
    int numero1 = 10;
    int numero2 = 20;
    
    // Igualdade (==)
    print("numero1 == numero2: ${numero1 == numero2}");  // false
    print("numero1 == 10: ${numero1 == 10}");            // true
    
    // Desigualdade (!=)
    print("numero1 != numero2: ${numero1 != numero2}");  // true
    
    // Maior que (>)
    print("numero1 > numero2: ${numero1 > numero2}");    // false
    print("numero2 > numero1: ${numero2 > numero1}");    // true
    
    // Menor que (<)
    print("numero1 < numero2: ${numero1 < numero2}");    // true
    
    // Maior ou igual (>=)
    print("numero1 >= 10: ${numero1 >= 10}");            // true
    print("numero1 >= numero2: ${numero1 >= numero2}");  // false
    
    // Menor ou igual (<=)
    print("numero1 <= numero2: ${numero1 <= numero2}");  // true

    // ========== COMPARAÇÃO COM STRINGS ==========
    
    print("\n========== COMPARAÇÃO COM STRINGS ==========\n");
    
    String nome1 = "João";
    String nome2 = "Maria";
    String nome3 = "João";
    
    print("nome1 == nome2: ${nome1 == nome2}");  // false
    print("nome1 == nome3: ${nome1 == nome3}");  // true
    print("nome1 != nome2: ${nome1 != nome2}");  // true

    // ========== OPERADORES LÓGICOS ==========
    
    print("\n========== OPERADORES LÓGICOS ==========\n");
    
    bool condicao1 = true;
    bool condicao2 = false;
    bool condicao3 = true;
    
    // Operador AND (&&) - Retorna true se TODOS forem true
    print("condicao1 && condicao3: ${condicao1 && condicao3}");  // true
    print("condicao1 && condicao2: ${condicao1 && condicao2}");  // false
    
    // Operador OR (||) - Retorna true se ALGUM for true
    print("condicao1 || condicao2: ${condicao1 || condicao2}");  // true
    print("condicao2 || condicao2: ${condicao2 || condicao2}");  // false
    
    // Operador NOT (!) - Inverte o valor booleano
    print("!condicao1: ${!condicao1}");  // false
    print("!condicao2: ${!condicao2}");  // true

    // ========== OPERADORES LÓGICOS - EXEMPLOS PRÁTICOS ==========
    
    print("\n========== OPERADORES LÓGICOS - EXEMPLOS PRÁTICOS ==========\n");
    
    int idade = 25;
    bool temCarteira = true;
    bool comidadista = false;
    
    // AND: Pode dirigir se tem idade >= 18 E tem carteira
    bool podeDirigir = (idade >= 18) && temCarteira;
    print("Pode dirigir: $podeDirigir");  // true
    
    // OR: É candidato se é eleitor OU é maior de idade
    bool ehEleitor = idade >= 16;
    bool ehMaiorIdade = idade >= 18;
    bool ehCandidato = ehEleitor || ehMaiorIdade;
    print("É candidato: $ehCandidato");  // true
    
    // NOT: Verificar se NÃO é comidista
    bool podeViajarAoInterior = !comidadista;
    print("Pode viajar ao interior: $podeViajarAoInterior");  // true

    // ========== CONDICIONAIS COM BOOL ==========
    
    print("\n========== CONDICIONAIS COM BOOL ==========\n");
    
    bool estaChovendo = true;
    
    if (estaChovendo) {
      print("Está chovendo, leve um guarda-chuva!");
    } else {
      print("Está ensolarado, aproveite!");
    }
    
    // Verificar múltiplas condições
    int temperatura = 28;
    bool estaQuente = temperatura > 25;
    bool estaFrio = temperatura < 15;
    
    if (estaQuente) {
      print("Está quente! Temperatura: ${temperatura}°C");
    } else if (estaFrio) {
      print("Está frio! Temperatura: ${temperatura}°C");
    } else {
      print("Temperatura agradável: ${temperatura}°C");
    }

    // ========== OPERADOR TERNÁRIO ==========
    
    print("\n========== OPERADOR TERNÁRIO ==========\n");
    
    bool estaCansado = true;
    
    // Sintaxe: condicao ? valorTrue : valorFalse
    String acao = estaCansado ? "Descanse" : "Continue trabalhando";
    print("Recomendação: $acao");
    
    // Com números
    int nota = 7;
    String resultado = (nota >= 6) ? "Aprovado" : "Reprovado";
    print("Resultado: $resultado");

    // ========== TABELA VERDADE ==========
    
    print("\n========== TABELA VERDADE ==========\n");
    
    print("OPERADOR AND (&&):");
    print("true && true = ${true && true}");    // true
    print("true && false = ${true && false}");  // false
    print("false && true = ${false && true}");  // false
    print("false && false = ${false && false}"); // false
    
    print("\nOPERADOR OR (||):");
    print("true || true = ${true || true}");    // true
    print("true || false = ${true || false}");  // true
    print("false || true = ${false || true}");  // true
    print("false || false = ${false || false}"); // false
    
    print("\nOPERADOR NOT (!):");
    print("!true = ${!true}");    // false
    print("!false = ${!false}");  // true

    // ========== CONVERSÃO PARA BOOL ==========
    
    print("\n========== CONVERSÃO PARA BOOL ==========\n");
    
    // Em Dart, valores podem ser avaliados em contextos booleanos
    int numero = 5;
    String texto = "Olá";
    
    // Verifica se um número é diferente de zero (true)
    bool numeroEhVerdadeiro = numero != 0;
    print("numero != 0: $numeroEhVerdadeiro");
    
    // Verifica se uma string não é vazia (true)
    bool textoEhVerdadeiro = texto.isNotEmpty;
    print("texto.isNotEmpty: $textoEhVerdadeiro");
    
    // Verifica se uma string está vazia (false)
    String textoVazio = "";
    bool ehVazio = textoVazio.isEmpty;
    print("textoVazio.isEmpty: $ehVazio");

    // ========== BOAS PRÁTICAS COM BOOL ==========
    
    print("\n========== BOAS PRÁTICAS COM BOOL ==========\n");
    
    // ✓ BOM: Nomes descritivos que indicam verdadeiro/falso
    bool estahAutenticado = true;
    bool temPermissao = false;
    bool ehAdmin = true;
    
    print("✓ Nomes descritivos: estahAutenticado=$estahAutenticado");
    
    // ✓ BOM: Usar comparações explícitas
    bool ehIdade = (idade >= 18);
    print("✓ Comparação explícita: ehIdade = $ehIdade");
    
    // ✗ RUIM: Nomes ambíguos
    bool flag = true;  // Não fica claro o que 'flag' significa
    
    // ✓ BOM: Evitar duplas negações
    bool estahAtivo = true;
    // bool naoEstahInativo = !(!estahAtivo);  // Confuso!
    
    // ✓ BOM: Usar constantes para valores booleanos fixos
    const bool MODO_DEBUG = false;
    const bool MODO_PRODUCAO = true;
    
    print("\nBoas práticas aplicadas no código acima!");
}