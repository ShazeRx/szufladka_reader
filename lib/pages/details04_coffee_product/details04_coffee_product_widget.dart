import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details04_coffee_product_model.dart';
export 'details04_coffee_product_model.dart';

class Details04CoffeeProductWidget extends StatefulWidget {
  const Details04CoffeeProductWidget({super.key});

  @override
  State<Details04CoffeeProductWidget> createState() =>
      _Details04CoffeeProductWidgetState();
}

class _Details04CoffeeProductWidgetState
    extends State<Details04CoffeeProductWidget> {
  late Details04CoffeeProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Details04CoffeeProductModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1577590835286-1cdd24c08fd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                          width: double.infinity,
                          height: 340.0,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.85, -0.4),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x7F0F1113),
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'SWEET LATTE',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                      child: Text(
                        'Espresso and steamed milk, lightly sweetened with unrefined brown sugar.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Coffee',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            Text(
                              'Reko Ethiopia',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Milk',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            Text(
                              'Whole Milk',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Espresso Shots',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            Text(
                              'Standard',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Sugar',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            Text(
                              'No Extra Sugar',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
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
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x411D2429),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Text(
                        'Add Item',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Text(
                      '1 Item • \$7',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0x99FFFFFF),
                            fontSize: 14.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
