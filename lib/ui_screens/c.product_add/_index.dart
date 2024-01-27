import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/a.product_list/_index.dart';
import 'package:siska_fb/ui_screens/models/produk.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

part 'a.product_add.data.dart';
part 'b.product_add.ctrl.dart';
part 'c.product_add.view.dart';

final dt = productAddData.state;
final dtList = productListData.state;
final ct = ProductAddCtrl();
