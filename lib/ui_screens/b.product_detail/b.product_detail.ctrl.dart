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
}
