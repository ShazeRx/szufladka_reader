import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/base_button/base_button_widget.dart';
import '/components/book_cancelation_order_sheet/book_cancelation_order_sheet_widget.dart';
import '/components/book_info_part/book_info_part_widget.dart';
import '/components/book_reservartion_bottom_sheet/book_reservartion_bottom_sheet_widget.dart';
import '/components/icon_info_row/icon_info_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'book_details_page_widget.dart' show BookDetailsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookDetailsPageModel extends FlutterFlowModel<BookDetailsPageWidget> {
  ///  Local state fields for this page.

  OrdersRecord? order;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getOrderForABookOrNull] action in BookDetailsPage widget.
  DocumentReference? orderRefForABook;
  // Stores action output result for [Backend Call - Read Document] action in BookDetailsPage widget.
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
  // Model for iconInfoRow component.
  late IconInfoRowModel iconInfoRowModel1;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel2;
  // Model for iconInfoRow component.
  late IconInfoRowModel iconInfoRowModel2;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel3;
  // Model for iconInfoRow component.
  late IconInfoRowModel iconInfoRowModel3;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel4;
  // Model for iconInfoRow component.
  late IconInfoRowModel iconInfoRowModel4;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel5;
  // Model for baseButton component.
  late BaseButtonModel baseButtonModel6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bookInfoPartModel1 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel2 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel3 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel4 = createModel(context, () => BookInfoPartModel());
    baseButtonModel1 = createModel(context, () => BaseButtonModel());
    iconInfoRowModel1 = createModel(context, () => IconInfoRowModel());
    baseButtonModel2 = createModel(context, () => BaseButtonModel());
    iconInfoRowModel2 = createModel(context, () => IconInfoRowModel());
    baseButtonModel3 = createModel(context, () => BaseButtonModel());
    iconInfoRowModel3 = createModel(context, () => IconInfoRowModel());
    baseButtonModel4 = createModel(context, () => BaseButtonModel());
    iconInfoRowModel4 = createModel(context, () => IconInfoRowModel());
    baseButtonModel5 = createModel(context, () => BaseButtonModel());
    baseButtonModel6 = createModel(context, () => BaseButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bookInfoPartModel1.dispose();
    bookInfoPartModel2.dispose();
    bookInfoPartModel3.dispose();
    bookInfoPartModel4.dispose();
    baseButtonModel1.dispose();
    iconInfoRowModel1.dispose();
    baseButtonModel2.dispose();
    iconInfoRowModel2.dispose();
    baseButtonModel3.dispose();
    iconInfoRowModel3.dispose();
    baseButtonModel4.dispose();
    iconInfoRowModel4.dispose();
    baseButtonModel5.dispose();
    baseButtonModel6.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
