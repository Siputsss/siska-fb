import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/a.product_list/_index.dart';
import 'package:siska_fb/ui_screens/customer/widgets/customer_page.dart';
import 'package:siska_fb/ui_screens/home.dart';

// import '../ui_screens/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: const ProductListView()
        // StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return const CustPage();
        //     } else {
        //       return const Home();
        //     }
        //   },
        // )
        // AdminInput()
        // AdminPage()
        // Home(),
        );
  }
}
