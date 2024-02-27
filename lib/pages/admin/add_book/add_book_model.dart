import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_book_widget.dart' show AddBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBookModel extends FlutterFlowModel<AddBookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for bookTitle widget.
  FocusNode? bookTitleFocusNode;
  TextEditingController? bookTitleController;
  String? Function(BuildContext, String?)? bookTitleControllerValidator;
  String? _bookTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pole jest wymagane';
    }

    if (val.length < 4) {
      return 'Tytuł wymaga conajmniej 4 znaków';
    }

    return null;
  }

  // State field(s) for author widget.
  FocusNode? authorFocusNode;
  TextEditingController? authorController;
  String? Function(BuildContext, String?)? authorControllerValidator;
  // State field(s) for bookDesc widget.
  FocusNode? bookDescFocusNode;
  TextEditingController? bookDescController;
  String? Function(BuildContext, String?)? bookDescControllerValidator;
  String? _bookDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pole jest wymagane';
    }

    if (val.length < 10) {
      return 'Opis wymaga conajmniej 10 znaków';
    }

    return null;
  }

  // State field(s) for publisher widget.
  FocusNode? publisherFocusNode;
  TextEditingController? publisherController;
  String? Function(BuildContext, String?)? publisherControllerValidator;
  String? _publisherControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pole jest wymagane';
    }

    return null;
  }

  // State field(s) for categoryChips widget.
  FormFieldController<List<String>>? categoryChipsValueController;
  String? get categoryChipsValue =>
      categoryChipsValueController?.value?.firstOrNull;
  set categoryChipsValue(String? val) =>
      categoryChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for languageChips widget.
  FormFieldController<List<String>>? languageChipsValueController;
  String? get languageChipsValue =>
      languageChipsValueController?.value?.firstOrNull;
  set languageChipsValue(String? val) =>
      languageChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for isbn widget.
  FocusNode? isbnFocusNode;
  TextEditingController? isbnController;
  String? Function(BuildContext, String?)? isbnControllerValidator;
  String? _isbnControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pole jest wymagane';
    }

    return null;
  }

  // State field(s) for available widget.
  FocusNode? availableFocusNode;
  TextEditingController? availableController;
  String? Function(BuildContext, String?)? availableControllerValidator;
  String? _availableControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pole jest wymagane';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bookTitleControllerValidator = _bookTitleControllerValidator;
    bookDescControllerValidator = _bookDescControllerValidator;
    publisherControllerValidator = _publisherControllerValidator;
    isbnControllerValidator = _isbnControllerValidator;
    availableControllerValidator = _availableControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bookTitleFocusNode?.dispose();
    bookTitleController?.dispose();

    authorFocusNode?.dispose();
    authorController?.dispose();

    bookDescFocusNode?.dispose();
    bookDescController?.dispose();

    publisherFocusNode?.dispose();
    publisherController?.dispose();

    isbnFocusNode?.dispose();
    isbnController?.dispose();

    availableFocusNode?.dispose();
    availableController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
