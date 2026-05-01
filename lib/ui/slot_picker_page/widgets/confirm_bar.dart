import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provides/booking_provider.dart';

class ConfirmBar extends StatelessWidget {
  const ConfirmBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 52,
          child: FilledButton(
            onPressed: provider.canConfirm ? () => _confirm(context) : null,
            child: const Text('Записатись'),
          ),
        ),
      ),
    );
  }

  void _confirm(BuildContext context) {
    final record = context.read<BookingProvider>().buildRecord();
    if (record == null) return;
    final json = record.toJsonString();
    debugPrint(json);
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(json),
        duration: const Duration(seconds: 6),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
