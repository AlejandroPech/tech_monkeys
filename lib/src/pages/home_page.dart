import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tech_monkeys/src/pages/tab_list_correctivos.dart';
import 'package:tech_monkeys/src/pages/tab_list_preventivos.dart';

// import 'package:tech_monkeys/src/pages/preventivo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keySignaturePad= GlobalKey<SfSignaturePadState>();

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tech Monkeys"),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("Mantenimiento preventivo"),),
              Tab(child: Text("Mantenimiento correctivo"),),
            ],
          ),
        ),
        body:const TabBarView(
          children: [
            SafeArea(
            child: TabListPreventivos(),
          ),SafeArea(
            child: TabListCorrectivos(),
          ),
          ],
        ),
      ),
    );
  }
}