part of '_index.dart';

final productAddData = RM.inject(() => ProductAddData());

class ProductAddData {
  final rxForm = RM.injectForm(
    submit: () async => await ct.createDoc(),
  );

  final rxProductName = RM.injectTextEditing();

  final rxProductPrice = RM.injectTextEditing();

  final rxProductDesc = RM.injectTextEditing();
}
