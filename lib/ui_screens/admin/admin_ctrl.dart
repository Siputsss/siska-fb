import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/admin/admin_data.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';

Future createDoc(ProdukX data) async {
  final map = data.toMap();
  final docId = data.id;
  final nama = data.nama;
  final createdAt = data.createdAt;
  await FirebaseFirestore.instance.collection('coba').doc(docId).set({
    'nama': nama,
    'id': docId,
    'created_at': createdAt,
  });
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(map);
  userList.insert(0, data);
}

Future<List<ProdukX>> getColl() async {
  List<ProdukX> users = [];
  // final result = await FirebaseFirestore.instance.collection('coba').get();
  final result = await FirebaseFirestore.instance
      .collection('coba')
      .orderBy('created_at', descending: true)
      .limit(3)
      .startAfter([userList.isEmpty ? '9999-99-99' : userList.last.createdAt]).get();
  for (var element in result.docs) {
    users.add(ProdukX.fromMap(element.data()));
  }
  return users;
}

Future<ProdukX> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
  final produk = ProdukX.fromMap(result.data() ?? {});
  return produk;
}

Future<void> deleteDoc(String docId) async {
  await FirebaseFirestore.instance.collection('coba').doc(docId).delete();
  await FirebaseFirestore.instance.collection('detail').doc(docId).delete();
  final index = userList.indexWhere((element) => element.id == docId);
  userList.removeAt(index);
}

loadmore() async {
  final dataColl = await getColl();
  userList.addAll(dataColl);
  if (dataColl.length < 3) {
    isEnd = true;
  }
}

//*STORAGE
Future<String> upload() async {
  final namaFoto = pickedImage!.name;
  final tipeFoto = pickedImage!.mimeType;
  final idFoto = UniqueKey().toString();
  final imageByte = await pickedImage!.readAsBytes();
  final metaData = SettableMetadata(contentType: tipeFoto);
  final uploadImage = await FirebaseStorage.instance.ref('$idFoto $namaFoto').putData(imageByte, metaData);
  imageUrl = await uploadImage.ref.getDownloadURL();
  return imageUrl;
}
