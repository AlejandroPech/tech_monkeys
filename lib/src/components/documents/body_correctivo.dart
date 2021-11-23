import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';
import 'package:tech_monkeys/src/components/text_field_multiline.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';

typedef ServicioCallBack = void Function(ServicioCorrectivo val);
class BodyCorrectivo extends StatefulWidget {
 final ServicioCallBack servicioCallBack;
 const  BodyCorrectivo({Key? key,required this.servicioCallBack}) : super(key: key);

  @override
  _BodyCorrectivoState createState() => _BodyCorrectivoState();
}

class _BodyCorrectivoState extends State<BodyCorrectivo>with AutomaticKeepAliveClientMixin {

  ServicioCorrectivo correctivo = ServicioCorrectivo();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const Text(
          'MANTENIMIENTO CORRECTIVO',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        checkFunction(
          "Cambio Condensador",
          (val)=>correctivo.cambioCondensador=val
        ),
        checkFunction(
          "Cambio y ajuste de componentes eléctrico",
          (val)=>correctivo.cambioAjusteCompElectrico=val
        ),
        checkFunction(
          "Cambio y ajuste de transmisión potencia",
          (val)=>correctivo.cambioAjusteTransPotencia=val
        ),
        checkFunction(
          "Cambio y ajuste de bandeja y tubo drenaje",
          (val)=>correctivo.cambioAjusteBandDrenaje=val
        ),
        checkFunction(
          "Cambio de Rodamientos",
          (val)=>correctivo.cambioRodamientos=val
        ),
        checkFunction(
          "Recupera refrigerante",
          (val)=>correctivo.recurepaRefrigerante=val
        ),
        checkFunction(
          "Corrección de fuga",
          (val)=>correctivo.correccionFuga=val
        ),
        checkFunction(
          "Presurizado con Nitrógeno y barrido",
          (val)=>correctivo.presurizadoNitrogeno=val
        ),
        checkFunction(
          "Vacío hasta 500 micrones",
          (val)=>correctivo.vacioMicrones=val
        ),
        checkFunction(
          "Carga de refrigerante",
          (val)=>correctivo.cargaRefrigerante=val
        ),
        checkFunction(
          "Cambio Evaporador",
          (val)=>correctivo.cambioEvaporador=val
        ),
        checkFunction(
          "Cambio y ajuste de rejillas y difusores",
          (val)=>correctivo.cambioAjusteRejillas=val
        ),
        checkFunction(
          "Cambio de filtros aire evaporador",
          (val)=>correctivo.cambioFiltroAireEvaporador=val
        ),
        checkFunction(
          "Ajuste de Carga Refrigerante",
          (val)=>correctivo.ajusteCargaRefrigerante=val
        ),
        checkFunction(
          "Cambio y balanceo de aspas",
          (val)=>correctivo.cambioBalanceoAspas=val
        ),
        checkFunction(
          "Cambio/arreglo de aspas condensador",
          (val)=>correctivo.cambioAspasCondensador=val
        ),
        checkFunction(
          "Cambio/arreglo motor condensador",
          (val)=>correctivo.cambioMotorCondensador=val
        ),
        checkFunction(
          "Cambio/arreglo motor evaporador",
          (val)=>correctivo.cambioMotorEvaporador=val
        ),
        checkFunction(
          "Cambio/arreglo compresor y filtro",
          (val)=>correctivo.cambioCompresorFiltro=val
        ),
        checkFunction(
          " Cambio componente eléctrico / ",
          (val)=>correctivo.cambioComponenteElectrico=val
        ),
        TextFieldMultiline(
          callbackString: (val){
            correctivo.otraActividad=val;
            widget.servicioCallBack(correctivo);
          },
          title: "Otra Actividad"
        ),
      ],
    );
  }

  Checkboxes checkFunction(String title,Function newValue)=>Checkboxes(
    title: title, 
    checked: (bool val) {
      newValue(val);
      widget.servicioCallBack(correctivo);
    },
  );
}