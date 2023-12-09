class PokemonModel{
  final String name;
  final String type;
  final List<String> skills;


  PokemonModel(this.name, this.type, this.skills);

  PokemonModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      type = json['type'] as String,
      skills = json['abilities'] as List<String>;

  Map<String, dynamic> toJson() =>{
    'name': name,
    'type': type,
    'skills': skills
  };
}