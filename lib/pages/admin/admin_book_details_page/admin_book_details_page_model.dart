import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/base_button/base_button_widget.dart';
import '/components/book_cancelation_order_sheet/book_cancelation_order_sheet_widget.dart';
import '/components/book_info_part/book_info_part_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'admin_book_details_page_widget.dart' show AdminBookDetailsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminBookDetailsPageModel
    extends FlutterFlowModel<AdminBookDetailsPageWidget> {
  ///  Local state fields for this page.

  OrdersRecord? order;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getOrderForABookOrNull] action in AdminBookDetailsPage widget.
  DocumentReference? orderRefForABook;
  // Stores action output result for [Backend Call - Read Document] action in AdminBookDetailsPage widget.
  OrdersRecord? orderForABook;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel1;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel2;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel3;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel4;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel1;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bookInfoPartModel1 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel2 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel3 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel4 = createModel(context, () => BookInfoPartModel());
    baseButtonModel1 = createModel(context, () => BaseButtonModel());
    baseButtonModel2 = createModel(context, () => BaseButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bookInfoPartModel1.dispose();
    bookInfoPartModel2.dispose();
    bookInfoPartModel3.dispose();
    bookInfoPartModel4.dispose();
    baseButtonModel1.dispose();
    baseButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
