import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'perguntas_page_model.dart';
export 'perguntas_page_model.dart';

class PerguntasPageWidget extends StatefulWidget {
  const PerguntasPageWidget({
    super.key,
    required this.tema,
    required this.dificuldade,
    required this.quantidade,
  });

  final String? tema;
  final String? dificuldade;
  final String? quantidade;

  static String routeName = 'PerguntasPage';
  static String routePath = '/perguntasPage';

  @override
  State<PerguntasPageWidget> createState() => _PerguntasPageWidgetState();
}

class _PerguntasPageWidgetState extends State<PerguntasPageWidget> {
  late PerguntasPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerguntasPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultQuiz = await QuizCall.call(
        tema: widget.tema,
        dificuldade: widget.dificuldade,
        quantidade: widget.quantidade,
      );

      _model.listaPerguntas = ((_model.apiResultQuiz?.jsonBody ?? '')
              .toList()
              .map<PerguntasAPIStruct?>(PerguntasAPIStruct.maybeFromMap)
              .toList() as Iterable<PerguntasAPIStruct?>)
          .withoutNulls
          .toList()
          .cast<PerguntasAPIStruct>();
      _model.indiceAtual = 0;
      _model.perguntaAtual =
          _model.listaPerguntas.elementAtOrNull(_model.indiceAtual!);
      _model.totalPerguntas = _model.listaPerguntas.length;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: MediaQuery.sizeOf(context).width <= 500.0
            ? FlutterFlowTheme.of(context).primaryBackground
            : FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 500.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Builder(
                builder: (context) {
                  if (_model.listaPerguntas.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 36.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      '${((_model.indiceAtual!) + 1).toString()} de ${_model.totalPerguntas?.toString()}',
                                      'Carregando...',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  'Tema: ${widget.tema}',
                                  'Carregando...',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                _model.perguntaAtual?.pergunta,
                                '[pergunta atual]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final listaOpcoes =
                                    _model.perguntaAtual?.opcoes.toList() ??
                                        [];

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listaOpcoes.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listaOpcoesIndex) {
                                    final listaOpcoesItem =
                                        listaOpcoes[listaOpcoesIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (!_model.verificarResposta) {
                                          _model.opcaoEscolhida =
                                              listaOpcoesItem;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.opcaoEscolhida ==
                                                      listaOpcoesItem
                                                  ? Color(0x5939D2C0)
                                                  : FlutterFlowTheme.of(context)
                                                      .selecionado,
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.opcaoEscolhida ==
                                                        listaOpcoesItem
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        _model.letras
                                                            .elementAtOrNull(
                                                                listaOpcoesIndex),
                                                        '[A]',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 42.0,
                                                  child: VerticalDivider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listaOpcoesItem,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.verificarResposta)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (listaOpcoesItem ==
                                                          _model.perguntaAtual
                                                              ?.correta)
                                                        Icon(
                                                          Icons
                                                              .check_circle_outline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .success,
                                                          size: 24.0,
                                                        ),
                                                      if ((listaOpcoesItem ==
                                                              _model
                                                                  .opcaoEscolhida) &&
                                                          (_model.opcaoEscolhida !=
                                                              _model
                                                                  .perguntaAtual
                                                                  ?.correta))
                                                        Icon(
                                                          Icons.close_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          if (_model.verificarResposta)
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  () {
                                    if (_model.opcaoEscolhida ==
                                        _model.perguntaAtual?.correta) {
                                      return Color(0x5939D2C0);
                                    } else if (_model.opcaoEscolhida == null ||
                                        _model.opcaoEscolhida == '') {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    } else if (_model.opcaoEscolhida !=
                                        _model.perguntaAtual?.correta) {
                                      return Color(0x4CFF5963);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    }
                                  }(),
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (_model.opcaoEscolhida ==
                                          _model.perguntaAtual?.correta) {
                                        return FlutterFlowTheme.of(context)
                                            .secondary;
                                      } else if (_model.opcaoEscolhida ==
                                              null ||
                                          _model.opcaoEscolhida == '') {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      } else if (_model.opcaoEscolhida !=
                                          _model.perguntaAtual?.correta) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    _model.perguntaAtual?.explicacao,
                                    '[explicacao]',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.verificarResposta == false) {
                                      return FFButtonWidget(
                                        onPressed: (_model.opcaoEscolhida ==
                                                    null ||
                                                _model.opcaoEscolhida == '')
                                            ? null
                                            : () async {
                                                _model.verificarResposta = true;
                                                safeSetState(() {});
                                                if (_model.opcaoEscolhida ==
                                                    _model.perguntaAtual
                                                        ?.correta) {
                                                  _model.totalAcertos =
                                                      _model.totalAcertos! + 1;
                                                  safeSetState(() {});
                                                }
                                              },
                                        text: 'VERIFICAR',
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          disabledTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      );
                                    } else {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.opcaoEscolhida != null &&
                                              _model.opcaoEscolhida != '') {
                                            if (((_model.indiceAtual!) + 1) ==
                                                _model.totalPerguntas) {
                                              context.pushNamed(
                                                ConclusaoPageWidget.routeName,
                                                queryParameters: {
                                                  'totalAcertos':
                                                      serializeParam(
                                                    _model.totalAcertos,
                                                    ParamType.int,
                                                  ),
                                                  'totalPerguntas':
                                                      serializeParam(
                                                    _model.totalPerguntas,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              _model.indiceAtual =
                                                  _model.indiceAtual! + 1;
                                              _model.perguntaAtual = _model
                                                  .listaPerguntas
                                                  .elementAtOrNull(
                                                      _model.indiceAtual!);
                                              _model.opcaoEscolhida = null;
                                              _model.verificarResposta = false;
                                              safeSetState(() {});
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Escolha uma opção',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                              ),
                                            );
                                          }
                                        },
                                        text: valueOrDefault<String>(
                                          ((_model.indiceAtual!) + 1) !=
                                                  _model.totalPerguntas
                                              ? 'CONTINUAR'
                                              : 'CONCLUIR',
                                          '[proximo]',
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 1.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ].divide(SizedBox(width: 24.0)),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Carregando...',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
