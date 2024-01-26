part of '../_index.dart';

class ProductLoadMore extends StatelessWidget {
  const ProductLoadMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnBuilder.all(
      listenToMany: [dt.rxLoadMore],
      onWaiting: () => const Center(child: CircularProgressIndicator()),
      onError: (error, refreshError) => Text(error),
      onData: (data) => dt.rxIsEnd.state == true
          ? const Center(child: Text('- end of list -'))
          : ElevatedButton(
              onPressed: () {
                ct.readGetColl();
              },
              child: const Text("loadmore"),
            ),
    );
  }
}
