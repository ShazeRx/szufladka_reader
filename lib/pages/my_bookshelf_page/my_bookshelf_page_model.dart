import '/components/loaned_book_card/loaned_book_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'my_bookshelf_page_widget.dart' show MyBookshelfPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyBookshelfPageModel extends FlutterFlowModel<MyBookshelfPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for loanedBookCard component.
  late LoanedBookCardModel loanedBookCardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loanedBookCardModel = createModel(context, () => LoanedBookCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loanedBookCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
