part of '_index.dart';

class ProductListCtrl {
  Future<List<ProdukX>> getColl() async {
    List<ProdukX> users = [];
    final result =
        await FirebaseFirestore.instance.collection('coba').orderBy('created_at', descending: true).limit(3).get();
    for (var element in result.docs) {
      users.add(ProdukX.fromMap(element.data()));
    }
    return users;
  }

  void readGetColl() {
    dt.rxProductList.stateAsync = getColl();
  }
}
