const String tablePreventivo='servicioPreventivo';

class PreventivoFields {
  static const List<String> values=[
    id,lavadoCondensador,limpAjusteCompElectrico,insAjustePotencia,limpBandejaDrenaje,verificarSetPoint,revAislamientoDuctos,revCompElectrico,verificarConexElectrico,verifEstructuraEquipo,lavadoEvaporador,limpRejillaDifusores,lavadoFiltroAireEvaporadr,ajusteCargaRefrig,revBalAspas,revMotorEvaporador,revMotorCondensador,balanceVoltaje,balanceTurbinaChamaquera,peinarAletasSerpentines,otraActividad,reporteId,
  ];
  static const id="id";
  static const lavadoCondensador="lavadoCondensador";
  static const limpAjusteCompElectrico="limpAjusteCompElectrico";
  static const insAjustePotencia="insAjustePotencia";
  static const limpBandejaDrenaje="limpBandejaDrenaje";
  static const verificarSetPoint="verificarSetPoint";
  static const revAislamientoDuctos="revAislamientoDuctos";
  static const revCompElectrico="revCompElectrico";
  static const verificarConexElectrico="verificarConexElectrico";
  static const verifEstructuraEquipo="verifEstructuraEquipo";
  static const lavadoEvaporador="lavadoEvaporador";
  static const limpRejillaDifusores="limpRejillaDifusores";
  static const lavadoFiltroAireEvaporadr="lavadoFiltroAireEvaporadr";
  static const ajusteCargaRefrig="ajusteCargaRefrig";
  static const revBalAspas="revBalAspas";
  static const revMotorEvaporador="revMotorEvaporador";
  static const revMotorCondensador="revMotorCondensador";
  static const balanceVoltaje="balanceVoltaje";
  static const balanceTurbinaChamaquera="balanceTurbinaChamaquera";
  static const peinarAletasSerpentines="peinarAletasSerpentines";
  static const otraActividad="otraActividad";
  static const reporteId="reporteId";
}
class ServicioPreventivo{
  int? id;
  bool lavadoCondensador=false;
  bool limpAjusteCompElectrico=false;
  bool insAjustePotencia=false;
  bool limpBandejaDrenaje=false;
  bool verificarSetPoint=false;
  bool revAislamientoDuctos=false;
  bool revCompElectrico=false;
  bool verificarConexElectrico=false;
  bool verifEstructuraEquipo=false;
  bool lavadoEvaporador=false;
  bool limpRejillaDifusores=false;
  bool lavadoFiltroAireEvaporadr=false;
  bool ajusteCargaRefrig=false;
  bool revBalAspas=false;
  bool revMotorEvaporador=false;
  bool revMotorCondensador=false;
  bool balanceVoltaje=false;
  bool balanceTurbinaChamaquera=false;
  bool peinarAletasSerpentines=false;
  String otraActividad="";
  int? reporteId;

  static ServicioPreventivo fromJson(Map<String, Object?> json){
    ServicioPreventivo preventivo = ServicioPreventivo();
    preventivo.id=json[PreventivoFields.id] as int?;
    preventivo.lavadoCondensador=(json[PreventivoFields.lavadoCondensador]==1)?true:false;
    preventivo.limpAjusteCompElectrico=(json[PreventivoFields.limpAjusteCompElectrico]==1)?true:false;
    preventivo.insAjustePotencia=(json[PreventivoFields.insAjustePotencia]==1)?true:false;
    preventivo.limpBandejaDrenaje=(json[PreventivoFields.limpBandejaDrenaje]==1)?true:false;
    preventivo.verificarSetPoint=(json[PreventivoFields.verificarSetPoint]==1)?true:false;
    preventivo.revAislamientoDuctos=(json[PreventivoFields.revAislamientoDuctos]==1)?true:false;
    preventivo.revCompElectrico=(json[PreventivoFields.revCompElectrico]==1)?true:false;
    preventivo.verificarConexElectrico=(json[PreventivoFields.verificarConexElectrico]==1)?true:false;
    preventivo.verifEstructuraEquipo=(json[PreventivoFields.verifEstructuraEquipo]==1)?true:false;
    preventivo.lavadoEvaporador=(json[PreventivoFields.lavadoEvaporador]==1)?true:false;
    preventivo.limpRejillaDifusores=(json[PreventivoFields.limpRejillaDifusores]==1)?true:false;
    preventivo.lavadoFiltroAireEvaporadr=(json[PreventivoFields.lavadoFiltroAireEvaporadr]==1)?true:false;
    preventivo.ajusteCargaRefrig=(json[PreventivoFields.ajusteCargaRefrig]==1)?true:false;
    preventivo.revBalAspas=(json[PreventivoFields.revBalAspas]==1)?true:false;
    preventivo.revMotorEvaporador=(json[PreventivoFields.revMotorEvaporador]==1)?true:false;
    preventivo.revMotorCondensador=(json[PreventivoFields.revMotorCondensador]==1)?true:false;
    preventivo.balanceVoltaje=(json[PreventivoFields.balanceVoltaje]==1)?true:false;
    preventivo.balanceTurbinaChamaquera=(json[PreventivoFields.balanceTurbinaChamaquera]==1)?true:false;
    preventivo.peinarAletasSerpentines=(json[PreventivoFields.peinarAletasSerpentines]==1)?true:false;
    preventivo.otraActividad=json[PreventivoFields.otraActividad] as String;
    preventivo.reporteId=json[PreventivoFields.reporteId] as int?;

    return preventivo;
  }

  static Map<String,Object?>toJson(ServicioPreventivo preventivo)=>{
    PreventivoFields.id:preventivo.id,
    PreventivoFields.lavadoCondensador:(preventivo.lavadoCondensador)?1:0,
    PreventivoFields.limpAjusteCompElectrico:(preventivo.limpAjusteCompElectrico)?1:0,
    PreventivoFields.insAjustePotencia:(preventivo.insAjustePotencia)?1:0,
    PreventivoFields.limpBandejaDrenaje:(preventivo.limpBandejaDrenaje)?1:0,
    PreventivoFields.verificarSetPoint:(preventivo.verificarSetPoint)?1:0,
    PreventivoFields.revAislamientoDuctos:(preventivo.revAislamientoDuctos)?1:0,
    PreventivoFields.revCompElectrico:(preventivo.revCompElectrico)?1:0,
    PreventivoFields.verificarConexElectrico:(preventivo.verificarConexElectrico)?1:0,
    PreventivoFields.verifEstructuraEquipo:(preventivo.verifEstructuraEquipo)?1:0,
    PreventivoFields.lavadoEvaporador:(preventivo.lavadoEvaporador)?1:0,
    PreventivoFields.limpRejillaDifusores:(preventivo.limpRejillaDifusores)?1:0,
    PreventivoFields.lavadoFiltroAireEvaporadr:(preventivo.lavadoFiltroAireEvaporadr)?1:0,
    PreventivoFields.ajusteCargaRefrig:(preventivo.ajusteCargaRefrig)?1:0,
    PreventivoFields.revBalAspas:(preventivo.revBalAspas)?1:0,
    PreventivoFields.revMotorEvaporador:(preventivo.revMotorEvaporador)?1:0,
    PreventivoFields.revMotorCondensador:(preventivo.revMotorCondensador)?1:0,
    PreventivoFields.balanceVoltaje:(preventivo.balanceVoltaje)?1:0,
    PreventivoFields.balanceTurbinaChamaquera:(preventivo.balanceTurbinaChamaquera)?1:0,
    PreventivoFields.peinarAletasSerpentines:(preventivo.peinarAletasSerpentines)?1:0,
    PreventivoFields.otraActividad:preventivo.otraActividad,
    PreventivoFields.reporteId:preventivo.reporteId,
  };
}

