import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provides/booking_provider.dart';

class DatePickerRow extends StatelessWidget {
  const DatePickerRow({super.key});

  static const List<String> _weekdayLabels = [
    'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Нд',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    final dates = provider.availableDates;
    final selected = provider.selectedDate;

    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = selected != null &&
              selected.year == date.year &&
              selected.month == date.month &&
              selected.day == date.day;
          return _buildChip(
            context,
            date: date,
            isSelected: isSelected,
            label: _weekdayLabels[date.weekday - 1],
            onTap: () => context.read<BookingProvider>().selectDate(date),
          );
        },
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required DateTime date,
    required bool isSelected,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final bg = isSelected ? theme.colorScheme.primary : theme.colorScheme.surface;
    final fg = isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface;

    return Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 64,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${date.day}',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(color: fg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
