import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../a.product_list/_index.dart';
import '../b.product_detail/_index.dart';
import '../c.product_add/_index.dart';
import '../models/produk.dart';

part 'a.product_edit.data.dart';
part 'b.product_edit.ctrl.dart';
part 'c.product_edit.view.dart';

final dt = productEditData.state;
final dtList = productListData.state;
final dtDetail = productDetailData.state;
final dtAdd = productAddData.state;
final ct = ProductEditCtrl();
