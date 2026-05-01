import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/service_locator.dart';
import '../../provides/booking_provider.dart';
import 'widgets/confirm_bar.dart';
import 'widgets/date_picker_row.dart';
import 'widgets/error_view.dart';
import 'widgets/service_dropdown.dart';
import 'widgets/slots_grid.dart';

class SlotPickerPage extends StatelessWidget {
  const SlotPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookingProvider>(
      create: (_) => sl<BookingProvider>()..init(),
      child: Builder(builder: _buildScaffold),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Новий запис')),
      body: switch (provider.status) {
        LoadingStatus.idle || LoadingStatus.loading =>
          const Center(child: CircularProgressIndicator()),
        LoadingStatus.error => ErrorView(error: provider.error),
        LoadingStatus.success => _buildLoaded(context),
      },
      bottomNavigationBar:
          provider.status == LoadingStatus.success ? const ConfirmBar() : null,
    );
  }

  Widget _buildLoaded(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        );
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Послуга', style: titleStyle),
           SizedBox(height: 8),
          const ServiceDropdown(),
          const SizedBox(height: 24),
          Text('Дата', style: titleStyle),
          const SizedBox(height: 8),
          const DatePickerRow(),
          const SizedBox(height: 24),
          Text('Час', style: titleStyle),
          const SizedBox(height: 8),
          const SlotsGrid(),
        ],
      ),
    );
  }
}
