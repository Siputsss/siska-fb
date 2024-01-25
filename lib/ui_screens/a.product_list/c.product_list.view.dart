part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List View'),
        ),
        body: Center(
          child: Column(
            children: [
              OnBuilder<List<ProdukX>>.all(
                // listenTo: dt.rxProductList,
                listenToMany: [dt.rxLoadMore],
                onWaiting: () => dt.rxProductList.state.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const ProductList(),
                onError: (error, refreshError) => Text(error),
                onData: (data) => const ProductList(),
              )
            ],
          ),
        ));
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return dt.rxProductList.state.isEmpty
        ? const Center(
            child: Text('data is empty'),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  dt.rxProductList.state.length,
                  (index) => OnReactive(
                    () => Card(
                      child: ListTile(
                        title: Text(dt.rxProductList.state[index].nama),
                        subtitle: Text(dt.rxProductList.state[index].createdAt),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                dt.rxIsEnd.state == true
                    ? const Center(child: Text('- end of list -'))
                    : ElevatedButton(
                        onPressed: () {
                          ct.readGetColl();
                        },
                        child: const Text("loadmore"),
                      ),
              ],
            ),
          );
  }
}
