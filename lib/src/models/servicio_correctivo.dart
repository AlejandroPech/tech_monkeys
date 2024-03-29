const String tableCorrectivo='servicioCorrectivo';

class CorrectivoFields {
  static const List<String> values=[
    id,cambioCondensador,cambioAjusteCompElectrico,cambioAjusteTransPotencia,cambioAjusteBandDrenaje,cambioRodamientos,recurepaRefrigerante,correccionFuga,presurizadoNitrogeno,vacioMicrones,cargaRefrigerante,cambioEvaporador,cambioAjusteRejillas,cambioFiltroAireEvaporador,ajusteCargaRefrigerante,cambioBalanceoAspas,cambioAspasCondensador,cambioMotorCondensador,cambioMotorEvaporador,cambioCompresorFiltro,cambioComponenteElectrico,otraActividad,reporteId,
  ];
  static const id="_id";
  static const cambioCondensador="cambioCondensador";
  static const cambioAjusteCompElectrico="cambioAjusteCompElectrico";
  static const cambioAjusteTransPotencia="cambioAjusteTransPotencia";
  static const cambioAjusteBandDrenaje="cambioAjusteBandDrenaje";
  static const cambioRodamientos="cambioRodamientos";
  static const recurepaRefrigerante="recurepaRefrigerante";
  static const correccionFuga="correccionFuga";
  static const presurizadoNitrogeno="presurizadoNitrogeno";
  static const vacioMicrones="vacioMicrones";
  static const cargaRefrigerante="cargaRefrigerante";
  static const cambioEvaporador="cambioEvaporador";
  static const cambioAjusteRejillas="cambioAjusteRejillas";
  static const cambioFiltroAireEvaporador="cambioFiltroAireEvaporador";
  static const ajusteCargaRefrigerante="ajusteCargaRefrigerante";
  static const cambioBalanceoAspas="cambioBalanceoAspas";
  static const cambioAspasCondensador="cambioAspasCondensador";
  static const cambioMotorCondensador="cambioMotorCondensador";
  static const cambioMotorEvaporador="cambioMotorEvaporador";
  static const cambioCompresorFiltro="cambioCompresorFiltro";
  static const cambioComponenteElectrico="cambioComponenteElectrico";
  static const otraActividad="otraActividad"; 
  static const reporteId="reporteId";
}

class ServicioCorrectivo{
  int? id;
  bool cambioCondensador=false;
  bool cambioAjusteCompElectrico=false;
  bool cambioAjusteTransPotencia=false;
  bool cambioAjusteBandDrenaje=false;
  bool cambioRodamientos=false;
  bool recurepaRefrigerante=false;
  bool correccionFuga=false;
  bool presurizadoNitrogeno=false;
  bool vacioMicrones=false;
  bool cargaRefrigerante=false;
  bool cambioEvaporador=false;
  bool cambioAjusteRejillas=false;
  bool cambioFiltroAireEvaporador=false;
  bool ajusteCargaRefrigerante=false;
  bool cambioBalanceoAspas=false;
  bool cambioAspasCondensador=false;
  bool cambioMotorCondensador=false;
  bool cambioMotorEvaporador=false;
  bool cambioCompresorFiltro=false;
  bool cambioComponenteElectrico=false;
  String otraActividad="";
  int? reporteId;

  static ServicioCorrectivo fromJson(Map<String, Object?> json){
    ServicioCorrectivo correctivo = ServicioCorrectivo();
    correctivo.id=json[CorrectivoFields.id] as int?;
    correctivo.cambioCondensador=(json[CorrectivoFields.cambioCondensador]==1)?true:false;
    correctivo.cambioAjusteCompElectrico=(json[CorrectivoFields.cambioAjusteCompElectrico]==1)?true:false;
    correctivo.cambioAjusteTransPotencia=(json[CorrectivoFields.cambioAjusteTransPotencia]==1)?true:false;
    correctivo.cambioAjusteBandDrenaje=(json[CorrectivoFields.cambioAjusteBandDrenaje]==1)?true:false;
    correctivo.cambioRodamientos=(json[CorrectivoFields.cambioRodamientos]==1)?true:false;
    correctivo.recurepaRefrigerante=(json[CorrectivoFields.recurepaRefrigerante]==1)?true:false;
    correctivo.correccionFuga=(json[CorrectivoFields.correccionFuga]==1)?true:false;
    correctivo.presurizadoNitrogeno=(json[CorrectivoFields.presurizadoNitrogeno]==1)?true:false;
    correctivo.vacioMicrones=(json[CorrectivoFields.vacioMicrones]==1)?true:false;
    correctivo.cargaRefrigerante=(json[CorrectivoFields.cargaRefrigerante]==1)?true:false;
    correctivo.cambioEvaporador=(json[CorrectivoFields.cambioEvaporador]==1)?true:false;
    correctivo.cambioAjusteRejillas=(json[CorrectivoFields.cambioAjusteRejillas]==1)?true:false;
    correctivo.cambioFiltroAireEvaporador=(json[CorrectivoFields.cambioFiltroAireEvaporador]==1)?true:false;
    correctivo.ajusteCargaRefrigerante=(json[CorrectivoFields.ajusteCargaRefrigerante]==1)?true:false;
    correctivo.cambioBalanceoAspas=(json[CorrectivoFields.cambioBalanceoAspas]==1)?true:false;
    correctivo.cambioAspasCondensador=(json[CorrectivoFields.cambioAspasCondensador]==1)?true:false;
    correctivo.cambioMotorCondensador=(json[CorrectivoFields.cambioMotorCondensador]==1)?true:false;
    correctivo.cambioMotorEvaporador=(json[CorrectivoFields.cambioMotorEvaporador]==1)?true:false;
    correctivo.cambioCompresorFiltro=(json[CorrectivoFields.cambioCompresorFiltro]==1)?true:false;
    correctivo.cambioComponenteElectrico=(json[CorrectivoFields.cambioComponenteElectrico]==1)?true:false;
    correctivo.otraActividad=json[CorrectivoFields.otraActividad] as String;
    correctivo.reporteId=json[CorrectivoFields.reporteId] as int;

    return correctivo;
  }

  static Map<String,Object?>toJson(ServicioCorrectivo correctivo)=>{
    CorrectivoFields.id:correctivo.id,
    CorrectivoFields.cambioCondensador:(correctivo.cambioCondensador)?1:0,
    CorrectivoFields.cambioAjusteCompElectrico:(correctivo.cambioAjusteCompElectrico)?1:0,
    CorrectivoFields.cambioAjusteTransPotencia:(correctivo.cambioAjusteTransPotencia)?1:0,
    CorrectivoFields.cambioAjusteBandDrenaje:(correctivo.cambioAjusteBandDrenaje)?1:0,
    CorrectivoFields.cambioRodamientos:(correctivo.cambioRodamientos)?1:0,
    CorrectivoFields.recurepaRefrigerante:(correctivo.recurepaRefrigerante)?1:0,
    CorrectivoFields.correccionFuga:(correctivo.correccionFuga)?1:0,
    CorrectivoFields.presurizadoNitrogeno:(correctivo.presurizadoNitrogeno)?1:0,
    CorrectivoFields.vacioMicrones:(correctivo.vacioMicrones)?1:0,
    CorrectivoFields.cargaRefrigerante:(correctivo.cargaRefrigerante)?1:0,
    CorrectivoFields.cambioEvaporador:(correctivo.cambioEvaporador)?1:0,
    CorrectivoFields.cambioAjusteRejillas:(correctivo.cambioAjusteRejillas)?1:0,
    CorrectivoFields.cambioFiltroAireEvaporador:(correctivo.cambioFiltroAireEvaporador)?1:0,
    CorrectivoFields.ajusteCargaRefrigerante:(correctivo.ajusteCargaRefrigerante)?1:0,
    CorrectivoFields.cambioBalanceoAspas:(correctivo.cambioBalanceoAspas)?1:0,
    CorrectivoFields.cambioAspasCondensador:(correctivo.cambioAspasCondensador)?1:0,
    CorrectivoFields.cambioMotorCondensador:(correctivo.cambioMotorCondensador)?1:0,
    CorrectivoFields.cambioMotorEvaporador:(correctivo.cambioMotorEvaporador)?1:0,
    CorrectivoFields.cambioCompresorFiltro:(correctivo.cambioCompresorFiltro)?1:0,
    CorrectivoFields.cambioComponenteElectrico:(correctivo.cambioComponenteElectrico)?1:0,
    CorrectivoFields.otraActividad:correctivo.otraActividad,
    CorrectivoFields.reporteId:correctivo.reporteId,
  };
}