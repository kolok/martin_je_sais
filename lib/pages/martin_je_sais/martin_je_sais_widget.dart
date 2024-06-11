import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/custom_component/error_modale/error_modale_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'martin_je_sais_model.dart';
export 'martin_je_sais_model.dart';

class MartinJeSaisWidget extends StatefulWidget {
  const MartinJeSaisWidget({super.key});

  @override
  State<MartinJeSaisWidget> createState() => _MartinJeSaisWidgetState();
}

class _MartinJeSaisWidgetState extends State<MartinJeSaisWidget> {
  late MartinJeSaisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MartinJeSaisModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().chatGPTAppKey == '') {
        context.pushNamed('settingPage');
      }
    });

    _model.promptTextFieldTextController ??= TextEditingController();
    _model.promptTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
              child: Text(
                'Martin je sais',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 30.0,
              buttonSize: 50.0,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.menu,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
              onPressed: () async {
                _model.displayMenu = !_model.displayMenu;
                setState(() {});
              },
            ),
          ],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final chatHisto = FFAppState().chatHistory.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: chatHisto.length,
                              itemBuilder: (context, chatHistoIndex) {
                                final chatHistoItem = chatHisto[chatHistoIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (chatHistoItem.author == 'user')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        chatHistoItem.content,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (chatHistoItem.author != 'user')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        chatHistoItem.content,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                );
                              },
                              controller: _model.listViewController,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.promptTextFieldTextController,
                                  focusNode: _model.promptTextFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Quelle est ta question',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 3,
                                  minLines: 1,
                                  validator: _model
                                      .promptTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: FlutterFlowIconButton(
                                borderColor: const Color(0x00FFFFFF),
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0x00FFFFFF),
                                icon: Icon(
                                  Icons.send,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  _model.chatHistory =
                                      functions.saveChatHistory(
                                          _model.chatHistory,
                                          functions.convertToJSON(_model
                                              .promptTextFieldTextController
                                              .text));
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 300));
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  _model.chatGPTResponse =
                                      await ChatGPTCall.call(
                                    apiKey: FFAppState().chatGPTAppKey,
                                    promptJson: _model.chatHistory,
                                    model: FFAppState().chatGPTModel,
                                  );
                                  if ((_model.chatGPTResponse?.succeeded ??
                                      true)) {
                                    _model.chatHistory =
                                        functions.saveChatHistory(
                                            _model.chatHistory,
                                            getJsonField(
                                              (_model.chatGPTResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.choices[:].message''',
                                            ));
                                    setState(() {});
                                    setState(() {
                                      _model.promptTextFieldTextController
                                          ?.clear();
                                    });
                                  } else {
                                    FFAppState().errorDisplayed = getJsonField(
                                      (_model.chatGPTResponse?.jsonBody ?? ''),
                                      r'''$.error.message''',
                                    ).toString();
                                    setState(() {});
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const SizedBox(
                                              height: 250.0,
                                              child: ErrorModaleWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );

                                  setState(() {});
                                },
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: const Color(0x00FFFFFF),
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0x00FFFFFF),
                              icon: Icon(
                                Icons.gps_fixed,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                FFAppState()
                                    .addToChatHistory(ChatResponseStruct(
                                  author: 'user',
                                  content:
                                      _model.promptTextFieldTextController.text,
                                ));
                                setState(() {});
                                setState(() {
                                  _model.promptTextFieldTextController?.clear();
                                });
                                _model.jsonOutput =
                                    await actions.convertListToJson(
                                  FFAppState().chatHistory.toList(),
                                );
                                await actions.streamApiResponse(
                                  _model.jsonOutput!.toList(),
                                  () async {
                                    setState(() {});
                                    await _model.listViewController?.animateTo(
                                      _model.listViewController!.position
                                          .maxScrollExtent,
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                  },
                                );
                                await _model.listViewController?.animateTo(
                                  _model.listViewController!.position
                                      .maxScrollExtent,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_model.displayMenu)
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Visibility(
                      visible: _model.displayMenu,
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.displayMenu = !_model.displayMenu;
                                    setState(() {});

                                    context.pushNamed('settingPage');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                'Paramètres',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.chatHistory = null;
                                  setState(() {});
                                  _model.displayMenu = !_model.displayMenu;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              'Nouvelle conversation',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
