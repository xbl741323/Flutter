// 处理接口返回的数据时，要保持json对象皆模型的思想，要将json对象转化为模型

class MovieItem { // 如果里面有对象，可以再进行封装
  String title;
  String desc;
  String coverUrl;

  MovieItem.fromMap(Map<String,dynamic> json){
    this.title = json["title"];
    this.desc = json["optionName"];
    this.coverUrl = json["coverUrl"];
  }
}