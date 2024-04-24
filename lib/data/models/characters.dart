// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  late int charID;
  late String name;
  late String statusIfDeadOrAlive;
  late String species;
  late String gender;
  late String image;
  late String created;

  Character({
    required this.charID,
    required this.name,
    required this.statusIfDeadOrAlive,
    required this.species,
    required this.gender,
    required this.image,
    required this.created,
  });

  Character.fromJson(Map<String, dynamic> json) {
    charID = json['id'];
    name = json['name'];
    statusIfDeadOrAlive = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
  }
}
