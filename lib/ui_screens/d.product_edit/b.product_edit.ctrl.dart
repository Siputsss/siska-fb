part of '_index.dart';

class ProductEditCtrl {
  Future<void> updateDoc() async {
    final docId = dtList.rxSelectedId.state;
    final nama = dt.rxProductName.state.value;
    final harga = int.parse(dt.rxProductPrice.state.value);
    final desc = dt.rxProductDesc.state.value;
    final createdAt = dtDetail.rxProdukDetail.state!.createdAt;
    String imageUrl = dtDetail.rxProdukDetail.state!.image;

    if (dt.rxPickedImage.state != null) {
      imageUrl = await ct.uploadImage(dtList.rxSelectedId.state);
    }

    final editData = ProdukX(
      id: docId,
      nama: nama,
      harga: harga,
      desc: desc,
      createdAt: createdAt,
      image: imageUrl,
    );

    await FirebaseFirestore.instance.collection('coba').doc(docId).set(
      {
        'nama': nama,
        'id': docId,
        'harga': harga,
        'created_at': createdAt,
        'image': imageUrl,
      },
    );
    await FirebaseFirestore.instance.collection('detail').doc(docId).set(editData.toMap());
    final index = dtList.rxProductList.state.indexWhere((element) => element.id == docId);
    // debugPrint(produkList[index].toString());
    dtList.rxProductList.setState((s) => s[index] = editData);
  }

  submit() => dt.rxForm.submit();

  Future<String> uploadImage(String id) async {
    // final namaFoto = pickedImage?.name;
    // final idFoto = UniqueKey().toString();
    final imageType = dt.rxPickedImage.state!.mimeType;
    final imageBytes = await dt.rxPickedImage.state!.readAsBytes();
    final metaData = SettableMetadata(contentType: imageType);
    final uploadImage = await FirebaseStorage.instance.ref(id).putData(imageBytes, metaData);
    dt.rxImageUrl = await uploadImage.ref.getDownloadURL();
    return dt.rxImageUrl;
  }
}
