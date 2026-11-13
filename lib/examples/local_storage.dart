
import 'package:flutter/material.dart';

class PreferencesExample extends StatelessWidget {
  final ValueNotifier<bool> darkMode;
  final ValueChanged<bool> onThemeChanged;

  const PreferencesExample({
    super.key,
    required this.darkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: darkMode,
        builder: (context, isDark, child) {
          return SwitchListTile(
            title: const Text('Modo escuro'),
            subtitle: const Text(
              'Salvar preferência no dispositivo',
            ),
            value: isDark,
            onChanged: onThemeChanged,
          );
        },
      ),
    );
  }
}
