import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NoiseTab extends StatefulWidget {
  const NoiseTab({super.key});

  @override
  State<NoiseTab> createState() => _NoiseTabState();
}

class _NoiseTabState extends State<NoiseTab> {
  final Map<String, bool> _activeNoises = {
    "Deep White Noise": true,
    "Gentle Rainstorm": false,
    "Campfire Crackle": false,
    "Delta Brainwave Pulse": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Night White Noise'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _activeNoises.keys.map((k) {
          final active = _activeNoises[k]!;
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: SwitchListTile(
              title: Text(k, style: const TextStyle(fontWeight: FontWeight.bold)),
              activeTrackColor: AppTheme.primary,
              value: active,
              onChanged: (v) => setState(() => _activeNoises[k] = v),
            ),
          );
        }).toList(),
      ),
    );
  }
}
