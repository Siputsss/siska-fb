import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/x.admin/admin_ctrl.dart';

class CustDetail extends StatelessWidget {
  const CustDetail({super.key, required this.id});
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
