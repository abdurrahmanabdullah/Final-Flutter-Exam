import 'package:exam_2/core/models/list_model.dart';
import 'package:http/http.dart' as http;

class ListApi {
  String url = 'http://192.168.60.86:8001/v1/mak/user/all';
  //String token;
  Future<ListModel?> getAllList(String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.60.86:8001/v1/mak/user/all'),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      ListModel listmodel = listModelFromJson(response.body);
      print(response.body);
      return listmodel;
    } catch (e) {
      print(e.toString());
    }
  }
}
