import 'package:exam_2/core/services/signin_api.dart';
import 'package:exam_2/core/view_models/list_view_model.dart';
import 'package:exam_2/core/view_models/sign_in_view_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/list_api.dart';
import 'core/services/list_details_api.dart';
import 'core/services/profile_api.dart';
import 'core/services/signup_api.dart';
import 'core/view_models/base_view_model.dart';
import 'core/view_models/list_details_view_model.dart';
import 'core/view_models/sign_up_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => SignInViewModel());
  locator.registerFactory(() => SignUpViewModel());

  locator.registerFactory(() => ListViewModel());
  locator.registerFactory(() => ListDetailsViewModel());

  locator.registerLazySingleton(() => SignUpAuthenticationAPI());
  locator.registerLazySingleton(() => SignInAuthenticationAPI());
  locator.registerLazySingleton(() => ProfileAPI());
  locator.registerLazySingleton(() => ListApi());
  locator.registerLazySingleton(() => ListDetails());
}
