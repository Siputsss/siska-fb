import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siska_fb/ui_screens/admin/admin_ctrl.dart';
import 'package:siska_fb/ui_screens/admin/admin_data.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';

class AdminEdit extends StatefulWidget {
  const AdminEdit({super.key, required this.id});
  final String id;

  @override
  State<AdminEdit> createState() => _AdminEditState();
}

class _AdminEditState extends State<AdminEdit> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDoc(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        pickedImage == null
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network('${pickedImage?.path}'),
                              ),
                        Text(
                          '${pickedImage?.path}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
                            setState(() {});
                          },
                          child: const Text(
                            "Get Image",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: TextEditingController(text: data!.nama),
                          decoration: const InputDecoration(
                            hintText: 'enter product name',
                            labelText: 'Product Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: TextEditingController(text: data.harga.toString()),
                          decoration: const InputDecoration(
                            hintText: 'enter price',
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: TextEditingController(text: data.desc),
                          decoration: const InputDecoration(
                            hintText: 'enter description',
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final editNama = ctrlNama.text.isEmpty ? snapshot.data!.nama : ctrlNama.text;
                        final editHarga = ctrlHarga.text.isEmpty ? snapshot.data!.harga : int.parse(ctrlHarga.text);
                        final editDesc = ctrlDesc.text.isEmpty ? snapshot.data!.desc : ctrlDesc.text;
                        final editCreatedAt = snapshot.data!.createdAt;
                        // final editImage = imageUrl;
                        final id = snapshot.data!.id;

                        final editproduk = ProdukX(
                          id: id,
                          nama: editNama,
                          harga: editHarga,
                          desc: editDesc,
                          createdAt: editCreatedAt,
                          image: await upload(id),
                        );
                        setState(() {
                          isLoading = true;
                        });
                        await update(editproduk);
                        setState(() {
                          isLoading = false;
                        });
                        ctrlNama.clear();
                        ctrlHarga.clear();
                        ctrlDesc.clear();

                        // Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text(isLoading ? 'loading...' : "Edit Product"),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
