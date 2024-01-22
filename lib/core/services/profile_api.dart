import 'package:exam_2/core/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileAPI {
  Future<List<ProfileModel>> getProfileAPI() async {
    http.Response response;

    response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    List<ProfileModel> profile = profileModelFromJson(response.body);
    // print(response.body);
    return profile;
  }
}
