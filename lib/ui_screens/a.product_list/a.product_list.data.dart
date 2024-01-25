part of '_index.dart';

final productListData = RM.inject(() => ProductListData());
// var selectedId = '';

class ProductListData {
  // List<ProdukX> produkList = [];
  final rxProductList = RM.inject<List<ProdukX>>(() => []);

  final rxLoadMore = RM.injectFuture<List<ProdukX>>(() => Future.value([]),
      sideEffects: SideEffects(
        initState: () => ct.readGetColl(),
        onSetState: (p0) {
          if (p0.hasData) {
            final products = p0.state.whereType<ProdukX>().toList();
            ct.loadmore(products);
          }
        },
      ));

  final limit = 3;

  final rxIsEnd = false.inj();

  final listCol = 'product';
}
