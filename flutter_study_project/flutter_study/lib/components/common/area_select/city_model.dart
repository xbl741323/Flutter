import 'package:azlistview/azlistview.dart';

class CityModel extends ISuspensionBean {
  int id;
  String name;
  String tagIndex;
  String namePinyin;

  CityModel({
    this.id,
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? "" : json['name'];
    id = json['id'] == null ? "" : json['id'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() =>
      "{" +
      " \"name\":\"" +
      name +
      "\"" +
      " \"id\":\"" +
      id.toString() +
      "\"" '}';
}
