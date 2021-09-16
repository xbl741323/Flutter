/*
* 登录用户信息
* */

class User {
  String accountNo;
  String accountSubject;
  int accountType;
  String customerNo;
  int id;
  String portraitUrl;
  String userNo;

  User(
    this.accountNo,
    this.accountSubject,
    this.accountType,
    this.customerNo,
    this.id,
    this.portraitUrl,
    this.userNo,
  );

  User.fromJson(Map<String, dynamic> json) {
    accountNo = json['accountNo'];
    accountSubject = json['accountSubject'];
    accountType = json['accountType'];
    customerNo = json['customerNo'];
    id = json['id'];
    portraitUrl = json['portraitUrl'];
    userNo = json['userNo'];
  }

  Map<String, dynamic> toJson() => {
        'accountNo': accountNo,
        'accountSubject': accountSubject,
        'accountType': accountType,
        'customerNo': customerNo,
        'id': id,
        'portraitUrl': portraitUrl,
        'userNo': userNo
      };
}
