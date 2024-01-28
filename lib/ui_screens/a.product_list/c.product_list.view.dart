part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  ct.deleteAccount();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                icon: const Icon(Icons.no_accounts),
                label: const Text('delete account'),
              ),
            ),
          ],
          title: const Text('Product List View'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductAddView()),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: OnBuilder<List<ProdukX>>.all(
          // listenTo: dt.rxProductList,
          listenToMany: [dt.rxLoadMore],
          onWaiting: () => dt.rxProductList.state.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : OnReactive(() => const ProductList()),
          onError: (error, refreshError) => Text(error),
          onData: (data) => OnReactive(
            () => const ProductList(),
          ),
        ));
  }
}
