import 'package:flutter/material.dart';
import 'package:flutter_project_1/page_name.dart';

import 'pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController controller;
  late final Function(String) onDelete;
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
    return Scaffold(
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
                      onPressed: addPokemon,
                    ),
                  )
                ],
              ),
              for (final Pokemon item in pokedex)
                TheAmazingRow(
                  icon: item.icon,
                  label: item.name.toUpperCase(),
                  onDelete: () => onDeletePokemon(item.name),
                )
            ],
          ),
        ),
      ),
    );
  }

  void onDeletePokemon(String label) {
    pokedex.removeWhere((e) => e.name.toLowerCase() == label.toLowerCase());
    setState(() {});
  }

  void addPokemon() {
    final nameToAdd = controller.text;
    controller.clear();

    pokedex.insert(0, Pokemon(icon: Icons.emoji_emotions, name: nameToAdd));
    setState(() {});
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.onDelete(),
  }) : super(key: key);

// la c'est entre le constructeur
  final IconData icon;
  final String label;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, PageName.detail);
        },
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
                    onPressed: () {
                      onDelete();
                    }),
              ],
            )),
      ),
    );
  }
}
