import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? opcaoSelecionada;

  bool opcaoClicada = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for inputTema widget.
  FocusNode? inputTemaFocusNode;
  TextEditingController? inputTemaTextController;
  String? Function(BuildContext, String?)? inputTemaTextControllerValidator;
  // State field(s) for RadioButtonDificuldade widget.
  FormFieldController<String>? radioButtonDificuldadeValueController;
  // State field(s) for DropDificuldade widget.
  String? dropDificuldadeValue;
  FormFieldController<String>? dropDificuldadeValueController;
  // State field(s) for RadioButtonQtdPerguntas widget.
  FormFieldController<String>? radioButtonQtdPerguntasValueController;
  // State field(s) for DropQtdPerguntas widget.
  String? dropQtdPerguntasValue;
  FormFieldController<String>? dropQtdPerguntasValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputTemaFocusNode?.dispose();
    inputTemaTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonDificuldadeValue =>
      radioButtonDificuldadeValueController?.value;
  String? get radioButtonQtdPerguntasValue =>
      radioButtonQtdPerguntasValueController?.value;
}
