part of '_index.dart';

class ProductDetailCtrl {
  Future<ProdukX> getDoc(String id) async {
    final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
    produkDetail = ProdukX.fromMap(result.data() ?? {});
    return produkDetail!;
  }
}

void readGetDoc(String id) {
  // dt.rxProdukDetail.stateAsync = getDoc(id);
}
