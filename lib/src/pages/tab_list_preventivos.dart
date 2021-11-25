import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/list_tile_report.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';

class TabListPreventivos extends StatefulWidget {
  final List<ReporteServicio> reportes;
  const TabListPreventivos({Key? key,required this.reportes}) : super(key: key);

  @override
  _TabListPreventivosState createState() => _TabListPreventivosState();
}

class _TabListPreventivosState extends State<TabListPreventivos> {
  late List<ReporteServicio> reportes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    reportes=widget.reportes;
  }
  Future refreshReportes() async {
    setState(() => isLoading = true);

    reportes = await ReportePreventivoDataBase.readAllPreventivos();

    setState(() => isLoading = false);
  }
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      reportes=widget.reportes;
    });
    return Scaffold(
      body:RefreshIndicator(
        onRefresh: ()async { refreshReportes(); },
        child: Container(
          child: isLoading
            ?const Center(child: CircularProgressIndicator())
            : reportes.isEmpty
              ?const Center(child: Text("No hay reportes aún"),)
              :ListView.builder(
                itemCount: reportes.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTileReport(
                    servicio:reportes[index],
                    index: index,
                  );
                }
              ),
        ),
      ),
    );
  }
}