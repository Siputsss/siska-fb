import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_edit.dart';

class AdminDetail extends StatelessWidget {
  const AdminDetail({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminEdit(id: id)),
            );
          },
          child: const Icon(Icons.edit),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDoc(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    data.image.isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(data.image),
                          ),
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
