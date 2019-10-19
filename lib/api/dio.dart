import 'dart:io';

import 'package:dio/dio.dart';

class Api {
  factory Api() => _getInstance();
  static Api get instance => _getInstance();
  static Api _instance;
  Dio _dio;

  Api._internal() {
    if (null == _dio) {
      _dio = new Dio();
    }
  }

  static Api _getInstance() {
    if (_instance==null) {
      _instance = new Api._internal();
    }
    return _instance;
  }

  Future<dynamic> get(String url) async {
    try {
      final result = await _dio.get(url);
      if (result.statusCode == HttpStatus.ok) {
        print(result.statusMessage.toString());
      } else {
        print(result.statusMessage);
      }
      return result.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
