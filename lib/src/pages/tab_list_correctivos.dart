import 'package:flutter/material.dart';

class TabListCorrectivos extends StatefulWidget {
  const TabListCorrectivos({Key? key}) : super(key: key);

  @override
  _TabListCorrectivosState createState() => _TabListCorrectivosState();
}

class _TabListCorrectivosState extends State<TabListCorrectivos> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      body: const Center(
        child: Text("No hay reportes aún"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context,"Correctivo");
        }
      ),
    );
  }
}