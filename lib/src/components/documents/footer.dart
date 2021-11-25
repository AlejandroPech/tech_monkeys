import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/corrientes.dart';
import 'package:tech_monkeys/src/components/row_radio_buttons.dart';
import 'package:tech_monkeys/src/components/text_field_multiline.dart';
import 'package:tech_monkeys/src/components/text_fields_oneline.dart';
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';

typedef DatosFuncionesCallBack = void Function(DatosFuncionamiento val);
class FooterDoc extends StatefulWidget {
  final DatosFuncionesCallBack datosFuncionamiento;
  final DatosFuncionamiento funcionamiento;
  const FooterDoc({ Key? key,required this.datosFuncionamiento,required this.funcionamiento}) : super(key: key);

  @override
  State<FooterDoc> createState() => _FooterDocState();
}

class _FooterDocState extends State<FooterDoc> with AutomaticKeepAliveClientMixin{
  late DatosFuncionamiento funcionamiento;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    funcionamiento= widget.funcionamiento;
  }
  
  @override
  Widget build(BuildContext context) {
     super.build(context);
    return Column(
      children: <Widget>[
        Container(
          margin:const EdgeInsets.symmetric(vertical: 10),
          child:const Text("Datos de funcionamiento",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        rowRadioButtons("Compresor 1",funcionamiento.compresor1,(val)=>funcionamiento.compresor1=val),
        rowRadioButtons("Compresor 2",funcionamiento.compresor2,(val)=>funcionamiento.compresor2=val),
        rowRadioButtons("Vent.Cond 1",funcionamiento.ventCond1,(val)=>funcionamiento.ventCond1=val),
        rowRadioButtons("Vent.Cond 2",funcionamiento.ventCond2,(val)=>funcionamiento.ventCond2=val),
        rowRadioButtons("Blower",funcionamiento.blower,(val)=>funcionamiento.blower=val),
        rowRadioButtonsString("Estado de aspas 2","Bien","Ajuste","Cambio",funcionamiento.estadoAspas,(val)=>funcionamiento.estadoAspas=val),
        rowRadioButtonsString("Nivel de aceite","1/4","1/2","3/4",funcionamiento.nivelAceite,(val)=>funcionamiento.nivelAceite=val),
        textFieldNumber("Resistencia a carter (comp1)", funcionamiento.resistenciaCarter1,(val)=>funcionamiento.resistenciaCarter1=val,),
        textFieldNumber("Resistencia a carter (comp2)", funcionamiento.resistenciaCarter2,(val)=>funcionamiento.resistenciaCarter2=val,),
        textFieldNumber("Presión condensación (Psig)",funcionamiento.presionCondensacion,(val)=>funcionamiento.presionCondensacion=val,),
        textFieldNumber("Temperatura condensación (C/F)", funcionamiento.temperaturaCondensacion,(val)=>funcionamiento.temperaturaCondensacion=val,),
        textFieldNumber("Temperatura saturacion (C/F)" ,funcionamiento.temperaturaSaturacion,(val)=>funcionamiento.temperaturaSaturacion=val,),
        textFieldNumber("Subenfriamiento (K)",funcionamiento.subEnfriamiento,(val)=>funcionamiento.subEnfriamiento=val,),
        textFieldNumber("Preson de evaporacion (Psig)", funcionamiento.presionEvaporacion,(val)=>funcionamiento.presionEvaporacion=val,),
        textFieldNumber("Temperatura (C/F)",funcionamiento.temperatura,(val)=>funcionamiento.temperatura=val,),
        textFieldNumber("Temperatura saturacion (C/F)", funcionamiento.temperaturaSaturacion2,(val)=>funcionamiento.temperaturaSaturacion2=val,),
        textFieldNumber("Sobrecalentamiento (K)",funcionamiento.sobreCalentamiento,(val)=>funcionamiento.sobreCalentamiento=val,),
        TextFieldMultiline(
          title: "Observaciones",
          callbackString: (val){
            funcionamiento.observaciones=val;
            widget.datosFuncionamiento(funcionamiento);
          },
          initialValue: funcionamiento.observaciones,
        ),
       
      ],
    );
  }

  Corrientes rowRadioButtons(String title,List<Corriente> correientes,Function function) => 
    Corrientes(
      title: title,
      corrientes: (List<Corriente> val) {
        function(val);
        widget.datosFuncionamiento(funcionamiento);
      },
      newCorrientes: correientes,
    );
  RowRadioButtons rowRadioButtonsString(String title,String option1,String option2, String option3,String initialValue,Function function) => 
    RowRadioButtons(
      callbackString: (String val) {
        function(val);
        widget.datosFuncionamiento(funcionamiento);
      },
      title: title,
      option1: option1,
      option2: option2,
      option3: option3,
      initialValue: initialValue,
    );

  TextFieldNumber textFieldNumber(String title,String initialValue, Function function)=> 
    TextFieldNumber(
      title: title,
      callbackString: (String val){
        function(val);
        widget.datosFuncionamiento(funcionamiento);
      },
      initialValue: initialValue,
    );
}