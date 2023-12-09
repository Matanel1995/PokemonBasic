class Wand{
  String wood;
  String core;
  num length;


  Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, dynamic> json){
    return Wand(
        wood: json['wood'],
        core: json['core'],
        length: json['length'] ?? 0);
  }
}