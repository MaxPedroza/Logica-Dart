void main() {
  // ===========AULA 01 - MAP - PRÁTICA ===========
  final map = Map<String, dynamic>();
  map.addAll({
    'nome': 'João',
    'idade': 30,
    'altura': 1.75,
    'isEstudante': false,
  });
  print(map);

  //============= AULA 02 - MAP - ADDALL E ADDENTRY ===========
  final map2 = Map<String, dynamic>();
  map2.addAll({'nome': 'Maria', 'idade': 25});

  print('Antes do addEntries: $map2');

  map.addEntries(map2.entries);
  print('Depois do addEntries: $map');

  //============= AULA 03 - MAP - CLEAR ===========
  final mapA = <String, dynamic>{"name": "Max", "sobrenome": "Pedroza"};
  print(mapA);
  mapA.clear();
  print(mapA);

  //============= AULA 04 - MAP - CONTAINS ===========
  final mapB = <String, dynamic>{"name": "Max", "sobrenome": "Pedroza"};
  print(mapB.containsKey("street"));
  print(mapB.containsValue("Max"));

  //============= AULA 05 - MAP - REMOVE ===========
  final mapC = <String, dynamic>{"name": "Max", "sobrenome": "Pedroza"};
  print('Antes do remove: $mapC');
  mapC.remove("sobrenome");
  print('Depois do remove: $mapC');

  mapC.removeWhere((key, value) => value == "Max");
  print('Depois do removeWhere: $mapC');

  mapC.removeWhere((key, value) => value.toString().contains("a"));
  print('Depois do removeWhere com contains: $mapC');

  //============= AULA 06 - MAP - UPDATE ===========
  final mapD = <String, dynamic>{"name": "Max", "sobrenome": "Pedroza"};
  mapD.update("name", (value) => "Maxwell");
  mapD['name'] = "MAXWELL @";
  print(mapD);

  mapD.updateAll((key, value) => key == "name" ? "#" : value);
  print(mapD);
}
