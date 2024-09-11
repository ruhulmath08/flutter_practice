class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({required this.username, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        username: json["username"],
        password: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
