part of '_index.dart';

final productDetailData = RM.inject(() => ProductDetailData());

class ProductDetailData {
  // ProdukX? produkDetail;
  final rxProdukDetail = RM.injectFuture<ProdukX?>(
    () => Future.value(null),
  );
}