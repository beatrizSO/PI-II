import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'sms_sent_model.dart';
export 'sms_sent_model.dart';

class SmsSentWidget extends StatefulWidget {
  const SmsSentWidget({super.key});

  @override
  State<SmsSentWidget> createState() => _SmsSentWidgetState();
}

class _SmsSentWidgetState extends State<SmsSentWidget> {
  late SmsSentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmsSentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: FlutterFlowTheme.of(context).success,
              size: 64.0,
            ),
            Text(
              'SMS enviado com sucesso!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              'Crie sua nova senha através do link\ne logue novamente',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed('Login');
              },
              text: 'Entrar',
              options: FFButtonOptions(
                width: 200.0,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
