import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);

class TextFieldNumber extends StatefulWidget {
  final StringCallback callbackString;
  final String title;
  const TextFieldNumber({Key? key,required this.callbackString,required this.title}) : super(key: key);

  @override
  _TextFieldNumberState createState() => _TextFieldNumberState();
}

class _TextFieldNumberState extends State<TextFieldNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              // hintText: widget.title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              )
            ),
            onChanged: (value){
              widget.callbackString(value.trim());
            },
          )
        ],
      ),
    );
  }
}