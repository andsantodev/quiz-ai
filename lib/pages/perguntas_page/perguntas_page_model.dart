import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'perguntas_page_widget.dart' show PerguntasPageWidget;
import 'package:flutter/material.dart';

class PerguntasPageModel extends FlutterFlowModel<PerguntasPageWidget> {
  ///  Local state fields for this page.

  List<PerguntasAPIStruct> listaPerguntas = [];
  void addToListaPerguntas(PerguntasAPIStruct item) => listaPerguntas.add(item);
  void removeFromListaPerguntas(PerguntasAPIStruct item) =>
      listaPerguntas.remove(item);
  void removeAtIndexFromListaPerguntas(int index) =>
      listaPerguntas.removeAt(index);
  void insertAtIndexInListaPerguntas(int index, PerguntasAPIStruct item) =>
      listaPerguntas.insert(index, item);
  void updateListaPerguntasAtIndex(
          int index, Function(PerguntasAPIStruct) updateFn) =>
      listaPerguntas[index] = updateFn(listaPerguntas[index]);

  PerguntasAPIStruct? perguntaAtual;
  void updatePerguntaAtualStruct(Function(PerguntasAPIStruct) updateFn) {
    updateFn(perguntaAtual ??= PerguntasAPIStruct());
  }

  int? indiceAtual = 0;

  List<String> letras = ['A', 'B', 'C', 'D'];
  void addToLetras(String item) => letras.add(item);
  void removeFromLetras(String item) => letras.remove(item);
  void removeAtIndexFromLetras(int index) => letras.removeAt(index);
  void insertAtIndexInLetras(int index, String item) =>
      letras.insert(index, item);
  void updateLetrasAtIndex(int index, Function(String) updateFn) =>
      letras[index] = updateFn(letras[index]);

  int? totalPerguntas;

  String? opcaoEscolhida;

  bool verificarResposta = false;

  int? totalAcertos = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Quiz)] action in PerguntasPage widget.
  ApiCallResponse? apiResultQuiz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
