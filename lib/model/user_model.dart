// ignore_for_file: non_constant_identifier_names

class User {
  int id;
  String name;
  String nomor_hp;
  

  User(
      {required this.id,
      required this.name,
      required this.nomor_hp
});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        nomor_hp: json['nomor_hp'],
       );
  }
}