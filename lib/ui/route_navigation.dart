import 'package:exam_2/ui/views/home.dart';
import 'package:exam_2/ui/views/list_details_view.dart';
import 'package:exam_2/ui/views/list_view.dart';
import 'package:exam_2/ui/views/sign_up_view.dart';
import 'package:flutter/material.dart';

import 'views/signin_view.dart';

class RouteNavigation {
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String profileView = 'profileView';
  static const String listview = 'listview';
  static const String listDetails = 'listDetails';
  static const String home = 'home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case listview:
        return MaterialPageRoute(builder: (context) => const LIstView());
      case listDetails:
        return MaterialPageRoute(builder: (context) {
          String mobile_number = settings.arguments as String;
          return ListDetailsView(
            mobile_number: mobile_number,
          );
        });

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}