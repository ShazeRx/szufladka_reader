import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/admin/admin_order_list_tile/admin_order_list_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_orders_tab_bar_widget.dart' show AdminOrdersTabBarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminOrdersTabBarModel extends FlutterFlowModel<AdminOrdersTabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in TabBar widget.
  List<OrdersRecord>? userOrders;
  // Stores action output result for [Firestore Query - Query a collection] action in TabBar widget.
  List<OrdersRecord>? allOrders;
  // Models for adminOrderListTile dynamic component.
  late FlutterFlowDynamicModels<AdminOrderListTileModel>
      adminOrderListTileModels1;
  // Models for adminOrderListTile dynamic component.
  late FlutterFlowDynamicModels<AdminOrderListTileModel>
      adminOrderListTileModels2;
  // Models for adminOrderListTile dynamic component.
  late FlutterFlowDynamicModels<AdminOrderListTileModel>
      adminOrderListTileModels3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    adminOrderListTileModels1 =
        FlutterFlowDynamicModels(() => AdminOrderListTileModel());
    adminOrderListTileModels2 =
        FlutterFlowDynamicModels(() => AdminOrderListTileModel());
    adminOrderListTileModels3 =
        FlutterFlowDynamicModels(() => AdminOrderListTileModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    adminOrderListTileModels1.dispose();
    adminOrderListTileModels2.dispose();
    adminOrderListTileModels3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
