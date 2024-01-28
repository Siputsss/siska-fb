import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/a.product_list/_index.dart';
import 'package:siska_fb/ui_screens/d.product_edit/_index.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../x.admin/admin_data.dart';
import '../models/produk.dart';

part 'a.product_detail.data.dart';
part 'b.product_detail.ctrl.dart';
part 'c.product_detail.view.dart';

final dt = productDetailData.state;
final dtList = productListData.state;
final ct = ProductDetailCtrl();
