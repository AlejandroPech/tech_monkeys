import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_monkeys/src/components/checkbox.dart';

class FooterDoc extends StatelessWidget {
  const FooterDoc({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: <Widget>[
       textBox("Otra actividad", const Icon(Icons.list), TextInputType.text),
       
      ],
    );
  }
}