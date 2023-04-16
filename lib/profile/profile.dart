import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ElevatedButton(
          onPressed: () async {
            await AuthService().signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
          ),
          child: const Text('signout')),
    );
  }
}
