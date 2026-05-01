import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provides/booking_provider.dart';
import 'slot_tile.dart';

class SlotsGrid extends StatelessWidget {
  const SlotsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    final slots = provider.slots;
    final selected = provider.selectedSlot;

    if (slots.isEmpty) {
      return _emptyState(
        context,
        'Слотів не знайдено. Спробуйте іншу дату або послугу.',
      );
    }

    final hasAvailable = slots.any((s) => s.isAvailable);
    if (!hasAvailable) {
      return _emptyState(
        context,
        'Усі слоти на цей день недоступні. Спробуйте іншу дату або послугу.',
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: slots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final slot = slots[index];
        return SlotTile(
          key: ValueKey('slot_${slot.start.toIso8601String()}'),
          slot: slot,
          isSelected: selected != null && selected.start == slot.start,
          onTap: () => context.read<BookingProvider>().selectSlot(slot),
        );
      },
    );
  }

  Widget _emptyState(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
