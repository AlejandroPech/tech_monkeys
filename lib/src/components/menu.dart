import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.open_in_new),
          label: "Abrir",
        ),
        SpeedDialChild(
          child: const Icon(Icons.add),
          label: "Nuevo",
        ),
      ],
    );
  }
}
