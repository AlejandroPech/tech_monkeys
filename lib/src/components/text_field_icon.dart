import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);

class TextFieldIcon extends StatefulWidget {
  final String text;
  final Icon icon;
  final TextInputType keyBoardType;
  final StringCallback callback;
  const TextFieldIcon({Key? key,required this.text,required this.icon,required this.keyBoardType,required this.callback}) : super(key: key);

  @override
  _TextFieldIconState createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14,),
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          hintText: widget.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(5),
        ),
        keyboardType: widget.keyBoardType,
        onChanged: (val){
          widget.callback(val);
        },
      ),
    );
  }
}