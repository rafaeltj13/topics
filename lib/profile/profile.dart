import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
          ),
          body: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(user.photoURL ??
                            'https://www.gravatar.com/avatar/placeholder'),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Name'),
                          Text(user.displayName ?? "Guest")
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text('Email'), Text(user.email ?? "")],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Quizes'),
                          Text('${report.total}')
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await AuthService().signOut();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Signout')),
                ],
              ),
            ),
          ));
    } else {
      return const Text('Error');
    }
  }
}
