import 'package:flutter/foundation.dart';

import '../models/domain/booking_data.dart';
import '../models/domain/booking_record.dart';
import '../models/domain/service.dart';
import '../models/domain/slot.dart';
import '../services/booking_repository.dart';
import '../services/slot_calculator.dart';

enum LoadingStatus { idle, loading, success, error }

class BookingProvider extends ChangeNotifier {
  final BookingRepository _repository;
  final SlotCalculator _calculator;
  final DateTime Function() _clock;

  BookingProvider({
    required BookingRepository repository,
    SlotCalculator calculator = const SlotCalculator(),
    DateTime Function()? clock,
  })  : _repository = repository,
        _calculator = calculator,
        _clock = clock ?? DateTime.now;

  static const int daysAhead = 7;

  LoadingStatus _status = LoadingStatus.idle;
  Object? _error;
  BookingData? _data;
  Service? _selectedService;
  DateTime? _selectedDate;
  Slot? _selectedSlot;
  List<Slot> _slots = const [];

  LoadingStatus get status => _status;
  Object? get error => _error;
  BookingData? get data => _data;
  List<Service> get services => _data?.services ?? const [];
  Service? get selectedService => _selectedService;
  DateTime? get selectedDate => _selectedDate;
  Slot? get selectedSlot => _selectedSlot;
  List<Slot> get slots => _slots;

  List<DateTime> get availableDates {
    final today = _today();
    return List.generate(daysAhead, (i) => today.add(Duration(days: i)));
  }

  bool get canConfirm =>
      _selectedService != null && _selectedDate != null && _selectedSlot != null;

  Future<void> init() async {
    _status = LoadingStatus.loading;
    _error = null;
    notifyListeners();

    try {
      final data = await _repository.load();
      _data = data;
      _selectedService = data.services.isNotEmpty ? data.services.first : null;
      _selectedDate = _today();
      _selectedSlot = null;
      _recalculateSlots();
      _status = LoadingStatus.success;
    } catch (e) {
      _error = e;
      _status = LoadingStatus.error;
    }
    notifyListeners();
  }

  void selectService(Service service) {
    if (_selectedService == service) return;
    _selectedService = service;
    _selectedSlot = null;
    _recalculateSlots();
    notifyListeners();
  }

  void selectDate(DateTime date) {
    final normalized = DateTime(date.year, date.month, date.day);
    if (_selectedDate == normalized) return;
    _selectedDate = normalized;
    _selectedSlot = null;
    _recalculateSlots();
    notifyListeners();
  }

  void selectSlot(Slot slot) {
    if (!slot.isAvailable) return;
    _selectedSlot = slot;
    notifyListeners();
  }

  BookingRecord? buildRecord() {
    final service = _selectedService;
    final date = _selectedDate;
    final slot = _selectedSlot;
    if (service == null || date == null || slot == null) return null;
    return BookingRecord(
      serviceId: service.id,
      date: date,
      startTime: slot.start,
      endTime: slot.end,
    );
  }

  void _recalculateSlots() {
    final data = _data;
    final service = _selectedService;
    final date = _selectedDate;
    if (data == null || service == null || date == null) {
      _slots = const [];
      return;
    }
    _slots = _calculator.calculate(
      service: service,
      date: date,
      data: data,
      now: _clock(),
    );
  }

  DateTime _today() {
    final now = _clock();
    return DateTime(now.year, now.month, now.day);
  }
}
