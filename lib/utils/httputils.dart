import 'package:dio/dio.dart';

import 'config.dart';

class HttpUtils {
  factory HttpUtils() {
    return _instance;
  }

  static final HttpUtils _instance = HttpUtils._init();
  static late final Dio _dio;

  HttpUtils._init() {
    _dio = Dio();
    _dio.options.baseUrl = Config.host;
    _dio.options.connectTimeout = 6000;
  }

  Dio getDio() => _dio;
}
