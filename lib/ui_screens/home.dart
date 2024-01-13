import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'dart:html' as html;

import 'package:siska_fb/ui_screens/admin/widgets/admin_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fashionstore'),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()),
                );
              },
              child: Text(
                "Admin Page",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
