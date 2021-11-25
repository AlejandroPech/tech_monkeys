import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';
import 'package:tech_monkeys/src/components/text_field_multiline.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';

typedef ServicioCallBack = void Function(ServicioCorrectivo val);
class BodyCorrectivo extends StatefulWidget {
 final ServicioCallBack servicioCallBack;
 final ServicioCorrectivo correctivo;
 const  BodyCorrectivo({Key? key,required this.servicioCallBack,required this.correctivo}) : super(key: key);

  @override
  _BodyCorrectivoState createState() => _BodyCorrectivoState();
}

class _BodyCorrectivoState extends State<BodyCorrectivo>with AutomaticKeepAliveClientMixin {

  late ServicioCorrectivo correctivo;

  @override
  void initState() {
    super.initState();
    correctivo =widget.correctivo;
  }

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
          (val)=>correctivo.cambioCondensador=val,
          correctivo.cambioCondensador,
        ),
        checkFunction(
          "Cambio y ajuste de componentes eléctrico",
          (val)=>correctivo.cambioAjusteCompElectrico=val,
          correctivo.cambioAjusteCompElectrico,
        ),
        checkFunction(
          "Cambio y ajuste de transmisión potencia",
          (val)=>correctivo.cambioAjusteTransPotencia=val,
          correctivo.cambioAjusteTransPotencia,
        ),
        checkFunction(
          "Cambio y ajuste de bandeja y tubo drenaje",
          (val)=>correctivo.cambioAjusteBandDrenaje=val,
          correctivo.cambioAjusteBandDrenaje,
        ),
        checkFunction(
          "Cambio de Rodamientos",
          (val)=>correctivo.cambioRodamientos=val,
          correctivo.cambioRodamientos,
        ),
        checkFunction(
          "Recupera refrigerante",
          (val)=>correctivo.recurepaRefrigerante=val,
          correctivo.recurepaRefrigerante,
        ),
        checkFunction(
          "Corrección de fuga",
          (val)=>correctivo.correccionFuga=val,
          correctivo.correccionFuga,
        ),
        checkFunction(
          "Presurizado con Nitrógeno y barrido",
          (val)=>correctivo.presurizadoNitrogeno=val,
          correctivo.presurizadoNitrogeno,
        ),
        checkFunction(
          "Vacío hasta 500 micrones",
          (val)=>correctivo.vacioMicrones=val,
          correctivo.vacioMicrones,
        ),
        checkFunction(
          "Carga de refrigerante",
          (val)=>correctivo.cargaRefrigerante=val,
          correctivo.cargaRefrigerante,
        ),
        checkFunction(
          "Cambio Evaporador",
          (val)=>correctivo.cambioEvaporador=val,
          correctivo.cambioEvaporador,
        ),
        checkFunction(
          "Cambio y ajuste de rejillas y difusores",
          (val)=>correctivo.cambioAjusteRejillas=val,
          correctivo.cambioAjusteRejillas,
        ),
        checkFunction(
          "Cambio de filtros aire evaporador",
          (val)=>correctivo.cambioFiltroAireEvaporador=val,
          correctivo.cambioFiltroAireEvaporador,
        ),
        checkFunction(
          "Ajuste de Carga Refrigerante",
          (val)=>correctivo.ajusteCargaRefrigerante=val,
          correctivo.ajusteCargaRefrigerante,
        ),
        checkFunction(
          "Cambio y balanceo de aspas",
          (val)=>correctivo.cambioBalanceoAspas=val,
          correctivo.cambioBalanceoAspas,
        ),
        checkFunction(
          "Cambio/arreglo de aspas condensador",
          (val)=>correctivo.cambioAspasCondensador=val,
          correctivo.cambioAspasCondensador,
        ),
        checkFunction(
          "Cambio/arreglo motor condensador",
          (val)=>correctivo.cambioMotorCondensador=val,
          correctivo.cambioMotorCondensador,
        ),
        checkFunction(
          "Cambio/arreglo motor evaporador",
          (val)=>correctivo.cambioMotorEvaporador=val,
          correctivo.cambioMotorEvaporador,
        ),
        checkFunction(
          "Cambio/arreglo compresor y filtro",
          (val)=>correctivo.cambioCompresorFiltro=val,
          correctivo.cambioCompresorFiltro,
        ),
        checkFunction(
          " Cambio componente eléctrico / ",
          (val)=>correctivo.cambioComponenteElectrico=val,
          correctivo.cambioComponenteElectrico,
        ),
        TextFieldMultiline(
          callbackString: (val){
            correctivo.otraActividad=val;
            widget.servicioCallBack(correctivo);
          },
          title: "Otra Actividad",
          initialValue: correctivo.otraActividad,
        ),
      ],
    );
  }

  Checkboxes checkFunction(String title,Function newValue,bool initialValue)=>Checkboxes(
    title: title, 
    checked: (bool val) {
      newValue(val);
      widget.servicioCallBack(correctivo);
    },
    initialValue: initialValue,
  );
}