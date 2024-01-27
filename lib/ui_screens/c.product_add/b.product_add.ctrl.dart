part of '_index.dart';

class ProductAddCtrl {
  Future<void> createDoc() async {
    // final map = data.toMap();
    // final docId = data.id;
    final docId = UniqueKey().toString();
    final nama = dt.rxProductName.value;
    final harga = int.parse(dt.rxProductPrice.value);
    final desc = dt.rxProductDesc.value;
    final createdAt = DateTime.now().toString();

    final data = ProdukX(
      id: docId,
      nama: nama,
      harga: harga,
      desc: desc,
      createdAt: createdAt,
    );

    await FirebaseFirestore.instance.collection('coba').doc(docId).set(
      {
        'nama': nama,
        'id': docId,
        'harga': harga,
        'created_at': createdAt,
        // 'image': data.image,
      },
    );
    await FirebaseFirestore.instance.collection('detail').doc(docId).set(data.toMap());
    dtList.rxProductList.state = [...dtList.rxProductList.state]..insert(0, data);
  }

  submit() => dt.rxForm.submit();
}
