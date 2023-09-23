import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? Image;
  String? password;

  UserModel({this.Image, this.email, this.name, this.password, this.phone});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "Image": Image,
      "password": password,
    };
  }
}
