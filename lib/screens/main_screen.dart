import 'package:flutter/material.dart';
import 'tabs/cycles_tab.dart';
import 'tabs/noise_tab.dart';
import 'tabs/alarm_tab.dart';
import 'tabs/stats_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _idx = 0;
  final _tabs = const [CyclesTab(), NoiseTab(), AlarmTab(), StatsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _idx, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.bedtime_outlined), selectedIcon: Icon(Icons.bedtime), label: 'Cycles'),
          NavigationDestination(icon: Icon(Icons.surround_sound_outlined), selectedIcon: Icon(Icons.surround_sound), label: 'Sound'),
          NavigationDestination(icon: Icon(Icons.alarm_outlined), selectedIcon: Icon(Icons.alarm), label: 'Alarm'),
          NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'Insights'),
        ],
      ),
    );
  }
}
