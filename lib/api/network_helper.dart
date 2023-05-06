import 'dart:async';

import 'package:dio/dio.dart';
import 'api_manager.dart';



class NetworkHelper {
  Dio? dio;
  NetworkHelper()
  {
    if (dio == null) {
      final BaseOptions options =  BaseOptions(
        baseUrl:"https://cms-qf-default-rtdb.asia-southeast1.firebasedatabase.app/",
        receiveDataWhenStatusError: true,
      );

      dio =  Dio(options);
    }
  }

  Future<Response> getWithParams({required String url,Map<String,dynamic>? parameterMap}) async {

   Response response;
    try {
      response = await dio!.get(url,queryParameters: parameterMap,options: Options(
          headers: {
            "Connection": "Keep-Alive",
          }
      ));
      return response;
    } on DioError catch (e) {
      print('ErrorURL in get:${e.response!.realUri}');
      rethrow;
    }
  }



  Future<Response> postWithBody(
      {required String url, dynamic body,Map<String,dynamic>? headers}) async {

    try{

      final response = await dio!.post(url,
        data: body,
        options: Options(
            headers: {
              "Content-Type": "application/json"
            }
        ),
      );
      return response;
    } on DioError catch (e) {
      print(e.response?.statusCode);
      rethrow;
    }
  }

}
