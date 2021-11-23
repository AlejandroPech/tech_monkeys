import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';

typedef CorrientesCallback = void Function(List<Corriente> val);

class Corrientes extends StatefulWidget {
  final CorrientesCallback corrientes;
  final String title;
  const Corrientes({Key? key,required this.corrientes,required this.title}) : super(key: key);

  @override
  _CorrientesState createState() => _CorrientesState();
}

class _CorrientesState extends State<Corrientes> {
  List<Corriente> newCorrientes=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(widget.title),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              columnFields("L1", 0),
              columnFields("L2", 1),
              columnFields("L3", 2)
            ],
          ),
        ],
      ),
    );
  }
  Column columnFields(String line,int index )=> Column(
    children: [
      Text(line),
      Row(children: [
        SizedBox(
          width: 50,
          height: 90,
          child: corrienteField("Volt", index)
      
        ),
        SizedBox(
          width: 50,
          height: 90,
          child: corrienteField("Amp",index),
        ),
        
      ],)
    ],
  );

  Container corrienteField(String hint,int index)=>Container(
      margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              hintText: hint,
            ),
            textAlign: TextAlign.center,
            onChanged: (value){
              if(hint=="Amp") {
                newCorrientes[index].amp=value;
              }else if(hint=="Volt"){
                newCorrientes[index].volt=value;
              }
              widget.corrientes(newCorrientes);
            },
          )
        ],
      ),
    );
}