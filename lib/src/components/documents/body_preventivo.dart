import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';
import 'package:tech_monkeys/src/components/text_field_multiline.dart';
import 'package:tech_monkeys/src/models/servicio_preventivo.dart';

typedef ServicioCallBack = void Function(ServicioPreventivo val);
class BodyPreventivo extends StatefulWidget {
  final ServicioCallBack servicioCallBack;
  const BodyPreventivo({Key? key,required this.servicioCallBack}) : super(key: key);

  @override
  State<BodyPreventivo> createState() => _BodyPreventivoState();
}

class _BodyPreventivoState extends State<BodyPreventivo>with AutomaticKeepAliveClientMixin{
  
  ServicioPreventivo preventivo = ServicioPreventivo();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children:  <Widget>[
        const Text(
          'MANTENIMIENTO PREVENTIVO',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Checkboxes(
          title: "Lavado Condensador P< a 600 psi",
          checked: (val){preventivo.lavadoCondensador=val;widget.servicioCallBack(preventivo);}
        ),
        Checkboxes(
          title: "Limpieza y ajuste de componentes eléctricos",
          checked: (val){preventivo.limpAjusteCompElectrico=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Inspección y juste de transmisión potencia",
          checked: (val){preventivo.insAjustePotencia=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Limpieza y juste de bandeja y tubo drenaje",
          checked: (val){
            preventivo.limpBandejaDrenaje=val;
            widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Verificar el setpoint",
          checked: (val){preventivo.verificarSetPoint=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Revision de aislamiento en ductos",
          checked: (val){preventivo.revAislamientoDuctos=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Revision componente electrico/electronico",
          checked: (val){preventivo.revCompElectrico=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Verifique/reapriete conexiones electricas",
          checked: (val){preventivo.verificarConexElectrico=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Verificar toda la estructura del equipo",
          checked: (val){preventivo.verifEstructuraEquipo=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Lavado Evaporador",
          checked: (val){preventivo.lavadoEvaporador=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Limpieza y ajuste de rejillas y difusores",
          checked: (val){preventivo.limpRejillaDifusores=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Lavado/cambio filtros aire evaporador",
          checked: (val){preventivo.lavadoFiltroAireEvaporadr=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Ajuste de Carga Refrigerante",
          checked: (val){preventivo.ajusteCargaRefrig=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Revision balanceo de aspas",
          checked: (val){preventivo.revBalAspas=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Revision de motor evaporador",
          checked: (val){preventivo.revMotorEvaporador=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Revision de motor condensador",
          checked: (val){preventivo.revMotorCondensador=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Balance de voltage <= 2%",
          checked: (val){preventivo.balanceVoltaje=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Balance de turbina y chumacera",
          checked: (val){preventivo.balanceTurbinaChamaquera=val;widget.servicioCallBack(preventivo);},
        ),
        Checkboxes(
          title: "Peinar aletas de los serpentines",
          checked: (val){preventivo.peinarAletasSerpentines=val;widget.servicioCallBack(preventivo);},
        ),
        TextFieldMultiline(callbackString: (val){
          preventivo.otraActividad=val;
          widget.servicioCallBack(preventivo);
          },
          title: "Otra Actividad"
        ),
      ],
    );
  }
  
}
