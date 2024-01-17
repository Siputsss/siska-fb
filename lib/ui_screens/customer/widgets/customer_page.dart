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
              ? userList.isEmpty
                  ? const Center(child: Text('- data is empty -'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Wrap(alignment: WrapAlignment.center, children: [
                              ...List.generate(
                                userList.length,
                                (index) {
                                  final data = userList[index];
                                  final id = data.id;
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 200,
                                        width: 150,
                                        decoration:
                                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            SizedBox(width: 100, height: 100, child: Image.network(data.image)),
                                            const SizedBox(height: 10),
                                            Text(data.nama),
                                            Text('Rp${data.harga.toString()}'),
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
