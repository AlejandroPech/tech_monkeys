import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';
class BodyPreventivo extends StatelessWidget {
  const BodyPreventivo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: const <Widget>[
        Text(
          'MANTENIMIENTO PREVENTIVO',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Checkboxes(
          title: "Lavado Condensador P< a 600 psi",
        ),
        Checkboxes(
          title: "Limpieza y ajuste de componentes eléctricos",
        ),
        Checkboxes(
          title: "Inspección y juste de transmisión potencia",
        ),
        Checkboxes(
          title: "Limpieza y juste de bandeja y tubo drenaje",
        ),
        Checkboxes(
          title: "Verificar el setpoint",
        ),
        Checkboxes(
          title: "Revision de aislamiento en ductos",
        ),
        Checkboxes(
          title: "Revision componente electrico/electronico",
        ),
        Checkboxes(
          title: "Verifique/reapriete conexiones electricas",
        ),
        Checkboxes(
          title: "Verificar toda la estructura del equipo",
        ),
        Checkboxes(
          title: "Temp. Inyeccion",
        ),
        Checkboxes(
          title: "Temp. Retorno",
        ),
        Checkboxes(
          title: "Lavado Evaporador",
        ),
        Checkboxes(
          title: "Limpieza y ajuste de rejillas y difusores",
        ),
        Checkboxes(
          title: "Lavado/cambio filtros aire evaporador",
        ),
        Checkboxes(
          title: "Ajuste de Carga Refrigerante",
        ),
        Checkboxes(
          title: "Revision balanceo de aspas",
        ),
        Checkboxes(
          title: "Revision de motor evaporador",
        ),
        Checkboxes(
          title: "Revision de motor condensador",
        ),
        Checkboxes(
          title: "Balance de voltage <= 2%",
        ),
        Checkboxes(
          title: "Balance de turbina y chumacera",
        ),
        Checkboxes(
          title: "Peinar aletas de los serpentines",
        ),
      ],
    );
  }
}
