import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/list_tile_report.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';

class TabListCorrectivos extends StatefulWidget {
  final List<ReporteServicio> reportes;
  const TabListCorrectivos({Key? key,required this.reportes}) : super(key: key);

  @override
  _TabListCorrectivosState createState() => _TabListCorrectivosState();
}

class _TabListCorrectivosState extends State<TabListCorrectivos>  {
  late List<ReporteServicio> reportes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    reportes=widget.reportes;
  }
  Future refreshReportes() async {
    setState(() => isLoading = true);

    reportes = await ReporteCorrectivoDataBase.readAllCorrectivos();

    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      reportes=widget.reportes;
    });
    return RefreshIndicator(
      onRefresh: ()async {refreshReportes();  },
      child: Scaffold(
        body:Container(
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