import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siska_fb/ui_screens/x.admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/x.admin/admin_data.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';

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
                pickedImage == null
                    ? const Card(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(child: Text('pick image')),
                        ),
                      )
                    : SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network('${pickedImage?.path}'),
                      ),
                // Text(
                //   '${pickedImage?.path}',
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                    setState(() {});
                    // debugPrint(imagePicker!.name.toString());
                    // debugPrint(pickedFile!.path.toString());
                  },
                  child: const Text("get image"),
                ),
                // const SizedBox(height: 10),
                // Text(imageUrl, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlNama,
                  onChanged: (value) {
                    setState(() {
                      isShowClearNama = value.isNotEmpty;
                    });
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
                    setState(() {
                      isShowClearHarga = value.isNotEmpty;
                    });
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
                    setState(() {
                      isShowClearDesc = value.isNotEmpty;
                    });
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
                    final valNama = ctrlNama.text;
                    final valHarga = int.parse(ctrlHarga.text);
                    final valDesc = ctrlDesc.text;
                    final id = UniqueKey().toString();
                    // final data = {'nama': nama, 'harga': harga, 'desc': desc};
                    setState(() {
                      isLoading = true;
                    });
                    await upload();
                    setState(() {});
                    final newProduk = ProdukX(
                      createdAt: DateTime.now().toString(),
                      id: id,
                      nama: valNama,
                      harga: valHarga,
                      desc: valDesc,
                      image: imageUrl,
                    );
                    setState(() {
                      isLoading = true;
                    });
                    await createDoc(newProduk);
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