import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/book_list_view/book_list_view_widget.dart';
import '/components/loaned_book_card/loaned_book_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'my_bookshelf_page_widget.dart' show MyBookshelfPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyBookshelfPageModel extends FlutterFlowModel<MyBookshelfPageWidget> {
  ///  Local state fields for this page.

  List<OrderedBookStruct> userOrders = [];
  void addToUserOrders(OrderedBookStruct item) => userOrders.add(item);
  void removeFromUserOrders(OrderedBookStruct item) => userOrders.remove(item);
  void removeAtIndexFromUserOrders(int index) => userOrders.removeAt(index);
  void insertAtIndexInUserOrders(int index, OrderedBookStruct item) =>
      userOrders.insert(index, item);
  void updateUserOrdersAtIndex(
          int index, Function(OrderedBookStruct) updateFn) =>
      userOrders[index] = updateFn(userOrders[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - fetchOrderedBooksInStatuses] action in MyBookshelfPage widget.
  List<OrderedBookStruct>? actionLoanedBooks;
  // Models for loanedBookCard dynamic component.
  late FlutterFlowDynamicModels<LoanedBookCardModel> loanedBookCardModels;
  // Models for bookListView dynamic component.
  late FlutterFlowDynamicModels<BookListViewModel> bookListViewModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loanedBookCardModels =
        FlutterFlowDynamicModels(() => LoanedBookCardModel());
    bookListViewModels = FlutterFlowDynamicModels(() => BookListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loanedBookCardModels.dispose();
    bookListViewModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
