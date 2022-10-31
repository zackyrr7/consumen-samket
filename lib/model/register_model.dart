// ignore_for_file: non_constant_identifier_names

// class UserReg {
 
//   String name;
//   String nomor_hp;
//   String password;
//   String password_confirmation;
  
  

//   UserReg(
//       {required this.password,
//       required this.password_confirmation,
//       required this.name,
//       required this.nomor_hp
// });

//   factory UserReg.fromJson(Map<String, dynamic> json) {
//     return UserReg(
//         password: json['password'],
//         password_confirmation: json['password_confirmation'],
//         name: json['name'],
//         nomor_hp: json['nomor_hp'],
//        );
//   }

// }

class UserRegis {
  
  String name;
  String nomor_hp;
  String password;
  String password_confirmation;
  
  

  UserRegis(
      {required this.name,
      required this.nomor_hp,
      required this.password,
      required this.password_confirmation,
});

  factory UserRegis.fromJson(Map<String, dynamic> json) {
    return UserRegis(
        name: json['name'],
        nomor_hp: json['nomor_hp'],
        password: json['password'],
        password_confirmation: json['password_confirmation']
       );
  }
}

