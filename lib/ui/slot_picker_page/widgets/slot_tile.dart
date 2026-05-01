import 'package:flutter/material.dart';

import '../../../models/domain/slot.dart';

class SlotTile extends StatelessWidget {
  final Slot slot;
  final bool isSelected;
  final VoidCallback? onTap;

  const SlotTile({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !slot.isAvailable;

    final Color bg;
    final Color fg;
    if (isDisabled) {
      bg = theme.colorScheme.surfaceContainerHighest;
      fg = theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6);
    } else if (isSelected) {
      bg = theme.colorScheme.primary;
      fg = theme.colorScheme.onPrimary;
    } else {
      bg = theme.colorScheme.surface;
      fg = theme.colorScheme.onSurface;
    }

    return Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatTime(slot.start),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isDisabled
                    ? (slot.reason?.message ?? '')
                    : 'до ${_formatTime(slot.end)}',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(color: fg),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatTime(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
