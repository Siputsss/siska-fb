import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';

class AdminDetail extends StatelessWidget {
  const AdminDetail({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDoc(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.id),
                    Text(snapshot.data!.nama),
                    Text(snapshot.data!.harga.toString()),
                    Text(snapshot.data!.desc),
                  ],
                );
              }
              return const Text('text');
            },
          ),
        ));
  }
}
