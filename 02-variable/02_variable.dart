// ========== EXEMPLO BÁSICO DE VARIÁVEL ==========
// Declaração de uma variável no escopo global (fora da função main)

// Usa 'var' para deixar o Dart inferir automaticamente que é uma String
// A variável armazena o texto: 'Olá, Mundo!'
var primeiraVariable = 'Olá, Mundo!';

void main() {
  // Imprime o valor da variável primeiraVariable
  // Resultado esperado: Olá, Mundo!
  print(primeiraVariable);

  // ========== TIPOS DE DECLARAÇÃO DE VARIÁVEIS ==========
  
  print("\n========== TIPOS DE VARIÁVEIS ==========\n");
  
  // 1. Usando 'var' - Dart infere o tipo automaticamente
  var nome = "João";  // Dart infere que é uma String
  var idade = 25;     // Dart infere que é um int
  var altura = 1.75;  // Dart infere que é um double
  
  print("var nome: $nome (tipo: String)");
  print("var idade: $idade (tipo: int)");
  print("var altura: $altura (tipo: double)");

  // 2. Tipos explícitos - Declarar o tipo de forma clara
  String cidade = "São Paulo";
  int ano = 2025;
  double preco = 99.90;
  bool ativo = true;
  
  print("\nTipos explícitos:");
  print("String cidade: $cidade");
  print("int ano: $ano");
  print("double preco: $preco");
  print("bool ativo: $ativo");

  // ========== MODIFICADORES FINAL E CONST ==========
  
  print("\n========== FINAL E CONST ==========\n");
  
  // 'final' - Variável que não pode ser reatribuída após inicialização
  // O valor é determinado em TEMPO DE EXECUÇÃO
  final String pais = "Brasil";
  print("final pais: $pais");
  // pais = "Argentina";  // ERRO! Não pode reatribuir uma variável final
  
  // 'const' - Constante que não pode mudar
  // O valor é determinado em TEMPO DE COMPILAÇÃO
  const int maiorIdadePermitida = 18;
  print("const maiorIdadePermitida: $maiorIdadePermitida");
  // maiorIdadePermitida = 21;  // ERRO! Não pode reatribuir uma constante

  // ========== LATE - INICIALIZAÇÃO TARDIA ==========
  
  print("\n========== LATE (INICIALIZAÇÃO TARDIA) ==========\n");
  
  // 'late' - Permite declarar uma variável sem inicializar imediatamente
  // A variável será inicializada depois no código
  late String descricao;
  
  // ... código aqui ...
  
  // Agora inicializa a variável late
  descricao = "Variável inicializada tardiamente";
  print("late descricao: $descricao");

  // ========== ATRIBUIÇÃO E REATRIBUIÇÃO ==========
  
  print("\n========== ATRIBUIÇÃO E REATRIBUIÇÃO ==========\n");
  
  // Variável comum pode ser reatribuída
  var contador = 0;
  print("contador inicial: $contador");
  
  contador = 5;
  print("contador após reatribuição: $contador");
  
  contador++;
  print("contador após incremento: $contador");
  
  contador += 10;
  print("contador após += 10: $contador");

  // ========== VARIÁVEIS NULL ==========
  
  print("\n========== VARIÁVEIS NULL ==========\n");
  
  // Variáveis podem ser null se declaradas sem valor
  var nullable;
  print("nullable (sem inicialização): $nullable");
  
  // Para forçar que uma variável aceite null, use o operador '?'
  String? textoOpcional;
  print("String? textoOpcional (sem inicialização): $textoOpcional");
  
  textoOpcional = "Agora tem valor";
  print("String? textoOpcional (após atribuição): $textoOpcional");

  // ========== INTERPOLAÇÃO DE STRING ==========
  
  print("\n========== INTERPOLAÇÃO DE STRING ==========\n");
  
  String usuario = "Maria";
  int anos = 30;
  double salario = 5000.00;
  
  // Usando interpolação com $variavel
  print("Olá, meu nome é $usuario e tenho $anos anos");
  
  // Usando interpolação com ${expressão}
  print("Meu salário é R\$ ${salario * 12} por ano");
  
  // Concatenação com +
  String mensagem = "O usuário " + usuario + " tem " + anos.toString() + " anos";
  print(mensagem);

  // ========== OPERADORES RELACIONADOS A VARIÁVEIS ==========
  
  print("\n========== OPERADORES ==========\n");
  
  var a = 10;
  var b = 3;
  
  print("a = $a, b = $b");
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("a / b = ${a / b}");
  print("a ~/ b = ${a ~/ b}  (divisão inteira)");
  print("a % b = ${a % b}   (resto da divisão)");

  // ========== BOAS PRÁTICAS ==========
  
  print("\n========== BOAS PRÁTICAS ==========\n");
  
  // ✓ BOM: Nomes descritivos e significativos
  String nomeCompleto = "João Silva";
  int idadeAtual = 25;
  
  // ✗ RUIM: Nomes genéricos
  String x = "João Silva";
  int a_value = 25;
  
  print("✓ Nomes descritivos são melhores para código legível");
  print("Exemplo bom: nomeCompleto = $nomeCompleto");
  print("Exemplo ruim: x = $x");

  // ✓ BOM: Use 'final' para variáveis que não mudam
  final String enderecoFixo = "Rua Principal, 123";
  
  // ✓ BOM: Use 'const' para valores constantes
  const double PI = 3.14159;
  
  print("\nUse 'final' e 'const' para valores imutáveis");
  print("enderecoFixo: $enderecoFixo");
  print("PI: $PI");
}
