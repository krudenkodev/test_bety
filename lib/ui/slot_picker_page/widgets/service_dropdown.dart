import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/domain/service.dart';
import '../../../provides/booking_provider.dart';

class ServiceDropdown extends StatelessWidget {
  const ServiceDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    final services = provider.services;
    final selected = provider.selectedService;

    return DropdownButtonFormField<Service>(
      initialValue: selected,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: 'Послуга',
        border: OutlineInputBorder(),
      ),
      items: services
          .map(
            (s) => DropdownMenuItem<Service>(
              value: s,
              child: Text('${s.name} · ${s.durationMinutes} хв'),
            ),
          )
          .toList(),
      onChanged: (s) {
        if (s != null) {
          context.read<BookingProvider>().selectService(s);
        }
      },
    );
  }
}
