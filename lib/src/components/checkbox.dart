import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef BoolCallback = void Function(bool val);
//create a checkbox widget
class Checkboxes extends StatefulWidget {
  final BoolCallback checked;
  final String title;
  final bool initialValue;
  const Checkboxes({Key? key, required this.title,required this.checked,required this.initialValue}) : super(key: key);

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkboxes> {
  late bool isChecked;
  @override
  void initState() {
    super.initState();
    isChecked=widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: isChecked,
      onChanged: (bool? val) {
        setState(() {
          isChecked = val!;
          widget.checked(val);
        });
      },
    );
  }
}