import 'dart:convert';

const String tableFuncionamiento='funcionamiento';

class FuncionamientoFields{
  static const List<String> values=[
    id,compresor1,compresor2,ventCond1,ventCond2,blower,estadoAspas,nivelAceite,resistenciaCarter1,resistenciaCarter2,presionCondensacion,temperaturaCondensacion,temperaturaSaturacion,subEnfriamiento,presionEvaporacion,temperatura,temperaturaSaturacion2,sobreCalentamiento,observaciones,reporteId,
  ];
  static const id='_id';
  static const compresor1='compresor1';
  static const compresor2='compresor2';
  static const ventCond1='ventCond1';
  static const ventCond2='ventCond2';
  static const blower='blower';
  static const estadoAspas= 'estadoAspas';
  static const nivelAceite= 'nivelAceite';
  static const resistenciaCarter1= 'resistenciaCarter1';
  static const resistenciaCarter2= 'resistenciaCarter2';
  static const presionCondensacion= 'presionCondensacion';
  static const temperaturaCondensacion= 'temperaturaCondensacion';
  static const temperaturaSaturacion= 'temperaturaSaturacion';
  static const subEnfriamiento= 'subEnfriamiento';
  static const presionEvaporacion= 'presionEvaporacion';
  static const temperatura= 'temperatura';
  static const temperaturaSaturacion2= 'temperaturaSaturacion2';
  static const sobreCalentamiento= 'sobreCalentamiento';
  static const observaciones= 'observaciones';
  static const reporteId='reporteId';
}

class DatosFuncionamiento{
  int? id;
  List<Corriente> compresor1=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  List<Corriente> compresor2=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  List<Corriente> ventCond1=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  List<Corriente> ventCond2=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  List<Corriente> blower=[
    Corriente(),
    Corriente(),
    Corriente(),
  ];
  String estadoAspas="";
  String nivelAceite="";
  String resistenciaCarter1="";
  String resistenciaCarter2="";
  String presionCondensacion="";
  String temperaturaCondensacion="";
  String temperaturaSaturacion="";
  String subEnfriamiento="";
  String presionEvaporacion="";
  String temperatura="";
  String temperaturaSaturacion2="";
  String sobreCalentamiento="";
  String observaciones="";
  int? reporteId;

  static DatosFuncionamiento fromJson(Map<String,Object?> json){
    DatosFuncionamiento funcionamiento = DatosFuncionamiento();
    funcionamiento.id=json[FuncionamientoFields.id] as int?;
    funcionamiento.compresor1=stringToList(json[FuncionamientoFields.compresor1] as String);
    funcionamiento.compresor2=stringToList(json[FuncionamientoFields.compresor2] as String);
    funcionamiento.ventCond1=stringToList(json[FuncionamientoFields.ventCond1] as String);
    funcionamiento.ventCond2=stringToList(json[FuncionamientoFields.ventCond2] as String);
    funcionamiento.blower=stringToList(json[FuncionamientoFields.blower] as String);
    funcionamiento.estadoAspas=json[FuncionamientoFields.estadoAspas] as String;
    funcionamiento.nivelAceite=json[FuncionamientoFields.nivelAceite] as String;
    funcionamiento.resistenciaCarter1=json[FuncionamientoFields.resistenciaCarter1] as String;
    funcionamiento.resistenciaCarter2=json[FuncionamientoFields.resistenciaCarter2] as String;
    funcionamiento.presionCondensacion=json[FuncionamientoFields.presionCondensacion] as String;
    funcionamiento.temperaturaCondensacion=json[FuncionamientoFields.temperaturaCondensacion] as String;
    funcionamiento.temperaturaSaturacion=json[FuncionamientoFields.temperaturaSaturacion] as String;
    funcionamiento.subEnfriamiento=json[FuncionamientoFields.subEnfriamiento] as String;
    funcionamiento.presionEvaporacion=json[FuncionamientoFields.presionEvaporacion] as String;
    funcionamiento.temperatura=json[FuncionamientoFields.temperatura] as String;
    funcionamiento.temperaturaSaturacion2=json[FuncionamientoFields.temperaturaSaturacion2] as String;
    funcionamiento.sobreCalentamiento=json[FuncionamientoFields.sobreCalentamiento] as String;
    funcionamiento.observaciones=json[FuncionamientoFields.observaciones] as String;
    funcionamiento.reporteId=json[FuncionamientoFields.reporteId] as int;
    return funcionamiento;
  }

  static Map<String,Object?> toJson(DatosFuncionamiento funcionamiento)=>{
    FuncionamientoFields.id:funcionamiento.id,
    FuncionamientoFields.compresor1:listToString(funcionamiento.compresor1),
    FuncionamientoFields.compresor2:listToString(funcionamiento.compresor2),
    FuncionamientoFields.ventCond1:listToString(funcionamiento.ventCond1),
    FuncionamientoFields.ventCond2:listToString(funcionamiento.ventCond2),
    FuncionamientoFields.blower:listToString(funcionamiento.blower),
    FuncionamientoFields.estadoAspas:funcionamiento.estadoAspas,
    FuncionamientoFields.nivelAceite:funcionamiento.nivelAceite,
    FuncionamientoFields.resistenciaCarter1:funcionamiento.resistenciaCarter1,
    FuncionamientoFields.resistenciaCarter2:funcionamiento.resistenciaCarter2,
    FuncionamientoFields.presionCondensacion:funcionamiento.presionCondensacion,
    FuncionamientoFields.temperaturaCondensacion:funcionamiento.temperaturaCondensacion,
    FuncionamientoFields.temperaturaSaturacion:funcionamiento.temperaturaSaturacion,
    FuncionamientoFields.subEnfriamiento:funcionamiento.subEnfriamiento,
    FuncionamientoFields.presionEvaporacion:funcionamiento.presionEvaporacion,
    FuncionamientoFields.temperatura:funcionamiento.temperatura,
    FuncionamientoFields.temperaturaSaturacion2:funcionamiento.temperaturaSaturacion2,
    FuncionamientoFields.sobreCalentamiento:funcionamiento.sobreCalentamiento,
    FuncionamientoFields.observaciones:funcionamiento.observaciones,
    FuncionamientoFields.reporteId:funcionamiento.reporteId,
  };
  static List<Corriente> stringToList(String value){
    List<Corriente> corrientes= List<Corriente>.from(jsonDecode(value).map((val)=>Corriente.fromJson(val)));
    return corrientes;
  }

  static String listToString(List<Corriente> corrientes){
    String value="";
    value="[" +corrientes.map((val) => Corriente.toStringCorriente(val)).join(",")+ "]";
    return value;
  }
}

class Corriente{
  String volt="";
  String amp="";
  static Corriente fromJson(Map<String,Object?> json){
    Corriente corriente = Corriente();
    corriente.amp=json["amp"] as String;
    corriente.volt=json["volt"] as String;
    return corriente;
  }
  static String toStringCorriente(Corriente corriente){
    String value='{"amp":"${corriente.amp}","volt":"${corriente.volt}"}';
    return value;
  }
}