import 'package:dio/dio.dart';
import 'config.dart';

class Http{
  // 1.创建DIO实例
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIMEOUT
  );
  static final dio = Dio(baseOptions);

  static Future request({String url, String method, Map<String,dynamic> params }) async{ // Future 相当于js中的Promise
    // 2.发送网络请求
    Options options = Options(method: method);
    try {
      switch(method){
        case 'get':
          return await dio.request(url,queryParameters: params,options: options);
          break;
        case 'post':
          return await dio.request(url,data: params,options: options);
          break;
      }
    } on DioError catch(err) { // 有异常，就抛出异常
      throw err;
    }
  }
}