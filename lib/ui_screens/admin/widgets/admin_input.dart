import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminInput extends StatefulWidget {
  const AdminInput({super.key});

  @override
  State<AdminInput> createState() => _AdminInputState();
}

class _AdminInputState extends State<AdminInput> {
  final ctrlNama = TextEditingController();

  final ctrlHarga = TextEditingController();

  final ctrlDesc = TextEditingController();

  var isLoading = false;

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
                  decoration: const InputDecoration(
                    hintText: 'enter the product name',
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlHarga,
                  decoration: const InputDecoration(
                    hintText: 'enter price',
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlDesc,
                  decoration: const InputDecoration(
                    hintText: 'enter description',
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ctrlNama.clear();
                    ctrlHarga.clear();
                    ctrlDesc.clear();
                  },
                  child: const Text("clear"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final nama = ctrlNama.text;
                    final harga = int.parse(ctrlHarga.text);
                    final desc = ctrlDesc.text;
                    setState(() {
                      isLoading = true;
                    });

                    await FirebaseFirestore.instance
                        .collection('coba')
                        .doc()
                        .set({'nama': nama, 'harga': harga, 'desc': desc});
                    setState(() {
                      isLoading = false;
                    });

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
