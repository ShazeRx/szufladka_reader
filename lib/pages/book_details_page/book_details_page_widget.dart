import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/base_button/base_button_widget.dart';
import '/components/book_cancelation_order_sheet/book_cancelation_order_sheet_widget.dart';
import '/components/book_info_part/book_info_part_widget.dart';
import '/components/book_reservartion_bottom_sheet/book_reservartion_bottom_sheet_widget.dart';
import '/components/icon_info_row/icon_info_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_details_page_model.dart';
export 'book_details_page_model.dart';

class BookDetailsPageWidget extends StatefulWidget {
  const BookDetailsPageWidget({
    super.key,
    required this.book,
  });

  final BooksRecord? book;

  @override
  State<BookDetailsPageWidget> createState() => _BookDetailsPageWidgetState();
}

class _BookDetailsPageWidgetState extends State<BookDetailsPageWidget> {
  late BookDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.orderRefForABook = await actions.getOrderForABookOrNull(
        widget.book!.reference,
      );
      if (_model.orderRefForABook != null) {
        _model.orderForABook =
            await OrdersRecord.getDocumentOnce(_model.orderRefForABook!);
      } else {
        return;
      }

      setState(() {
        _model.order = _model.orderForABook;
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Szczegóły książki',
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.book!.photo,
                            width: 100.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.book?.title,
                                'title',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.book?.author,
                                'author',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Text(
                                () {
                                  if (_model.order != null) {
                                    return 'Wypożyczona do dnia ${dateTimeFormat(
                                      'd/M/y',
                                      _model.order?.endDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}';
                                  } else if (widget.book!.available > 0) {
                                    return 'Dostępna';
                                  } else {
                                    return 'Niedostępna';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: widget.book!.available > 0
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Opis',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.book?.description,
                                    'desc',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Informacje o książce',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.bookInfoPartModel1,
                                      updateCallback: () => setState(() {}),
                                      child: BookInfoPartWidget(
                                        bookInfoTitle: 'Kategoria',
                                        bookInfoDesc: widget.book?.category,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.bookInfoPartModel2,
                                        updateCallback: () => setState(() {}),
                                        child: BookInfoPartWidget(
                                          bookInfoTitle: 'Język',
                                          bookInfoDesc: widget.book?.language,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.bookInfoPartModel3,
                                      updateCallback: () => setState(() {}),
                                      child: BookInfoPartWidget(
                                        bookInfoTitle: 'Wydawca',
                                        bookInfoDesc: widget.book?.publisher,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.bookInfoPartModel4,
                                        updateCallback: () => setState(() {}),
                                        child: BookInfoPartWidget(
                                          bookInfoTitle: 'ISBN',
                                          bookInfoDesc: widget.book?.isbn,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recenzje',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        if (widget.book!.rating > 0.0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  direction: Axis.horizontal,
                                  rating: widget.book!.rating,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 40.0,
                                ),
                                Text(
                                  formatNumber(
                                    widget.book!.rating,
                                    formatType: FormatType.custom,
                                    format: '0.0',
                                    locale: '',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.book?.rating == 0.0)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Brak recenzji',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (_model.order != null) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (functions.getProlongateBookOptions(
                                            _model.order!) ==
                                        BookProlongateOptions.TimedOut) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.baseButtonModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BaseButtonWidget(
                                                    text:
                                                        'Prolongata niemożliwa',
                                                    disabled: true,
                                                    action: () async {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model: _model.iconInfoRowModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: IconInfoRowWidget(
                                              text:
                                                  'Termin oddania minął. Prosimy o jak najszybszy zwrot książki',
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (functions
                                            .getProlongateBookOptions(
                                                _model.order!) ==
                                        BookProlongateOptions
                                            .NoProlongationsLeft) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.baseButtonModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BaseButtonWidget(
                                                    text:
                                                        'Prolongata niemożliwa',
                                                    disabled: true,
                                                    action: () async {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model: _model.iconInfoRowModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: IconInfoRowWidget(
                                              text:
                                                  'Wykorzystano maksymalną liczbę prolongat: 3',
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (functions
                                            .getProlongateBookOptions(
                                                _model.order!) ==
                                        BookProlongateOptions
                                            .TooEarlyToProlong) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.baseButtonModel3,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BaseButtonWidget(
                                                    text:
                                                        'Prolongata niemożliwa',
                                                    disabled: true,
                                                    action: () async {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model: _model.iconInfoRowModel3,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: IconInfoRowWidget(
                                              text:
                                                  'Przedłużenie możliwe na 3 dni przed końcem terminu oddania.',
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (functions
                                            .getProlongateBookOptions(
                                                _model.order!) ==
                                        BookProlongateOptions
                                            .OrderInPendingStatus) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.baseButtonModel4,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BaseButtonWidget(
                                                    text: 'Anuluj zamówienie',
                                                    disabled: false,
                                                    action: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  BookCancelationOrderSheetWidget(
                                                                order: _model
                                                                    .order!,
                                                                book: widget
                                                                    .book!,
                                                                callback:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.order =
                                                                        null;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model: _model.iconInfoRowModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: IconInfoRowWidget(
                                              text:
                                                  'Zamówienie w statusie oczekującym. Możesz je jeszcze anulować',
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.baseButtonModel5,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: BaseButtonWidget(
                                                    text: 'Prolonguj',
                                                    disabled: false,
                                                    action: () async {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ],
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.baseButtonModel6,
                              updateCallback: () => setState(() {}),
                              child: BaseButtonWidget(
                                text: 'Wypożycz',
                                disabled: false,
                                action: () async {
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.isActive,
                                          false) ==
                                      true) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child:
                                                BookReservartionBottomSheetWidget(
                                              book: widget.book!,
                                              callback: (order) async {
                                                setState(() {
                                                  _model.order = order;
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Twoje konto jest nieaktywne. Prosimy o aktywację konta w placówce biblioteki',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
