import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_card_model.dart';
export 'book_card_model.dart';

class BookCardWidget extends StatefulWidget {
  const BookCardWidget({
    super.key,
    required this.title,
    required this.author,
    required this.image,
  });

  final String? title;
  final String? author;
  final String? image;

  @override
  State<BookCardWidget> createState() => _BookCardWidgetState();
}

class _BookCardWidgetState extends State<BookCardWidget> {
  late BookCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
                      'title',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.author,
                  'author',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
