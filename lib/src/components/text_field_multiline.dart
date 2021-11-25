import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);
class TextFieldMultiline extends StatefulWidget {
  final StringCallback callbackString;
  final String title;
  final String initialValue;
  const TextFieldMultiline({Key? key,required this.callbackString,required this.title,required this.initialValue}) : super(key: key);

  @override
  _TextFieldMultilineState createState() => _TextFieldMultilineState();
}

class _TextFieldMultilineState extends State<TextFieldMultiline> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: widget.title,
              border: const OutlineInputBorder(
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