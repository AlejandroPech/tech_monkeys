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

  Map<String,Object?>toJson()=>{
    PreventivoFields.id:id,
    PreventivoFields.lavadoCondensador:(lavadoCondensador)?1:0,
    PreventivoFields.limpAjusteCompElectrico:(limpAjusteCompElectrico)?1:0,
    PreventivoFields.insAjustePotencia:(insAjustePotencia)?1:0,
    PreventivoFields.limpBandejaDrenaje:(limpBandejaDrenaje)?1:0,
    PreventivoFields.verificarSetPoint:(verificarSetPoint)?1:0,
    PreventivoFields.revAislamientoDuctos:(revAislamientoDuctos)?1:0,
    PreventivoFields.revCompElectrico:(revCompElectrico)?1:0,
    PreventivoFields.verificarConexElectrico:(verificarConexElectrico)?1:0,
    PreventivoFields.verifEstructuraEquipo:(verifEstructuraEquipo)?1:0,
    PreventivoFields.lavadoEvaporador:(lavadoEvaporador)?1:0,
    PreventivoFields.limpRejillaDifusores:(limpRejillaDifusores)?1:0,
    PreventivoFields.lavadoFiltroAireEvaporadr:(lavadoFiltroAireEvaporadr)?1:0,
    PreventivoFields.ajusteCargaRefrig:(ajusteCargaRefrig)?1:0,
    PreventivoFields.revBalAspas:(revBalAspas)?1:0,
    PreventivoFields.revMotorEvaporador:(revMotorEvaporador)?1:0,
    PreventivoFields.revMotorCondensador:(revMotorCondensador)?1:0,
    PreventivoFields.balanceVoltaje:(balanceVoltaje)?1:0,
    PreventivoFields.balanceTurbinaChamaquera:(balanceTurbinaChamaquera)?1:0,
    PreventivoFields.peinarAletasSerpentines:(peinarAletasSerpentines)?1:0,
    PreventivoFields.otraActividad:otraActividad,
    PreventivoFields.reporteId:reporteId,
  };
}

