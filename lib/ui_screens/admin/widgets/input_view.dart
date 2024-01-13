import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  InputView({super.key});

  final ctrlNama = TextEditingController();
  final ctrlHarga = TextEditingController();
  final ctrlDesc = TextEditingController();

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
                    final nama = ctrlNama.text;
                    final harga = int.parse(ctrlHarga.text);
                    final desc = ctrlDesc.text;
                    // final x = {'nama': nama, 'harga': harga, 'desc': desc};
                    // print(nama.runtimeType);
                    // print(harga.runtimeType);
                    // print(desc.runtimeType);
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
