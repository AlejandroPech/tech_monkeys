import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';

typedef CorrientesCallback = void Function(List<Corriente> val);
class Corrientes extends StatefulWidget {
  final CorrientesCallback corrientes;
  final String title;
  final List<Corriente> newCorrientes;
  const Corrientes({Key? key,required this.corrientes,required this.title,required this.newCorrientes}) : super(key: key);

  @override
  _CorrientesState createState() => _CorrientesState();
}

class _CorrientesState extends State<Corrientes> {
  late TextEditingController _controllervolt1;
  late TextEditingController _controlleramp1;
  late TextEditingController _controllervolt2;
  late TextEditingController _controlleramp2;
  late TextEditingController _controllervolt3;
  late TextEditingController _controlleramp3;
  @override
  void initState() {
    super.initState();
    _controllervolt1 = TextEditingController(text: widget.newCorrientes[0].volt);
    _controlleramp1 = TextEditingController(text: widget.newCorrientes[0].amp);
    _controllervolt2 = TextEditingController(text: widget.newCorrientes[1].volt);
    _controlleramp2 = TextEditingController(text: widget.newCorrientes[1].amp);
    _controllervolt3 = TextEditingController(text: widget.newCorrientes[2].volt);
    _controlleramp3 = TextEditingController(text: widget.newCorrientes[2].amp);
  }
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
              columnFields("L1", 0,_controllervolt1,_controlleramp1),
              columnFields("L2", 1,_controllervolt2,_controlleramp2),
              columnFields("L3", 2,_controllervolt3,_controlleramp3)
            ],
          ),
        ],
      ),
    );
  }
  Column columnFields(String line,int index,TextEditingController controllervolt,TextEditingController controlleramp)=> Column(
    children: [
      Text(line),
      Row(children: [
        SizedBox(
          width: 50,
          height: 90,
          child: corrienteField("Volt", index,controllervolt)
      
        ),
        SizedBox(
          width: 50,
          height: 90,
          child: corrienteField("Amp",index,controlleramp),
        ),
        
      ],)
    ],
  );

  Container corrienteField(String hint,int index,TextEditingController controller)=>Container(
      margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              hintText: hint,
            ),
            textAlign: TextAlign.center,
            onChanged: (value){
              if(hint=="Amp") {
                widget.newCorrientes[index].amp=value;
              }else if(hint=="Volt"){
                widget.newCorrientes[index].volt=value;
              }
              widget.corrientes(widget.newCorrientes);
            },
          )
        ],
      ),
    );
}