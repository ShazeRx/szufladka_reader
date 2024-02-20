import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_info_row_model.dart';
export 'icon_info_row_model.dart';

class IconInfoRowWidget extends StatefulWidget {
  const IconInfoRowWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<IconInfoRowWidget> createState() => _IconInfoRowWidgetState();
}

class _IconInfoRowWidgetState extends State<IconInfoRowWidget> {
  late IconInfoRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconInfoRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.info,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.text,
                  'text',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
