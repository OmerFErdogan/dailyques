import 'dart:convert';

String registerRequiredModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
    RegisterRequestModel({
        required this.username,
        required this.email,
        required this.book,
        required this.password
    });

    String username;
    String email;
    String book;
    String password;
    

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "book":book,
        "password":password,

    };
}