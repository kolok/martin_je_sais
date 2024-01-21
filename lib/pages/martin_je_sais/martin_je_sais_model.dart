import '/backend/api_requests/api_calls.dart';
import '/custom_component/error_modale/error_modale_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'martin_je_sais_widget.dart' show MartinJeSaisWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MartinJeSaisModel extends FlutterFlowModel<MartinJeSaisWidget> {
  ///  Local state fields for this page.

  dynamic chatHistory;

  bool displayMenu = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldController;
  String? Function(BuildContext, String?)? promptTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (ChatGPT)] action in IconButton widget.
  ApiCallResponse? chatGPTResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    listViewController?.dispose();
    promptTextFieldFocusNode?.dispose();
    promptTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
