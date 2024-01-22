import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class SignUpAuthenticationAPI {
  Future<int?> signUpAPI(
    String name,
    String username,
    String password,
    String mobile_number,
    String email,
    String address,
  ) async {
    try {
      String url = 'http://192.168.60.86:8001/v1/mak/user/create';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          'name': name,
          'username': username,
          'password': password,
          'mobile_number': mobile_number,
          'email': email,
          'address': address,
        }),
      );
      if (response.statusCode == 201) {
        return response.statusCode;
      }
      print('Status Code is : ${response.statusCode}');
      print('Response Body is : ${response.body}');
      return response.statusCode;
    } catch (e) {
      print('error');
    }
  }
}
