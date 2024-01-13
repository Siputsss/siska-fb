import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future createDoc(Map<String, dynamic> data) async {
  final docId = UniqueKey().toString();
  final nama = data['nama'];
  await FirebaseFirestore.instance.collection('coba').doc(docId).set({'nama': nama});
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(data);
}

Future<QuerySnapshot<Map<String, dynamic>>> getColl() async {
  final result = await FirebaseFirestore.instance.collection('coba').get();
  return result;
}

Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
  return result;
}
