import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

BookProlongateOptions getProlongateBookOptions(OrdersRecord order) {
  if (order.status == OrderStatus.Pending)
    return BookProlongateOptions.OrderInPendingStatus;
  final prolongations = order.prolongations;
  if (prolongations > 2) return BookProlongateOptions.NoProlongationsLeft;
  final endDate = order.endDate!;
  final currentDate = new DateTime.now();
  if (currentDate.isAfter(endDate)) return BookProlongateOptions.TimedOut;
  if (endDate.difference(currentDate).inDays > 3)
    return BookProlongateOptions.TooEarlyToProlong;
  return BookProlongateOptions.Available;
}
