part of '_index.dart';

class ProductAddView extends StatelessWidget {
  const ProductAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Add View'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnFormBuilder(
                  listenTo: dt.rxForm,
                  builder: () => TextField(
                    controller: dt.rxProductName.controller,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OnFormBuilder(
                  listenTo: dt.rxForm,
                  builder: () => TextField(
                    controller: dt.rxProductPrice.controller,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OnFormBuilder(
                  listenTo: dt.rxForm,
                  builder: () => TextField(
                    controller: dt.rxProductDesc.controller,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OnFormSubmissionBuilder(
                  listenTo: dt.rxForm,
                  onSubmitting: () => const CircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () async {
                      await ct.submit();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
