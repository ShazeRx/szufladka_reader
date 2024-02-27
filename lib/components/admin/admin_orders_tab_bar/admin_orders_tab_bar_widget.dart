import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/admin/admin_order_list_tile/admin_order_list_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_orders_tab_bar_model.dart';
export 'admin_orders_tab_bar_model.dart';

class AdminOrdersTabBarWidget extends StatefulWidget {
  const AdminOrdersTabBarWidget({
    super.key,
    this.parameter1,
  });

  final DocumentReference? parameter1;

  @override
  State<AdminOrdersTabBarWidget> createState() =>
      _AdminOrdersTabBarWidgetState();
}

class _AdminOrdersTabBarWidgetState extends State<AdminOrdersTabBarWidget>
    with TickerProviderStateMixin {
  late AdminOrdersTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminOrdersTabBarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x1B090F13),
              offset: Offset(0.0, -2.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onDoubleTap: () async {
              if (widget.parameter1 != null) {
                _model.userOrders = await queryOrdersRecordOnce(
                  queryBuilder: (ordersRecord) => ordersRecord.where(
                    'user',
                    isEqualTo: widget.parameter1,
                  ),
                );
              } else {
                _model.allOrders = await queryOrdersRecordOnce();
              }

              setState(() {});
            },
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: FlutterFlowTheme.of(context).primary,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    indicatorWeight: 2.0,
                    tabs: [
                      Tab(
                        text: 'Oczekujące',
                      ),
                      Tab(
                        text: 'Upływające',
                      ),
                      Tab(
                        text: 'Zarchiwizowane',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [() async {}, () async {}, () async {}][i]();
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Builder(
                          builder: (context) {
                            final pending = (widget.parameter1 != null
                                        ? _model.userOrders
                                            ?.where((e) =>
                                                e.status == OrderStatus.Pending)
                                            .toList()
                                        : _model.allOrders
                                            ?.where((e) =>
                                                e.status == OrderStatus.Pending)
                                            .toList())
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: pending.length,
                              itemBuilder: (context, pendingIndex) {
                                final pendingItem = pending[pendingIndex];
                                return wrapWithModel(
                                  model:
                                      _model.adminOrderListTileModels1.getModel(
                                    pendingIndex.toString(),
                                    pendingIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: AdminOrderListTileWidget(
                                    key: Key(
                                      'Keynqf_${pendingIndex.toString()}',
                                    ),
                                    order: pendingItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Builder(
                          builder: (context) {
                            final completed = (widget.parameter1 != null
                                        ? _model.userOrders
                                            ?.where((e) =>
                                                e.status ==
                                                OrderStatus.Completed)
                                            .toList()
                                        : _model.allOrders
                                            ?.where((e) =>
                                                e.status ==
                                                OrderStatus.Completed)
                                            .toList())
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: completed.length,
                              itemBuilder: (context, completedIndex) {
                                final completedItem = completed[completedIndex];
                                return wrapWithModel(
                                  model:
                                      _model.adminOrderListTileModels2.getModel(
                                    completedIndex.toString(),
                                    completedIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: AdminOrderListTileWidget(
                                    key: Key(
                                      'Keyuip_${completedIndex.toString()}',
                                    ),
                                    order: completedItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Builder(
                          builder: (context) {
                            final archived = (widget.parameter1 != null
                                        ? _model.userOrders
                                            ?.where((e) =>
                                                e.status ==
                                                OrderStatus.Archived)
                                            .toList()
                                        : _model.allOrders
                                            ?.where((e) =>
                                                e.status ==
                                                OrderStatus.Archived)
                                            .toList())
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: archived.length,
                              itemBuilder: (context, archivedIndex) {
                                final archivedItem = archived[archivedIndex];
                                return wrapWithModel(
                                  model:
                                      _model.adminOrderListTileModels3.getModel(
                                    archivedIndex.toString(),
                                    archivedIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: AdminOrderListTileWidget(
                                    key: Key(
                                      'Key5jr_${archivedIndex.toString()}',
                                    ),
                                    order: archivedItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
