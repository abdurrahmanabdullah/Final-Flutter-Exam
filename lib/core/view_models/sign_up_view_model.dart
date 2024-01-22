import 'package:exam_2/core/enums/view_state.dart';
import 'package:exam_2/core/services/signup_api.dart';
import 'package:exam_2/locator.dart';
import 'package:flutter/widgets.dart';

import 'base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUpAuthenticationAPI _authenticationAPI =
      locator<SignUpAuthenticationAPI>();

  final nameController = TextEditingController();
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();
  final mobile_numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  Future<bool>? signUpAPI() async {
    setViewState(ViewState.busy);

    int? returnedStatusCode = await _authenticationAPI.signUpAPI(
      nameController.text,
      userNameController.text,
      passwordController.text,
      mobile_numberController.text,
      emailController.text,
      addressController.text,
    );

    setViewState(ViewState.idle);
    print('Return StatusCode is : $returnedStatusCode');
    return returnedStatusCode == 201 ? true : false;
  }

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void changeIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  String? mobileNumberValidator(String value) {
    String pattern = r'(^(01)[0-9]{9}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'need mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'give correct mobile number';
    }
    return null;
  }

  String? passwordValidator(String value) {
    print(value);
    String pattern = r"(^[a-zA-Z\d@%+'!#$^?:.~\-_.]{6,256}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Need Password';
    } else if (value.length < 6) {
      return 'Need minimum  6 words';
    } else if (!regExp.hasMatch(value)) {
      return 'wrong Password';
    }

    return null;
  }
}
