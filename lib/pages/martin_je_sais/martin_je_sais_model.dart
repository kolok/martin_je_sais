import '/flutter_flow/flutter_flow_util.dart';
import 'martin_je_sais_widget.dart' show MartinJeSaisWidget;
import 'package:flutter/material.dart';

class MartinJeSaisModel extends FlutterFlowModel<MartinJeSaisWidget> {
  ///  Local state fields for this page.

  dynamic chatHistory;

  bool displayMenu = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - convertListToJson] action in IconButton widget.
  List<dynamic>? jsonOutput;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }
}
