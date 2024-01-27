part of '_index.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail View'),
        ),
        body: OnBuilder<ProdukX?>.all(
          listenTo: dt.rxProdukDetail,
          onWaiting: () => const Center(child: CircularProgressIndicator()),
          onError: (error, refreshError) => Text(error),
          onData: (data) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data!.id),
                Text(data.nama),
                Text('Rp ${data.harga}'),
                Text(data.desc),
              ],
            ),
          ),
        ));
  }
}
