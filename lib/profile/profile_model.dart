import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name_Create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateTextController;
  String? Function(BuildContext, String?)? nameCreateTextControllerValidator;
  // State field(s) for address_Create widget.
  FocusNode? addressCreateFocusNode;
  TextEditingController? addressCreateTextController;
  String? Function(BuildContext, String?)? addressCreateTextControllerValidator;
  // State field(s) for phoneNumber_Create widget.
  FocusNode? phoneNumberCreateFocusNode;
  TextEditingController? phoneNumberCreateTextController;
  String? Function(BuildContext, String?)?
      phoneNumberCreateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameCreateFocusNode?.dispose();
    nameCreateTextController?.dispose();

    addressCreateFocusNode?.dispose();
    addressCreateTextController?.dispose();

    phoneNumberCreateFocusNode?.dispose();
    phoneNumberCreateTextController?.dispose();
  }
}
