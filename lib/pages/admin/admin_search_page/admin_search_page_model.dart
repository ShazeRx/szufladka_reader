import '/backend/backend.dart';
import '/components/book_list_view/book_list_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_search_page_widget.dart' show AdminSearchPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AdminSearchPageModel extends FlutterFlowModel<AdminSearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<BooksRecord> simpleSearchResults = [];
  // Models for bookListView dynamic component.
  late FlutterFlowDynamicModels<BookListViewModel> bookListViewModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bookListViewModels = FlutterFlowDynamicModels(() => BookListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bookListViewModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
