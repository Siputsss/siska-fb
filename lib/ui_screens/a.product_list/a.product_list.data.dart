part of '_index.dart';

final productListData = RM.inject(() => ProductListData());

class ProductListData {
  // List<ProdukX> produkList = [];
  final rxProductList = RM.injectFuture<List<ProdukX>>(() => Future.value([]),
      sideEffects: SideEffects(
        initState: () => ct.readGetColl(),
      ));
}
