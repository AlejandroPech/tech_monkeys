import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';

class HeadDoc extends StatelessWidget {
  const HeadDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            'Reporte de Servicio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        textBox(
          "Cliente",
          const Icon(Icons.person),
          TextInputType.text,
        ),
        textBox(
          "Ubicación",
          const Icon(Icons.location_on),
          TextInputType.text,
        ),
        textBox(
          "Tipo de equipo",
          const Icon(Icons.personal_video),
          TextInputType.text,
        ),
        textBox(
          "Mantenimiento",
          const Icon(Icons.hardware),
          TextInputType.text,
        ),
        textBox("Fecha", const Icon(Icons.calendar_view_day),
            TextInputType.datetime),
        textBox(
          "Marca",
          const Icon(Icons.branding_watermark),
          TextInputType.text,
        ),
        textBox(
          "Modelo",
          const Icon(CupertinoIcons.pencil),
          TextInputType.text,
        ),
        textBox(
          "Número de serie",
          const Icon(CupertinoIcons.barcode),
          TextInputType.text,
        ),
      ],
    );
  }
}
