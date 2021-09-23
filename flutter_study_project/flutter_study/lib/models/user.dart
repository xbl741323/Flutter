/*
* 登录用户信息
* */

class User {
  String userName;
  int age;

  User(
    this.userName,
    this.age,
  );

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() => {'userName': userName, 'age': age};
}
