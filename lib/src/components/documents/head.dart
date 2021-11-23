import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/text_field_icon.dart';
import 'package:tech_monkeys/src/components/text_field_multiline.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
typedef ReporteServicioCallBack = void Function(ReporteServicio val);
class HeadDoc extends StatefulWidget {
  final ReporteServicio reporte;
  final ReporteServicioCallBack reporteServicio;
  final bool description;
  const HeadDoc({Key? key,required this.reporteServicio,required this.reporte,required this.description}) : super(key: key);

  @override
  State<HeadDoc> createState() => _HeadDocState();
}

class _HeadDocState extends State<HeadDoc> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            'Reporte de Servicio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        textBox(
          "Cliente",
          const Icon(Icons.person),
          TextInputType.text,
          (val)=>widget.reporte.cliente=val,
        ),
        textBox(
          "Ubicación",
          const Icon(Icons.location_on),
          TextInputType.text,
          (val)=>widget.reporte.ubicacion=val,
        ),
        textBox(
          "Tipo de equipo",
          const Icon(Icons.personal_video),
          TextInputType.text,
          (val)=>widget.reporte.tipoEquipo=val,
        ),
        textBox(
          "Mantenimiento",
          const Icon(Icons.hardware),
          TextInputType.text,
          (val)=>widget.reporte.mantenimiento=val,
        ),
        textBox(
          "Fecha", 
          const Icon(Icons.calendar_view_day),
          TextInputType.datetime,
          (val)=>widget.reporte.fecha=val,
        ),
        textBox(
          "Marca",
          const Icon(Icons.branding_watermark),
          TextInputType.text,
          (val)=>widget.reporte.marca=val,
        ),
        textBox(
          "Modelo",
          const Icon(CupertinoIcons.pencil),
          TextInputType.text,
          (val)=>widget.reporte.modelo=val,
        ),
        textBox(
          "Número de serie",
          const Icon(CupertinoIcons.barcode),
          TextInputType.text,
          (val)=>widget.reporte.numSerie=val,
        ),
        if(widget.description)
          TextFieldMultiline(
            callbackString: (val){
            widget.reporte.descripcion=val;
            widget.reporteServicio(widget.reporte);
            },
            title: "Descripción del reporte"
          ),
      ],
    );
  }

  TextFieldIcon textBox(String text,Icon icon, TextInputType keyBoardType, Function function)=>TextFieldIcon(
    text: text,
    icon: icon,
    keyBoardType: keyBoardType,
    callback: (val){
      function(val);
      widget.reporteServicio(widget.reporte);
    },
  );
}
