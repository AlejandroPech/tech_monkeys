import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/db/reporte_servicio_db.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/pages/correctivo_page.dart';
import 'package:tech_monkeys/src/pages/preventivo_page.dart';
import 'package:tech_monkeys/src/pages/tab_list_correctivos.dart';
import 'package:tech_monkeys/src/pages/tab_list_preventivos.dart';

// import 'package:tech_monkeys/src/pages/preventivo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  late TabController controller;
  late List<ReporteServicio> reportesPreventivos;
  late List<ReporteServicio> reportesCorectivos;
  bool isLoadingPre = false;
  bool isLoadingCo = false;
  @override
  void initState() {
    super.initState();
    refreshPreventivos();
    refreshCorrectivos();
    controller=TabController(length: 2,vsync: this);
  }
  @override
  void dispose() {
    controller.dispose;
    ReporteCorrectivoDataBase.close();
    super.dispose();
  }
  Future refreshPreventivos() async {
    setState(() => isLoadingPre = true);
    reportesPreventivos = await ReportePreventivoDataBase.readAllPreventivos();
    setState(() => isLoadingPre = false);
  }
  Future refreshCorrectivos() async {
    setState(() => isLoadingCo = true);
    reportesCorectivos = await ReporteCorrectivoDataBase.readAllCorrectivos();
    setState(() => isLoadingCo = false);
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Tech Monkeys"),
        bottom:  TabBar(
          controller: controller,
          tabs: const [
            Tab(child: Text("Mantenimiento preventivo"),),
            Tab(child: Text("Mantenimiento correctivo"),),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          isLoadingPre
          ?const Center(child: CircularProgressIndicator(),)
          :TabListPreventivos(reportes: reportesPreventivos,),
          isLoadingCo
          ?const Center(child: CircularProgressIndicator(),)
          :TabListCorrectivos(reportes: reportesCorectivos,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: ()async{
        if( controller.index==0){
          await Navigator.push(context, MaterialPageRoute(builder: (context) =>const PreventivoPage()),);
          refreshPreventivos();
        }else if( controller.index==1){
          await Navigator.push(context, MaterialPageRoute(builder: (context) =>const CorrectivoPage()),);
          refreshCorrectivos();
        }
      }
    ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}