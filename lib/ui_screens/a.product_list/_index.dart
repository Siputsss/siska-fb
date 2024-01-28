import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siska_fb/ui_screens/b.product_detail/_index.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../c.product_add/_index.dart';
import '../e.login/_index.dart';
import '../models/produk.dart';

part 'a.product_list.data.dart';
part 'b.product_list.ctrl.dart';
part 'c.product_list.view.dart';

part 'widgets/product_list.dart';
part 'widgets/product_load_more.dart';

final dt = productListData.state;
final ct = ProductListCtrl();
