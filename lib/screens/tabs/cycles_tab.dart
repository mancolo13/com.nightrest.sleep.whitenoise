import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CyclesTab extends StatefulWidget {
  const CyclesTab({super.key});

  @override
  State<CyclesTab> createState() => _CyclesTabState();
}

class _CyclesTabState extends State<CyclesTab> {
  TimeOfDay _wakeTime = const TimeOfDay(hour: 7, minute: 0);

  List<String> _calculateBedtimes() {
    final now = DateTime.now();
    final wake = DateTime(now.year, now.month, now.day, _wakeTime.hour, _wakeTime.minute);
    final times = <String>[];
    for (int cycles in [6, 5, 4, 3]) {
      final bed = wake.subtract(Duration(minutes: (cycles * 90) + 14));
      final h = bed.hour.toString().padLeft(2, '0');
      final m = bed.minute.toString().padLeft(2, '0');
      times.add('$h:$m ($cycles cycles / ${(cycles * 1.5).toStringAsFixed(1)}h)');
    }
    return times;
  }

  @override
  Widget build(BuildContext context) {
    final bedtimes = _calculateBedtimes();
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Cycle Calculator'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              title: const Text('I want to wake up at:'),
              subtitle: Text(_wakeTime.format(context), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primary)),
              trailing: IconButton(
                icon: const Icon(Icons.access_time_rounded),
                onPressed: () async {
                  final t = await showTimePicker(context: context, initialTime: _wakeTime);
                  if (t != null) setState(() => _wakeTime = t);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Recommended Bedtimes (to wake feeling refreshed):', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...bedtimes.map((bt) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.bedtime_outlined, color: AppTheme.secondary),
              title: Text(bt, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          )),
        ],
      ),
    );
  }
}
