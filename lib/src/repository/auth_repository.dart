import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<bool> login(String login, String senha) async {
    try {
      var response = await dio.get('http://www.google.com');
      // var response = await dio.post('http://www.google.com', data: {
      //   'login': login,
      //   'senha': senha,
      // });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return false;
  }
}
