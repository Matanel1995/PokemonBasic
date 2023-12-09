import 'wand.dart';

class Person {
  String id;
  String name;
  List<String> alternate_names;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  int yearOfBirth;
  bool wizard;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand wand;
  String patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<String> alternate_actors;
  bool alive;
  String image;

  Person(
      {required this.id,
      required this.name,
      required this.alternate_names,
      required this.species,
      required this.gender,
      required this.house,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.wizard,
      required this.ancestry,
      required this.eyeColour,
      required this.hairColour,
      required this.wand,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alternate_actors,
      required this.alive,
      required this.image});

  factory Person.fromJson(Map<String, dynamic> json) {
    var temp_alternate_names = json['alternate_names'];
    var temp_alternate_actors = json['alternate_actors'];

    return Person(
      id: json['id'],
      name: json['name'],
      alternate_names: List<String>.from(temp_alternate_names),
      species: json['species'],
      gender: json['gender'],
      house: json['house'],
      dateOfBirth: json['dateOfBirth'] ?? '',
      yearOfBirth: json['yearOfBirth'] ?? 0,
      wizard: json['wizard'],
      ancestry: json['ancestry'],
      eyeColour: json['eyeColour'],
      hairColour: json['hairColour'],
      wand: Wand.fromJson(json['wand']),
      patronus: json['patronus'],
      hogwartsStudent: json['hogwartsStudent'],
      hogwartsStaff: json['hogwartsStaff'],
      actor: json['actor'],
      alternate_actors: List<String>.from(temp_alternate_actors),
      alive: json['alive'],
      image: json['image'],
    );
  }
}
