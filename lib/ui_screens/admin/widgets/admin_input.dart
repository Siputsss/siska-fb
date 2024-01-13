import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/admin/admin_data.dart';

class AdminInput extends StatefulWidget {
  const AdminInput({super.key});

  @override
  State<AdminInput> createState() => _AdminInputState();
}

class _AdminInputState extends State<AdminInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: ctrlNama,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isShowClearNama = false;
                      });
                    } else {
                      setState(() {
                        isShowClearNama = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'enter the product name',
                    labelText: 'Product Name',
                    suffixIcon: isShowClearNama
                        ? IconButton(
                            onPressed: () {
                              ctrlNama.clear();
                              setState(() {
                                isShowClearNama = false;
                              });
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlHarga,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isShowClearHarga = false;
                      });
                    } else {
                      setState(() {
                        isShowClearHarga = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'enter price',
                    labelText: 'Price',
                    suffixIcon: isShowClearHarga
                        ? IconButton(
                            onPressed: () {
                              ctrlHarga.clear();
                              setState(() {
                                isShowClearHarga = false;
                              });
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlDesc,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isShowClearDesc = false;
                      });
                    } else {
                      setState(() {
                        isShowClearDesc = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'enter description',
                    labelText: 'Description',
                    suffixIcon: isShowClearDesc
                        ? IconButton(
                            onPressed: () {
                              ctrlDesc.clear();
                              setState(() {
                                isShowClearDesc = false;
                              });
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final nama = ctrlNama.text;
                    final harga = int.parse(ctrlHarga.text);
                    final desc = ctrlDesc.text;
                    final data = {'nama': nama, 'harga': harga, 'desc': desc};
                    setState(() {
                      isLoading = true;
                    });

                    await createDoc(data);

                    ctrlNama.clear();
                    ctrlHarga.clear();
                    ctrlDesc.clear();

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);

                    // debugPrint(nama.runtimeType.toString());
                    // debugPrint(harga.runtimeType.toString());
                    // debugPrint(desc.runtimeType.toString());
                  },
                  child: Text(isLoading ? "loading..." : "Submit"),
                ),
              ],
            ),
          ),
        ));
  }
}
