import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';

final ctrlNama = TextEditingController();
final ctrlHarga = TextEditingController();
final ctrlDesc = TextEditingController();

var isLoading = false;

var isShowClearNama = false;
var isShowClearHarga = false;
var isShowClearDesc = false;

var selectedId = '';

List<ProdukX> userList = [];

var isEnd = false;
