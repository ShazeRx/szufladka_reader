import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_book_widget.dart' show AddBookWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBookModel extends FlutterFlowModel<AddBookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for jobTitle widget.
  FocusNode? jobTitleFocusNode;
  TextEditingController? jobTitleController;
  String? Function(BuildContext, String?)? jobTitleControllerValidator;
  // State field(s) for workEmail widget.
  FocusNode? workEmailFocusNode1;
  TextEditingController? workEmailController1;
  String? Function(BuildContext, String?)? workEmailController1Validator;
  // State field(s) for workEmail widget.
  FocusNode? workEmailFocusNode2;
  TextEditingController? workEmailController2;
  String? Function(BuildContext, String?)? workEmailController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for workEmail widget.
  FocusNode? workEmailFocusNode3;
  TextEditingController? workEmailController3;
  String? Function(BuildContext, String?)? workEmailController3Validator;
  // State field(s) for workEmail widget.
  FocusNode? workEmailFocusNode4;
  TextEditingController? workEmailController4;
  String? Function(BuildContext, String?)? workEmailController4Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    jobTitleFocusNode?.dispose();
    jobTitleController?.dispose();

    workEmailFocusNode1?.dispose();
    workEmailController1?.dispose();

    workEmailFocusNode2?.dispose();
    workEmailController2?.dispose();

    workEmailFocusNode3?.dispose();
    workEmailController3?.dispose();

    workEmailFocusNode4?.dispose();
    workEmailController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
