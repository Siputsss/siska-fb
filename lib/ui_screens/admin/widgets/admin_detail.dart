import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDetail extends StatelessWidget {
  const AdminDetail({super.key, required this.id});

  final String id;

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc() async {
    final result = await FirebaseFirestore.instance.collection('coba').doc(id).get();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDoc(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.data()!['nama'].toString()),
                    Text(snapshot.data!.data()!['harga'].toString()),
                    Text(snapshot.data!.data()!['desc'].toString()),
                  ],
                );
              }
              return const Text('text');
            },
          ),
        ));
  }
}
