// ignore: library_prefixes
import "package:dio/dio.dart" as Dio;
import "package:flutter/material.dart";
import "package:okpa_front/services/dio.dart";
import 'package:okpa_front/models/user.dart';

class Auth extends ChangeNotifier
{

  bool _isLoggedIn = false;
  late User _user;
  late String token;

  bool get authenticated => _isLoggedIn;
  User get user => _user;
  void login({required Map creds}) async
  {
   
      Dio.Response response = await dio().post('/login',data:creds);
      
      print(response.data.toString());
      final token = response.data['access_token'].toString();
      this.tryToken( token: token);
  }

void tryToken({required String token}) async
  {
    if(token == null){
      return ;
    }else{
      try {
         Dio.Response response = await dio().get('/user',
         options: Dio.Options(headers: {
           "Authorization": "Bearer $token"
         }));
        _isLoggedIn = true;
        this._user = User.fromJson(response.data);
        notifyListeners();
      } catch (e) {
        print(e); 
      }
    }
     
  }

  
  void logout()
  {
    _isLoggedIn = false;
    notifyListeners();
  }
}