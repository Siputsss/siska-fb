import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/admin/admin_data.dart';
import 'package:siska_fb/ui_screens/admin/widgets/admin_detail.dart';

class CustPage extends StatefulWidget {
  const CustPage({super.key});

  @override
  State<CustPage> createState() => _CustPageState();
}

class _CustPageState extends State<CustPage> {
  @override
  void initState() {
    loadmore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Page'),
      ),
      body: FutureBuilder(
        future: getColl(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? produkList.isEmpty
                  ? const Center(child: Text('- data is empty -'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Wrap(alignment: WrapAlignment.center, children: [
                              ...List.generate(
                                produkList.length,
                                (index) {
                                  final data = produkList[index];
                                  final id = data.id;
                                  return InkWell(
                                    child: Card(
                                      child: SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.network(data.image),
                                            ),
                                            Text(data.nama),
                                            Text('Rp ${data.harga}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AdminDetail(id: id)),
                                      );
                                    },
                                  );
                                },
                              )
                            ]),
                          ),
                          isEnd
                              ? const Text('- end of list -')
                              : snapshot.connectionState == ConnectionState.waiting
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          loadmore();
                                        });
                                      },
                                      child: const Text("load more"),
                                    )
                        ],
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
