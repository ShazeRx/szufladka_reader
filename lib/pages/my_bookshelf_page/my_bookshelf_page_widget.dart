import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/book_list_view/book_list_view_widget.dart';
import '/components/loaned_book_card/loaned_book_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_bookshelf_page_model.dart';
export 'my_bookshelf_page_model.dart';

class MyBookshelfPageWidget extends StatefulWidget {
  const MyBookshelfPageWidget({super.key});

  @override
  State<MyBookshelfPageWidget> createState() => _MyBookshelfPageWidgetState();
}

class _MyBookshelfPageWidgetState extends State<MyBookshelfPageWidget> {
  late MyBookshelfPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyBookshelfPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.actionLoanedBooks = await actions.fetchOrderedBooksInStatuses(
        OrderStatus.values
            .where((e) =>
                (e == OrderStatus.Completed) || (e == OrderStatus.Archived))
            .toList()
            .toList(),
      );
      setState(() {
        _model.userOrders =
            _model.actionLoanedBooks!.toList().cast<OrderedBookStruct>();
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
          title: Text(
            'Moja szufladka',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Obecne wypożyczenia',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final loanedBooks = _model.userOrders.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: loanedBooks.length,
                          itemBuilder: (context, loanedBooksIndex) {
                            final loanedBooksItem =
                                loanedBooks[loanedBooksIndex];
                            return Container(
                              width: 353.0,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<BooksRecord>(
                                future: BooksRecord.getDocumentOnce(
                                    loanedBooksItem.book!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final loanedBookCardBooksRecord =
                                      snapshot.data!;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'BookDetailsPage',
                                        queryParameters: {
                                          'book': serializeParam(
                                            loanedBookCardBooksRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'book': loanedBookCardBooksRecord,
                                        },
                                      );
                                    },
                                    child: wrapWithModel(
                                      model:
                                          _model.loanedBookCardModels.getModel(
                                        loanedBooksIndex.toString(),
                                        loanedBooksIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: LoanedBookCardWidget(
                                        key: Key(
                                          'Key5s6_${loanedBooksIndex.toString()}',
                                        ),
                                        title: loanedBookCardBooksRecord.title,
                                        author:
                                            loanedBookCardBooksRecord.author,
                                        image: loanedBookCardBooksRecord.photo,
                                        canBeRenewed:
                                            loanedBooksItem.canBeProlonged,
                                        endDate: loanedBooksItem.endDate!,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Poprzednie wypożyczenia',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final pastLoans = _model.userOrders
                                .where((e) => e.status == OrderStatus.Archived)
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: pastLoans.length,
                              itemBuilder: (context, pastLoansIndex) {
                                final pastLoansItem = pastLoans[pastLoansIndex];
                                return Container(
                                  height: 200.0,
                                  child: StreamBuilder<BooksRecord>(
                                    stream: BooksRecord.getDocument(
                                        pastLoansItem.book!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final bookListViewBooksRecord =
                                          snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'BookDetailsPage',
                                            queryParameters: {
                                              'book': serializeParam(
                                                bookListViewBooksRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'book': bookListViewBooksRecord,
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.bookListViewModels
                                              .getModel(
                                            pastLoansIndex.toString(),
                                            pastLoansIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          child: BookListViewWidget(
                                            key: Key(
                                              'Keynng_${pastLoansIndex.toString()}',
                                            ),
                                            book: bookListViewBooksRecord,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
