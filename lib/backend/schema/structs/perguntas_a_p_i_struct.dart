// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerguntasAPIStruct extends BaseStruct {
  PerguntasAPIStruct({
    String? pergunta,
    List<String>? opcoes,
    String? correta,
    String? explicacao,
  })  : _pergunta = pergunta,
        _opcoes = opcoes,
        _correta = correta,
        _explicacao = explicacao;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "opcoes" field.
  List<String>? _opcoes;
  List<String> get opcoes => _opcoes ?? const [];
  set opcoes(List<String>? val) => _opcoes = val;

  void updateOpcoes(Function(List<String>) updateFn) {
    updateFn(_opcoes ??= []);
  }

  bool hasOpcoes() => _opcoes != null;

  // "correta" field.
  String? _correta;
  String get correta => _correta ?? '';
  set correta(String? val) => _correta = val;

  bool hasCorreta() => _correta != null;

  // "explicacao" field.
  String? _explicacao;
  String get explicacao => _explicacao ?? '';
  set explicacao(String? val) => _explicacao = val;

  bool hasExplicacao() => _explicacao != null;

  static PerguntasAPIStruct fromMap(Map<String, dynamic> data) =>
      PerguntasAPIStruct(
        pergunta: data['pergunta'] as String?,
        opcoes: getDataList(data['opcoes']),
        correta: data['correta'] as String?,
        explicacao: data['explicacao'] as String?,
      );

  static PerguntasAPIStruct? maybeFromMap(dynamic data) => data is Map
      ? PerguntasAPIStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pergunta': _pergunta,
        'opcoes': _opcoes,
        'correta': _correta,
        'explicacao': _explicacao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'opcoes': serializeParam(
          _opcoes,
          ParamType.String,
          isList: true,
        ),
        'correta': serializeParam(
          _correta,
          ParamType.String,
        ),
        'explicacao': serializeParam(
          _explicacao,
          ParamType.String,
        ),
      }.withoutNulls;

  static PerguntasAPIStruct fromSerializableMap(Map<String, dynamic> data) =>
      PerguntasAPIStruct(
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        opcoes: deserializeParam<String>(
          data['opcoes'],
          ParamType.String,
          true,
        ),
        correta: deserializeParam(
          data['correta'],
          ParamType.String,
          false,
        ),
        explicacao: deserializeParam(
          data['explicacao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PerguntasAPIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PerguntasAPIStruct &&
        pergunta == other.pergunta &&
        listEquality.equals(opcoes, other.opcoes) &&
        correta == other.correta &&
        explicacao == other.explicacao;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([pergunta, opcoes, correta, explicacao]);
}

PerguntasAPIStruct createPerguntasAPIStruct({
  String? pergunta,
  String? correta,
  String? explicacao,
}) =>
    PerguntasAPIStruct(
      pergunta: pergunta,
      correta: correta,
      explicacao: explicacao,
    );
