import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'dart:html' as html;

import 'package:siska_fb/ui_screens/x.admin/widgets/admin_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('PetShop')),
        actions: [
          IconButton(
            onPressed: () {
              html.window.open('https://github.com/Siputsss/siska-fb', 'siska-fb');
            },
            icon: const Icon(SimpleIcons.github, color: SimpleIconColors.github),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) => Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // final google = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
                      // await FirebaseAuth.instance.signInWithPopup(google);
                      // // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminPage()),
                      );
                    },
                    child: const Text("Admin Page"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signInAnonymously();
                    },
                    child: const Text(
                      "Sign In Anonimously",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final google = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
                      await FirebaseAuth.instance.signInWithPopup(google);
                    },
                    child: const Text(
                      "Sign In by Google",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
