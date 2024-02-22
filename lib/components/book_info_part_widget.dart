import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_info_part_model.dart';
export 'book_info_part_model.dart';

class BookInfoPartWidget extends StatefulWidget {
  const BookInfoPartWidget({
    super.key,
    this.bookInfoTitle,
    this.bookInfoDesc,
  });

  final String? bookInfoTitle;
  final String? bookInfoDesc;

  @override
  State<BookInfoPartWidget> createState() => _BookInfoPartWidgetState();
}

class _BookInfoPartWidgetState extends State<BookInfoPartWidget> {
  late BookInfoPartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookInfoPartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget.bookInfoTitle,
              'title',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            valueOrDefault<String>(
              widget.bookInfoDesc,
              'desc',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
