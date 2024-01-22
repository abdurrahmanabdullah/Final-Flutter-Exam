import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/services/signin_api.dart';
import 'package:exam_2/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignInAuthenticationAPI _authenticationAPI =
      locator<SignInAuthenticationAPI>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool>? signInAPI() async {
    setViewState(ViewState.busy);

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    int? returnedStatusCode = await _authenticationAPI.signInAPI(
        userNameController.text, passwordController.text);

    setViewState(ViewState.idle);

    if (returnedStatusCode == 200) {
      if (_isCredentialsSaved) {
        preferences.setString('savedId', userNameController.text);
        preferences.setString('savedPassword', passwordController.text);
      } else {
        preferences.remove('savedId');
        preferences.remove('savedPassword');
      }

      return true;
    } else {
      preferences.remove('savedId');
      preferences.remove('savedPassword');

      return false;
    }
  }

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void changeIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> setSavedPassword() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    userNameController.text = preferences.getString('savedId') ?? '';
    passwordController.text = preferences.getString('savedPassword') ?? '';

    if (userNameController.text.isNotEmpty) {
      _isCredentialsSaved = true;
    }

    notifyListeners();
  }

  String? passwordValidator(String value) {
    print(value);
    String pattern = r"(^[a-zA-Z\d@%+'!#$^?:.~\-_.]{8,256}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'পাসওয়ার্ড প্রয়োজন';
    } else if (value.length < 8) {
      return 'কমপক্ষে ৮ অক্ষর বা তার বেশি প্রয়োজন';
    } else if (!regExp.hasMatch(value)) {
      return 'ভুল অক্ষর ব্যবহার করা হয়েছে';
    }

    return null;
  }

  bool _isCredentialsSaved = false;

  bool get isCredentialsSaved => _isCredentialsSaved;

  void toggleIsCredentialsSaved() async {
    _isCredentialsSaved = !_isCredentialsSaved;

    notifyListeners();
  }
}
