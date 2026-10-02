import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Analytics'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('88%', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 4),
                  const Text('Sleep Quality Score', style: TextStyle(fontSize: 16, color: AppTheme.textSecondary)),
                  const SizedBox(height: 12),
                  const LinearProgressIndicator(value: 0.88, backgroundColor: Colors.white12, color: AppTheme.primary),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Phase Distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _phaseRow('Deep Sleep', '1h 55m (25%)', Colors.indigoAccent),
                  _phaseRow('REM Sleep', '1h 45m (23%)', Colors.purpleAccent),
                  _phaseRow('Light Sleep', '3h 50m (52%)', Colors.cyanAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phaseRow(String name, String duration, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
          Text(duration, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
