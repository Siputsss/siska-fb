import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_edit.dart';

class AdminDetail extends StatefulWidget {
  const AdminDetail({super.key, required this.id});

  final String id;

  @override
  State<AdminDetail> createState() => _AdminDetailState();
}

class _AdminDetailState extends State<AdminDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminEdit(id: widget.id)),
                );
              },
              child: const Icon(Icons.edit),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() {});
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: getDoc(widget.id),
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
                    Text('Rp ${snapshot.data!.harga}'),
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
