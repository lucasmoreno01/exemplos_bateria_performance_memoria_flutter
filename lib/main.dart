
import 'package:exemplo_flutter/examples/compute.dart';
import 'package:exemplo_flutter/examples/image_cahe_example.dart';
import 'package:exemplo_flutter/examples/list_view.dart';
import 'package:exemplo_flutter/examples/local_storage.dart';
import 'package:exemplo_flutter/examples/visibility.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedPreferencesAsync preferences = SharedPreferencesAsync();
  final ValueNotifier<bool> darkMode = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final value = await preferences.getBool('dark_mode') ?? false;
    darkMode.value = value;
  }

  Future<void> toggleTheme(bool value) async {
    darkMode.value = value;
    await preferences.setBool('dark_mode', value);
  }

  @override
  void dispose() {
    darkMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Performance',
          theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.blue,
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: HomeScreen(
            darkMode: darkMode,
            onThemeChanged: toggleTheme,
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ValueNotifier<bool> darkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.darkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final examples = [
      ('Cache de imagens', const ImageCacheExample()),
      ('ListView.builder', const ListBuilderExample()),
      ('Compute / Isolates', const ComputeExample()),
      (
        'Shared Preferences',
        PreferencesExample(
          darkMode: darkMode,
          onThemeChanged: onThemeChanged,
        ),
      ),
      ('Visibility Detector', const VisibilityExample()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Performance'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Exemplos de otimização',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...examples.map(
            (example) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => example.$2,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(example.$1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
