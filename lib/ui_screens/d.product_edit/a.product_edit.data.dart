part of '_index.dart';

final productEditData = RM.inject(() => ProductEditData());

class ProductEditData {
  final rxPickedImage = dtAdd.rxPickedImage;

  final rxForm = RM.injectForm(
    submit: () async => await ct.updateDoc(),
  );

  final rxProductName = RM.inject(
    () => RM.injectTextEditing(
      text: '${dtDetail.rxProdukDetail.state?.nama}',
    ),
  );

  final rxProductPrice = RM.inject(
    () => RM.injectTextEditing(
      text: '${dtDetail.rxProdukDetail.state?.harga}',
    ),
  );

  final rxProductDesc = RM.inject(
    () => RM.injectTextEditing(
      text: '${dtDetail.rxProdukDetail.state?.desc}',
    ),
  );

  var rxImageUrl = dtAdd.rxImageUrl.state;
}
