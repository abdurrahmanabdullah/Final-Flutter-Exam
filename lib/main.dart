import 'package:flutter/material.dart';

import 'locator.dart';
import 'ui/route_navigation.dart';

late String? isSignedIn;
void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam 2',
      initialRoute: RouteNavigation.home,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
