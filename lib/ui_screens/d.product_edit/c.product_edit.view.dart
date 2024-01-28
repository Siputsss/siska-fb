part of '_index.dart';

class ProductEditView extends StatelessWidget {
  const ProductEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Edit View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnReactive(
              () => dt.rxPickedImage.state == null
                  ? Card(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(dtDetail.rxProdukDetail.state!.image),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(dt.rxPickedImage.state!.path),
                    ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                dt.rxPickedImage.state = await ImagePicker().pickImage(source: ImageSource.gallery);
                // debugPrint(dt.rxPickedImage.state!.path);
              },
              child: const Text(
                "get image",
              ),
            ),
            const SizedBox(height: 20),
            OnFormBuilder(
              listenTo: dt.rxForm,
              builder: () => TextField(
                controller: dt.rxProductName.state.controller,
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
                controller: dt.rxProductPrice.state.controller,
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
                controller: dt.rxProductDesc.state.controller,
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
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
