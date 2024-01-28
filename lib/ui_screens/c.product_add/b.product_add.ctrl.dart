part of '_index.dart';

class ProductAddCtrl {
  Future<void> createDoc() async {
    // final map = data.toMap();
    // final docId = data.id;
    final id = UniqueKey().toString();
    final nama = dt.rxProductName.value;
    final harga = int.parse(dt.rxProductPrice.value);
    final desc = dt.rxProductDesc.value;
    final createdAt = DateTime.now().toString();

    final data = ProdukX(
      id: id,
      nama: nama,
      harga: harga,
      desc: desc,
      createdAt: createdAt,
      image: await ct.uploadImage(id),
    );

    final imageUrl = dt.rxImageUrl.state;
    await FirebaseFirestore.instance.collection('coba').doc(id).set(
      {
        'nama': nama,
        'id': id,
        'harga': harga,
        'created_at': createdAt,
        'image': imageUrl,
      },
    );
    await FirebaseFirestore.instance.collection('detail').doc(id).set(data.toMap());
    dtList.rxProductList.state = [...dtList.rxProductList.state]..insert(0, data);
  }

  submit() => dt.rxForm.submit();

  Future<String> uploadImage(String id) async {
    // final namaFoto = pickedImage?.name;
    // final idFoto = UniqueKey().toString();
    final imageType = dt.rxPickedImage.state!.mimeType;
    final imageBytes = await dt.rxPickedImage.state!.readAsBytes();
    final metaData = SettableMetadata(contentType: imageType);
    final uploadImage = await FirebaseStorage.instance.ref(id).putData(imageBytes, metaData);
    dt.rxImageUrl.state = await uploadImage.ref.getDownloadURL();
    return dt.rxImageUrl.state;
  }
}
