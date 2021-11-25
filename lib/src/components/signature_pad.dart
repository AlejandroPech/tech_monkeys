import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

typedef BoolCallback = void Function(bool val);
typedef Uint8ListCallback = void Function(Uint8List? val);
class SignaturePad extends StatefulWidget {
  final GlobalKey<SfSignaturePadState> keySignaturePad;
  final String firmante;
  final BoolCallback boolCallback;
  final Uint8ListCallback uint8listCallback;
  final Uint8List? signature;
  final bool isSigned;
  const SignaturePad({
    Key? key,
    required this.keySignaturePad,
    required this.firmante,
    required this.boolCallback,
    required this.uint8listCallback,
    required this.signature,
    required this.isSigned,
  }) : super(key: key);


  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> with AutomaticKeepAliveClientMixin{
  late bool isSigned;
  @override
  void initState() {
    super.initState();
    isSigned=widget.isSigned;
  }
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin:const  EdgeInsets.symmetric(horizontal:10,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Firma del "+widget.firmante),
              TextButton(
                onPressed:() async {
                  setState(() {
                    if(widget.keySignaturePad.currentState!=null){
                      widget.keySignaturePad.currentState!.clear();
                    }
                    isSigned=false;
                    widget.boolCallback(false);
                    widget.uint8listCallback(null);
                  });
                },
                child:const Text("Limpiar")
              )
            ],
          ),
          !isSigned
          ?SfSignaturePad(
              key: widget.keySignaturePad,
              backgroundColor: Colors.yellow.withOpacity(0.02),
              onDrawEnd: (){
                isSigned=true;
                widget.boolCallback(true);
              },
            )
          :Image.memory(widget.signature!)            
        ],
      ),
    );
  }
}