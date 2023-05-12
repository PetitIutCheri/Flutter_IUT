import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Premier projet'),
        ),
        body: Center(
          child: Column(
            children: const [
              TheAmazingRow(),
              SizedBox(height: 16),
              TheAmazingRow(),
              SizedBox(height: 16),
              TheAmazingRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({Key? key, this.icon, this.label}) : super(key: key);
// la c'est entre le constructeur
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            const Icon(icon),
            SizedBox(width: 16),
            Expanded(
              child: const Text(label),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => print('Hallo Welt'),
            ),
          ],
        ));
  }
}
