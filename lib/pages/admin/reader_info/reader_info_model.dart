import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin/admin_orders_tab_bar/admin_orders_tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'reader_info_widget.dart' show ReaderInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReaderInfoModel extends FlutterFlowModel<ReaderInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for adminOrdersTabBar component.
  late AdminOrdersTabBarModel adminOrdersTabBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    adminOrdersTabBarModel =
        createModel(context, () => AdminOrdersTabBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminOrdersTabBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
