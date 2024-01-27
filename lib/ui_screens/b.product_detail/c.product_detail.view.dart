part of '_index.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail View'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await ct.deleteDoc();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: const Icon(Icons.delete),
        ),
        body: OnBuilder<ProdukX?>.all(
          listenTo: dt.rxProdukDetail,
          onWaiting: () => const Center(child: CircularProgressIndicator()),
          onError: (error, refreshError) => Text(error),
          onData: (data) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(data!.image),
                ),
                Text(data.id),
                Text(data.nama),
                Text('Rp ${data.harga}'),
                Text(data.desc),
              ],
            ),
          ),
        ));
  }
}
