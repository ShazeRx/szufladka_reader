import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/book_info_part_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'book_details_page_widget.dart' show BookDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookDetailsPageModel extends FlutterFlowModel<BookDetailsPageWidget> {
  ///  Local state fields for this page.

  OrdersRecord? order;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel1;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel2;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel3;
  // Model for bookInfoPart component.
  late BookInfoPartModel bookInfoPartModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bookInfoPartModel1 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel2 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel3 = createModel(context, () => BookInfoPartModel());
    bookInfoPartModel4 = createModel(context, () => BookInfoPartModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bookInfoPartModel1.dispose();
    bookInfoPartModel2.dispose();
    bookInfoPartModel3.dispose();
    bookInfoPartModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
