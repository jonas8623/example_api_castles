
class Castle {

  String? name;
  String? location;

  Castle({required this.name, required this.location});

  //conversão do objeto que vai chegar da API para objeto da classe Castle
  factory Castle.fromJson(Map<String, dynamic> json) {
    // final castle = Castle('abc', 'def);
    return Castle(
        name: json['name'] ?? null,
        location: json['location'] ?? 'Terra do sr.ninguem',
    );
  }

  @override
  String toString() {
    return 'Castle{Nome do castelo:\n$name \nlocalização do castelo:\n$location}';
  }
}

// Vamos usar apenas nome e localização dessas informações
/*
HTTP/1.1 200 OK
[
  {
    "religion":["Faith of the Seven"],
    "rulers":["House Smallwood"],
    "founder":[],
    "_id":"5cad9816b0c0ef00108e60d6",
    "name":"Acorn Hall",
    "location":"Westeros",
    "type":"Castle",
    "__v":0
  }
]
 */