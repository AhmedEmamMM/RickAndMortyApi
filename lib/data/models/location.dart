class Location {
  late int id;
  late String name;
  late String type;
  late String dimension;

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
  }
}
