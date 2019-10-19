import 'package:flutter_movies/api/dio.dart';

class Hello {
  Api _api;
  Hello(Api api){
    if(null != api) {
      _api = api;
      return;
    }
    _api = new Api();
  }
  sayHello() async {
    var hello = await _api.get('https://www.baidu.com');
    return hello;
  }
}
