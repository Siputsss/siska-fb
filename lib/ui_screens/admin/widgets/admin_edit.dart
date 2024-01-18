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
  @override
  void initState() {
    super.initState();
    getDoc(selectedId);
    // detail();
    // debugPrint(selectedId);
    ctrlEditNama.text = '${produkDetail?.nama}';
    ctrlEditHarga.text = '${produkDetail?.harga}';
    ctrlEditDesc.text = '${produkDetail?.desc}';
    debugPrint(produkDetail.toString());
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
              // final data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // pickedImage == null
                        //     ? const SizedBox.shrink()
                        SizedBox(
                          height: 100,
                          width: 100,
                          // child: Image.network('${pickedImage?.path}'),
                          child: Image.network(pickedImage == null ? '${produkDetail?.image}' : '${pickedImage?.path}'),
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
                          },
                          child: const Text(
                            "Get Image",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: ctrlEditNama,
                          onChanged: (value) {
                            setState(() {
                              isShowClearEditNama = value.isNotEmpty;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'enter product name',
                            labelText: 'Product Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: ctrlEditHarga,
                          onChanged: (value) {
                            setState(() {
                              isShowClearEditHarga = value.isNotEmpty;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'enter price',
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: ctrlEditDesc,
                          onChanged: (value) {
                            setState(() {
                              isShowClearEditDesc = value.isNotEmpty;
                            });
                          },
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
                        final editNama = ctrlEditNama.text;
                        final editHarga = int.parse(ctrlEditHarga.text);
                        final editDesc = ctrlEditDesc.text;
                        final editCreatedAt = DateTime.now().toString();
                        // final editImage = imageUrl;
                        // final id = snapshot.data!.id;

                        setState(() {
                          isLoading = true;
                        });
                        await upload();
                        setState(() {});
                        final editproduk = ProdukX(
                          id: selectedId,
                          nama: editNama,
                          harga: editHarga,
                          desc: editDesc,
                          createdAt: editCreatedAt,
                          image: imageUrl,
                        );
                        // setState(() {});
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
