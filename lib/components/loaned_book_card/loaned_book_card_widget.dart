import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loaned_book_card_model.dart';
export 'loaned_book_card_model.dart';

class LoanedBookCardWidget extends StatefulWidget {
  const LoanedBookCardWidget({
    super.key,
    required this.title,
    required this.author,
    required this.endDate,
    required this.image,
    required this.canBeRenewed,
  });

  final String? title;
  final String? author;
  final DateTime? endDate;
  final String? image;
  final bool? canBeRenewed;

  @override
  State<LoanedBookCardWidget> createState() => _LoanedBookCardWidgetState();
}

class _LoanedBookCardWidgetState extends State<LoanedBookCardWidget> {
  late LoanedBookCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoanedBookCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.image!,
            width: 100.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
                      'title',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.author,
                      'author',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'Zwrot do ${dateTimeFormat(
                      'd/M/y',
                      widget.endDate,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    widget.canBeRenewed!
                        ? 'Możliwe przedłużenie'
                        : 'Przedłużenie niedostępne',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
