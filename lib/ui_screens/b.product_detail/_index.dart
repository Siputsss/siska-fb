import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../admin/admin_data.dart';
import '../models/produk.dart';

part 'a.product_detail.data.dart';
part 'b.product_detail.ctrl.dart';
part 'c.product_detail.view.dart';

final dt = productDetailData.state;
final ct = ProductDetailCtrl();
