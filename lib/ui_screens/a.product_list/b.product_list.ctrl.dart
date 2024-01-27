part of '_index.dart';

class ProductListCtrl {
  Future<List<ProdukX>> getColl() async {
    List<ProdukX> products = [];
    final result = await FirebaseFirestore.instance
        .collection(dt.listCol)
        .orderBy('created_at', descending: true)
        .limit(dt.limit)
        .startAfter([dt.rxProductList.state.isEmpty ? '9999-99-99' : dt.rxProductList.state.last.createdAt]).get();
    for (var element in result.docs) {
      products.add(ProdukX.fromMap(element.data()));
    }
    return products;
  }

  // Future<List<ProdukX>> getColl() async {
  //   List<ProdukX> users = [];
  //   final result =
  //       await FirebaseFirestore.instance.collection('coba').orderBy('created_at', descending: true).limit(3).get();
  //   for (var element in result.docs) {
  //     users.add(ProdukX.fromMap(element.data()));
  //   }
  //   return users;
  // }

  void readGetColl() {
    dt.rxLoadMore.stateAsync = getColl();
  }

  loadmore(List<ProdukX> moreProducts) {
    dt.rxProductList.state = [...dt.rxProductList.state, ...moreProducts];
    if (moreProducts.length < dt.limit) {
      dt.rxIsEnd.state = true;
    }

    // final dataColl = await getColl();
    // produkList.addAll(dataColl);
    // if (dataColl.length < 3) {
    //   isEnd = true;
    // }
  }

  selectedId(String id) {
    dt.rxSelectedId.state = id;
  }
}
