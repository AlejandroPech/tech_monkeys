import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/pages/correctivo_page.dart';
import 'package:tech_monkeys/src/pages/preventivo_page.dart';

class ListTileReport extends StatefulWidget {
  final ReporteServicio servicio;
  final int index;
  const ListTileReport({Key? key,required this.servicio,required this.index}) : super(key: key);

  @override
  _ListTileReportState createState() => _ListTileReportState();
}

class _ListTileReportState extends State<ListTileReport> with AutomaticKeepAliveClientMixin{
  
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: ListTile(
        title: (widget.servicio.cliente.isNotEmpty)
          ?Text(widget.servicio.cliente)
          : Text("Cliente "+widget.servicio.id.toString()),
        subtitle: Text("Reporte: "+widget.servicio.id.toString()),
        leading: const Icon(Icons.note_add_sharp),
        onTap: (){
          if(widget.servicio.tipo=="preventivo"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>PreventivoPage(id: widget.servicio.id,))
            );
          }else if(widget.servicio.tipo=="correctivo"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>CorrectivoPage(id: widget.servicio.id,))
            );
          }
        },
      ),
    );
  }
}