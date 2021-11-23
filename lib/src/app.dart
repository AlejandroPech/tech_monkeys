import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/pages/correctivo_page.dart';
import 'package:tech_monkeys/src/pages/home_page.dart';
import 'package:tech_monkeys/src/pages/preventivo_page.dart';

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomePage',
      routes: {
        "HomePage":(context)=>const HomePage(),
        "Preventivo":(context)=>const PreventivoPage(),
        "Correctivo":(context)=>const CorrectivoPage(),
      },
    );
  }
}