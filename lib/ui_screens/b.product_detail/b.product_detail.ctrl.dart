part of '_index.dart';

class ProductDetailCtrl {
  Future<ProdukX> getDoc() async {
    final result = await FirebaseFirestore.instance.collection(dt.docCol).doc(dtList.rxSelectedId.state).get();
    produkDetail = ProdukX.fromMap(result.data() ?? {});
    return produkDetail!;
  }

  void readGetDoc() {
    dt.rxProdukDetail.stateAsync = ct.getDoc();
  }

  Future<void> deleteDoc() async {
    await FirebaseFirestore.instance.collection('coba').doc(dtList.rxSelectedId.state).delete();
    await FirebaseFirestore.instance.collection('detail').doc(dtList.rxSelectedId.state).delete();
    await FirebaseStorage.instance.ref(dtList.rxSelectedId.state).delete();
    // final index = produkList.indexWhere((element) => element.id == dtList.rxSelectedId.state);
    // produkList.removeAt(index);
    dtList.rxProductList.state = [...dtList.rxProductList.state]
      ..removeWhere((element) => element.id == dtList.rxSelectedId.state);
  }
}
