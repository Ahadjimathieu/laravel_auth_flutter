import 'package:dio/dio.dart';

 dio()
{
  Dio dio  =  Dio();

  // ios
  //dio.options.baseUrl = "http://127.0.0.1:8000/api/v1";
  // android
  dio.options.baseUrl = "https://710b-2c0f-f0f8-777-3401-601f-b5cd-4ea-9eb0.ngrok-free.app/api/v1";
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Content_type'] = 'application/json';

  return dio;
}