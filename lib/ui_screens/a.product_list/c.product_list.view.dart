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
              OnBuilder.all(
                listenTo: dt.rxProductList,
                onWaiting: () => const CircularProgressIndicator(),
                onError: (error, refreshError) => Text(error.toString()),
                onData: (data) => Column(
                  children: [
                    ...List.generate(
                      data.length,
                      (index) => OnReactive(
                        () => Card(
                          child: ListTile(
                            title: Text(data[index].nama),
                            subtitle: Text(data[index].id),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
