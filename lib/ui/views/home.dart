import 'package:exam_2/ui/route_navigation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page "),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNavigation.signUp);
              },
              child: const Text('Sign up')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNavigation.signIn);
              },
              child: const Text('sign in '))
        ],
      ),
    );
  }
}
