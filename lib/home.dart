import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'dart:html' as html;

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
      body: Container(),
    );
  }
}
