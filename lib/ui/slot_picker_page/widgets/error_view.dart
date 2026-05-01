import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provides/booking_provider.dart';

class ErrorView extends StatelessWidget {
  final Object? error;

  const ErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(
              'Не вдалося завантажити дані',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '$error',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.read<BookingProvider>().init(),
              child: const Text('Спробувати ще'),
            ),
          ],
        ),
      ),
    );
  }
}
