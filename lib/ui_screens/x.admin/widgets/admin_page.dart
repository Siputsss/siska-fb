import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/x.admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/x.admin/admin_data.dart';
import 'package:siska_fb/ui_screens/x.admin/widgets/admin_detail.dart';
import 'package:siska_fb/ui_screens/x.admin/widgets/admin_input.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    loadmore();
    super.initState();
  }

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
            heroTag: null,
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
            heroTag: null,
            onPressed: () {
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getColl(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          if (snapshot.hasData) {
            if (produkList.isEmpty) {
              return const Center(child: Text('- data is empty -'));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    produkList.length,
                    (index) {
                      // final data = snapshot.data![index];
                      final data = produkList[index];
                      final id = data.id;

                      return Card(
                        child: ListTile(
                            title: Text(data.nama),
                            subtitle: Text(id),
                            selected: id == selectedId,
                            selectedTileColor: Colors.grey.withOpacity(0.2),
                            trailing: IconButton(
                              onPressed: () async {
                                await deleteDoc(id);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            onTap: () {
                              setState(() {
                                selectedId = id;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminDetail(id: id)),
                              );
                            },
                            //**MULAI KE STORAGE-----------------------------------------
                            leading: SizedBox(
                              child: data.image.isEmpty
                                  ? const SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Icon(Icons.image),
                                    )
                                  : SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(data.image),
                                    ),
                            )),
                      );
                    },
                  ),
                  isEnd
                      ? const Center(child: Text('- end of list -'))
                      : snapshot.connectionState == ConnectionState.waiting
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  loadmore();
                                });
                              },
                              child: const Text("load more"),
                            ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
