part of '../_index.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => dt.rxProductList.state.isEmpty
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
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(dt.rxProductList.state[index].image),
                          ),
                          onTap: () {
                            ct.selectedId(dt.rxProductList.state[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductDetailView()),
                            );
                          },
                          selected: dt.rxSelectedId.state == dt.rxProductList.state[index].id,
                          selectedTileColor: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProductLoadMore(),
                ],
              ),
            ),
    );
  }
}
