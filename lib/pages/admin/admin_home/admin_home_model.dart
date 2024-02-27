import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin/admin_orders_tab_bar/admin_orders_tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'admin_home_widget.dart' show AdminHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminHomeModel extends FlutterFlowModel<AdminHomeWidget> {
  ///  Local state fields for this page.

  UsersRecord? loggedAdmin;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var readerId = '';
  // Stores action output result for [Custom Action - getUserDocByUid] action in ScanQr widget.
  UsersRecord? userDoc;
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
