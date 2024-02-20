import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loaned_book_card/loaned_book_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
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

  bool dataLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - fetchOrderedBooksInPendingStatus] action in home widget.
  List<OrderedBookStruct>? actionOrders;
  // Models for loanedBookCard dynamic component.
  late FlutterFlowDynamicModels<LoanedBookCardModel> loanedBookCardModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loanedBookCardModels =
        FlutterFlowDynamicModels(() => LoanedBookCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loanedBookCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
