import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AlarmTab extends StatefulWidget {
  const AlarmTab({super.key});

  @override
  State<AlarmTab> createState() => _AlarmTabState();
}

class _AlarmTabState extends State<AlarmTab> {
  TimeOfDay _wakeTime = const TimeOfDay(hour: 7, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Wakeup Window'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(Icons.alarm_on_rounded, size: 64, color: AppTheme.primary),
                  const SizedBox(height: 12),
                  Text(_wakeTime.format(context), style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Optimal 90-min Sleep Cycle Alarm', style: TextStyle(color: AppTheme.textSecondary)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final picked = await showTimePicker(context: context, initialTime: _wakeTime);
                      if (picked != null) setState(() => _wakeTime = picked);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.black),
                    child: const Text('Adjust Target Time'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bedtime_outlined, color: AppTheme.secondary),
              title: const Text('Suggested Bedtime'),
              subtitle: const Text('11:30 PM (5 full cycles = 7.5 hours)'),
            ),
          ),
        ],
      ),
    );
  }
}
