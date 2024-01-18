import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';

final ctrlNama = TextEditingController();
final ctrlHarga = TextEditingController();
final ctrlDesc = TextEditingController();

final ctrlEditNama = TextEditingController();
final ctrlEditHarga = TextEditingController();
final ctrlEditDesc = TextEditingController();

ProdukX? produkDetail;

var isLoading = false;

var isShowClearNama = false;
var isShowClearHarga = false;
var isShowClearDesc = false;

var isShowClearEditNama = false;
var isShowClearEditHarga = false;
var isShowClearEditDesc = false;

var selectedId = '';

List<ProdukX> produkList = [];

var isEnd = false;

//* STORAGE */
XFile? pickedImage;
XFile? imageUpload;

var imageUrl = '';
