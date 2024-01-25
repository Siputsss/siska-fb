import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder/scr/state_management/listeners/on_reactive.dart';

import '../models/produk.dart';

part 'a.product_list.data.dart';
part 'b.product_list.ctrl.dart';
part 'c.product_list.view.dart';

final dt = productListData.state;
final ct = ProductListCtrl();
