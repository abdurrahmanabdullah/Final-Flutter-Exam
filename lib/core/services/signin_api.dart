import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInAuthenticationAPI {
  final storage = const FlutterSecureStorage();
  Future<int?> signInAPI(
    String username,
    String password,
  ) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      String url = 'http://192.168.60.86:8001/v1/mak/user/login';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        preferences.setString(
            'access_token', jsonDecode(response.body)['access_token']);
        preferences.setString('username', username);
        print(response.body);

        return response.statusCode;
      }

      print('Response Body is : ${response.body}');
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
  }
}
