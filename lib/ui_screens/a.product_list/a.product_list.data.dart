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
            final moreProducts = p0.state.whereType<ProdukX>().toList();
            ct.loadmore(moreProducts);
          }
        },
      ));

  final limit = 3;

  final rxIsEnd = false.inj();

  final listCol = 'coba';

  // var selectedId = '';
  final rxSelectedId = RM.inject<String>(() => '');
}
