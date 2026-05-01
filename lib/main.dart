import 'package:flutter/material.dart';

import 'di/service_locator.dart';
import 'ui/slot_picker_page/slot_picker_page.dart';

void main() {
  setupServiceLocator();
  runApp(const BetyApp());
}

class BetyApp extends StatelessWidget {
  const BetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bety — записи',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC2185B)),
        useMaterial3: true,
      ),
      home: const SlotPickerPage(),
    );
  }
}
