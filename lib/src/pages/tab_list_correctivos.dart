import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/list_tile_report.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';

class TabListCorrectivos extends StatefulWidget {
  const TabListCorrectivos({Key? key}) : super(key: key);

  @override
  _TabListCorrectivosState createState() => _TabListCorrectivosState();
}

class _TabListCorrectivosState extends State<TabListCorrectivos> with AutomaticKeepAliveClientMixin {
  late List<ReporteServicio> reportes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshReportes();
  }

  @override
  void dispose() {
    ReporteCorrectivoDataBase.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Future refreshReportes() async {
    setState(() => isLoading = true);

    reportes = await ReporteCorrectivoDataBase.readAllCorrectivos();

    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body:Container(
        child: isLoading
          ?const Center(child: CircularProgressIndicator())
          : reportes.isEmpty
            ?const Center(child: Text("No hay reportes aún"),)
            :ListView.builder(
              itemCount: reportes.length,
              itemBuilder: (BuildContext context,int index){
                return ListTileReport(
                  title:reportes[index].cliente,
                  index: index,
                  id: reportes[index].id!,
                );
              }
            ),
      ),
    );
  }
}