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
  const FooterDoc({ Key? key,required this.datosFuncionamiento }) : super(key: key);

  @override
  State<FooterDoc> createState() => _FooterDocState();
}

class _FooterDocState extends State<FooterDoc> with AutomaticKeepAliveClientMixin{
  DatosFuncionamiento funcionamiento = DatosFuncionamiento();
  List<Corriente> corrientes=[];
  String prueba="";
  List<Corriente> corrientes2=[];
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    prueba=corrientes.toString();
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
        // Text(prueba),
        
        // ElevatedButton(
        //   child: const Text("Generar PDF2"),
        //   onPressed: (){
        //     corrientes=funcionamiento.compresor1;
        //     // String cosa= corrientes.map((e) => e.amp+",amp").toList().toString();
        //     List<String> list = ['one', 'two', 'three'];
        //     String string = list.map((value) => value).toString();
        //     prueba="[" +corrientes.map((val) => Corriente.toStringCorriente(val)).join(",")+ "]";
        //     // var a = '["one", "two", "three", "four"]';
        //     setState(() {
        //       // var ab = json.decode(a);
        //       // corrientes2=jsonDecode(prueba);
        //       corrientes2 =List<Corriente>.from(jsonDecode(prueba).map((json)=>cosa(json)));
        //       prueba=corrientes2[0].amp;
        //       // prueba=ab[0];
        //     });
        //   },
        // ),
        rowRadioButtons("Compresor 2",funcionamiento.compresor2,(val)=>funcionamiento.compresor2=val),
        rowRadioButtons("Vent.Cond 1",funcionamiento.ventCond1,(val)=>funcionamiento.ventCond1=val),
        rowRadioButtons("Vent.Cond 2",funcionamiento.ventCond2,(val)=>funcionamiento.ventCond2=val),
        rowRadioButtons("Blower",funcionamiento.blower,(val)=>funcionamiento.blower=val),
        rowRadioButtonsString("Estado de aspas 2","Bien","Ajuste","Cambio",(val)=>funcionamiento.estadoAspas=val),
        rowRadioButtonsString("Nivel de aceite","1/4","1/2","3/4",(val)=>funcionamiento.nivelAceite=val),
        textFieldNumber("Resistencia a carter (comp1)", (val)=>funcionamiento.resistenciaCarter1=val,),
        textFieldNumber("Resistencia a carter (comp2)", (val)=>funcionamiento.resistenciaCarter2=val,),
        textFieldNumber("Presión condensación (Psig)",(val)=>funcionamiento.presionCondensacion=val),
        textFieldNumber("Temperatura condensación (C/F)", (val)=>funcionamiento.temperaturaCondensacion=val),
        textFieldNumber("Temperatura saturacion (C/F)" ,(val)=>funcionamiento.temperaturaSaturacion=val),
        textFieldNumber("Subenfriamiento (K)",(val)=>funcionamiento.subEnfriamiento=val),
        textFieldNumber("Preson de evaporacion (Psig)", (val)=>funcionamiento.presionEvaporacion=val),
        textFieldNumber("Temperatura (C/F)",(val)=>funcionamiento.temperatura=val),
        textFieldNumber("Temperatura saturacion (C/F)", (val)=>funcionamiento.temperaturaSaturacion2=val),
        textFieldNumber("Sobrecalentamiento (K)",(val)=>funcionamiento.sobreCalentamiento=val),
        TextFieldMultiline(
          title: "Observaciones",
          callbackString: (val){
            funcionamiento.observaciones=val;
            widget.datosFuncionamiento(funcionamiento);
          }
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
    );
  
  Corriente cosa(Map<String,dynamic> json){
    Corriente cosa = Corriente();
    cosa.amp=json["amp"];
    cosa.volt=json["volt"];
    return cosa;
  }

  RowRadioButtons rowRadioButtonsString(String title,String option1,String option2, String option3,Function function) => 
    RowRadioButtons(
      callbackString: (String val) {
        function(val);
        widget.datosFuncionamiento(funcionamiento);
      },
      title: title,
      option1: option1,
      option2: option2,
      option3: option3, 
    );

  TextFieldNumber textFieldNumber(String title, Function function)=> 
    TextFieldNumber(
      title: title,
      callbackString: (String val){
        function(val);
        widget.datosFuncionamiento(funcionamiento);
      },
    );

  String listToString(List<Corriente> corrientes){
    String value="";
    value="[" +corrientes.map((val) => Corriente.toStringCorriente(val)).toString()+ "]";
    return value;
  }
  String toStringCorriente(Corriente corriente){
    String value='{"amp":"${corriente.amp}","volt":"${corriente.volt}"}';
    return value;
  }
}