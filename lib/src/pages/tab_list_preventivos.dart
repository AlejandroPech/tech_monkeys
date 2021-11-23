import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';

class TabListPreventivos extends StatefulWidget {
  const TabListPreventivos({Key? key}) : super(key: key);

  @override
  _TabListPreventivosState createState() => _TabListPreventivosState();
}

class _TabListPreventivosState extends State<TabListPreventivos> {
  late List<ReporteServicio> reportes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshReportes();
  }

  @override
  void dispose() {
    ReporteServicioDataBase.instance.close();
    super.dispose();
  }

  Future refreshReportes() async {
    setState(() => isLoading = true);

    reportes = await ReporteServicioDataBase.instance.readAllReports();

    setState(() => isLoading = false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:FutureBuilder(
      //   future: getReportes(),
      //   builder: (BuildContext context, AsyncSnapshot<List<ReporteServicio>> snapshot) {
      //     if(snapshot.hasData){
      //       return 
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      // ),
      body:ListView.builder(
        itemCount: reportes.length,
        itemBuilder: (BuildContext context,int index){
          if(reportes.isNotEmpty){
            return ListTileReport(
              title:reportes[index].cliente,
              index: index,
              id: reportes[index].id!,
            );
          }else{
            return const Center(
              child: Text("No hay reportes guardados"),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context,"Preventivo");  
        }
      ),
    );
  }
}

class ListTileReport extends StatefulWidget {
  final String title;
  final int index;
  final int id;
  const ListTileReport({Key? key,required this.title, required this.index,required this.id}) : super(key: key);

  @override
  _ListTileReportState createState() => _ListTileReportState();
}

class _ListTileReportState extends State<ListTileReport> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      title: (widget.title.isNotEmpty)?Text(widget.title): Text("Cliente "+widget.id.toString()),
      leading: Text(widget.index.toString()+".-"),
      onTap: (){

      },
    );
  }
}