import 'package:get_it/get_it.dart';

import '../provides/booking_provider.dart';
import '../services/booking_repository.dart';
import '../services/slot_calculator.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<BookingRepository>(() => const AssetBookingRepository());
  sl.registerLazySingleton<SlotCalculator>(() => const SlotCalculator());
  sl.registerFactory<BookingProvider>(
    () => BookingProvider(
      repository: sl<BookingRepository>(),
      calculator: sl<SlotCalculator>(),
    ),
  );
}
