import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_edit.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_input.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_page.dart';
import 'package:siska_fb/ui_screens/home.dart';

// import '../ui_screens/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const
          // AdminInput()
          // AdminPage()
          Home(),
    );
  }
}
