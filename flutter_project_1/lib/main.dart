import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final pokedex = <Pokemon>[
    // <== liste finale, contenu constant

    Pokemon(name: 'Artikodin', icon: Icons.ac_unit),
    Pokemon(name: 'Sulfura', icon: Icons.fireplace),
    Pokemon(name: 'Elektor', icon: Icons.thunderstorm),
    Pokemon(name: 'Mewtwo', icon: Icons.remove_red_eye),
  ];

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Ecrivez un nom',
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            pokedex.insert(
                                0,
                                Pokemon(
                                    icon: Icons.emoji_emotions,
                                    name: "Aboubacar"));
                            setState(() {});
                          }),
                    )
                  ],
                ),
                for (final Pokemon item in pokedex)
                  TheAmazingRow(
                      icon: item.icon, label: item.name.toUpperCase()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pokemon {
  final String name;
  final IconData icon;
  Pokemon({required this.icon, required this.name});
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({Key? key, required this.icon, required this.label})
      : super(key: key);
// la c'est entre le constructeur
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
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
              Icon(icon),
              const SizedBox(width: 16),
              Expanded(
                child: Text(label),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
