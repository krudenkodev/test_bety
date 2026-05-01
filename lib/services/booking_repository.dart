import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/domain/booking_data.dart';

abstract class BookingRepository {
  Future<BookingData> load();
}

class AssetBookingRepository implements BookingRepository {
  final String assetPath;

  const AssetBookingRepository({this.assetPath = 'assets/booking.json'});

  @override
  Future<BookingData> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return BookingData.fromJson(json);
  }
}
