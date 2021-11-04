import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//create a checkbox widget
class Checkboxes extends StatefulWidget {
  const Checkboxes({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkboxes> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: isChecked,
      onChanged: (bool? val) {
        setState(() {
          isChecked = val!;
        });
      },
    );
  }
}

 Widget textBox(String text, Icon icon, TextInputType keyBoardType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(5),
        ),
        keyboardType: keyBoardType,
      ),
    );
 }