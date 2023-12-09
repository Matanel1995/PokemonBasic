import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/HP/Models/person.dart';

const hpUrl = 'https://hp-api.onrender.com/api/characters';


Future<void> callApi() async {
  //Creating list to store all peoples
  List<Person> allPeople = [];
  //Fetch the data
  final res = await http.get(Uri.parse(hpUrl));
  var body = res.body;
  //Convert into List of json objects(Map<String, dynamic>)
  var tempPeople = List.from(jsonDecode(body));
  //For each person create Person instance and store it in Person list
  for (var element in tempPeople) {
    Person person = Person.fromJson(element);
    allPeople.add(person);
  }
}