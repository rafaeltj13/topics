import 'package:flutter/material.dart';
import 'package:myapp/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';
// import 'package:myapp/shared/shared.dart';
import 'package:myapp/topics/topics.dart';
import 'package:myapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const LoadingScreen();
          return const Text('loading');
        } else if (snapshot.hasError) {
          // return const Center(
          //   child: ErrorMessage(),
          // );
          return const Text('error');
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
