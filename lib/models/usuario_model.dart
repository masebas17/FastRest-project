// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

String clienteToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({this.email, this.password, this.uid});

  String? email;
  String? password;

  String? uid;

  Map<String, dynamic> toJson() =>
      {"email": email, "password": password, "uid": uid};
  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        password: json["password"],
        uid: json["uid"],
      );
}
