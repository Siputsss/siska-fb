import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_detail.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_input.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Future<QuerySnapshot<Map<String, dynamic>>> getColl() async {
    final result = await FirebaseFirestore.instance.collection('coba').get();
    return result;
  }

  var selectedId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Page'),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminInput()),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: getColl(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ...List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        final data = snapshot.data!.docs[index].data();
                        final id = snapshot.data!.docs[index].id;
                        return Card(
                          child: ListTile(
                            title: Text('${data['nama']}'),
                            subtitle: Text(id),
                            selected: id == selectedId,
                            selectedTileColor: Colors.grey.withOpacity(0.2),
                            onTap: () {
                              setState(() {
                                selectedId = id;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminDetail(id: id)),
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                );
              }
              return const Text('text');
            },
          ),
        ));
  }
}
