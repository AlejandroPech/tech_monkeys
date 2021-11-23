import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
class SignaturePad extends StatefulWidget {
  const SignaturePad({
    Key? key,
    required this.keySignaturePad,
  }) : super(key: key);

  final GlobalKey<SfSignaturePadState> keySignaturePad;

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> with AutomaticKeepAliveClientMixin{
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
          const Text("SignaturePad del Tecnico"),
          SfSignaturePad(
            key: widget.keySignaturePad,
            backgroundColor: Colors.yellow.withOpacity(0.02),
            
          ),
        ],
      ),
    );
  }
}