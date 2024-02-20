import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/book_card/book_card_widget.dart';
import '/components/loaned_book_card/loaned_book_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.actionOrders = await actions.fetchOrderedBooksInStatuses(
        OrderStatus.values
            .where((e) => e == OrderStatus.Completed)
            .toList()
            .toList(),
      );
      _model.actionNewArrival = await actions.getNewArrivals();
      setState(() {
        _model.userOrders =
            _model.actionOrders!.toList().cast<OrderedBookStruct>();
        _model.dataLoadingCompleted = true;
        _model.newArrivals =
            _model.actionNewArrival!.toList().cast<BooksRecord>();
      });
    });
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Szufladka',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Wypożyczone książki',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 26.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final ordersList =
                                            _model.userOrders.toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: ordersList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, ordersListIndex) {
                                            final ordersListItem =
                                                ordersList[ordersListIndex];
                                            return Container(
                                              height: 150.0,
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<BooksRecord>(
                                                stream: BooksRecord.getDocument(
                                                    ordersListItem.book!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final loanedBookCardBooksRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'BookDetailsPage',
                                                        queryParameters: {
                                                          'book':
                                                              serializeParam(
                                                            loanedBookCardBooksRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'book':
                                                              loanedBookCardBooksRecord,
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .loanedBookCardModels
                                                          .getModel(
                                                        ordersListIndex
                                                            .toString(),
                                                        ordersListIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          LoanedBookCardWidget(
                                                        key: Key(
                                                          'Keyvxy_${ordersListIndex.toString()}',
                                                        ),
                                                        title:
                                                            loanedBookCardBooksRecord
                                                                .title,
                                                        author:
                                                            loanedBookCardBooksRecord
                                                                .author,
                                                        image:
                                                            loanedBookCardBooksRecord
                                                                .photo,
                                                        canBeRenewed:
                                                            ordersListItem
                                                                .canBeProlonged,
                                                        endDate: ordersListItem
                                                            .endDate!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Nowości',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 26.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final newArrivalsList =
                                            _model.newArrivals.toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: newArrivalsList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, newArrivalsListIndex) {
                                            final newArrivalsListItem =
                                                newArrivalsList[
                                                    newArrivalsListIndex];
                                            return Container(
                                              width: double.infinity,
                                              height: 250.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model: _model.bookCardModels
                                                    .getModel(
                                                  newArrivalsListIndex
                                                      .toString(),
                                                  newArrivalsListIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: BookCardWidget(
                                                  key: Key(
                                                    'Keyvqo_${newArrivalsListIndex.toString()}',
                                                  ),
                                                  title:
                                                      newArrivalsListItem.title,
                                                  author: newArrivalsListItem
                                                      .author,
                                                  image:
                                                      newArrivalsListItem.photo,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_model.dataLoadingCompleted == false)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Lottie.asset(
                        'assets/lottie_animations/szufladka_loader.json',
                        width: 150.0,
                        height: 130.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
