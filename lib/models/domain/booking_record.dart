import 'dart:convert';

class BookingRecord {
  final String serviceId;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;

  const BookingRecord({
    required this.serviceId,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() => {
        'serviceId': serviceId,
        'date': _formatDate(date),
        'startTime': _formatTime(startTime),
        'endTime': _formatTime(endTime),
      };

  String toJsonString() => const JsonEncoder.withIndent('  ').convert(toJson());

  static String _formatDate(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  static String _formatTime(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
