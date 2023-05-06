import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'network_helper.dart';


class APIManager {




  static const loginURL = "https://cms-qf-default-rtdb.asia-southeast1.firebasedatabase.app/users/-NMtVWPCThYetzT2tBQ8.jsonc";



  static Future<bool?> loginUser({@required String? username, @required String? password,}) async {
    return true;
    Map<String, dynamic> map = {};
    map["username"] = username;
    map["password"] = password;

    String encodedValue = jsonEncode(map);
    try {
      final  response = await NetworkHelper().postWithBody(url:
      loginURL,
        body:encodedValue,
      );
      if ((response.statusCode??0)==200) {

        return true;
      }
    } on DioError catch (e) {
      log(e.toString());
    }

    return null;
  }


  // static Future<VerifyOTPResponse?> signUpNew({required SignUpModel signUpModel}) async {
  //
  //   Map<String, dynamic> map = signUpModel.toJson();
  //   map['secret_key']=secretKey;
  //
  //   String encodedValue = jsonEncode(map);
  //   try {
  //     final  response = await NetworkHelper().postWithBody(url:
  //     signUpURL,
  //       body:encodedValue,
  //     );
  //     if (response.data.isNotEmpty ?? false) {
  //       debugPrintMethod(response.data);
  //       final VerifyOTPResponse verifyOTPResponse = VerifyOTPResponse.fromJson(response.data);
  //       return verifyOTPResponse;
  //     }
  //   } on DioError catch (e) {
  //     log(e.toString());
  //   }
  //
  //   return null;
  // }


}

