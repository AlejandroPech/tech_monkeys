import 'package:flutter/material.dart';

typedef IntCallback = void Function(int val);
typedef StringCallback = void Function(String val);

class RowRadioButtons extends StatefulWidget {
  final StringCallback callbackString;
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String initialValue;
  const RowRadioButtons({
    Key? key,
    required this.callbackString,
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<RowRadioButtons> createState() => _RowRadioButtonsState();
}

class _RowRadioButtonsState extends State<RowRadioButtons> {
  late int selectedValue;
  @override
  void initState() {
    super.initState();
    if(widget.initialValue==widget.option1){
      selectedValue=1;
    }else if(widget.initialValue==widget.option2){
      selectedValue=2;
    }else if(widget.initialValue==widget.option3){
      selectedValue=3;
    }else{
      selectedValue=0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.symmetric(horizontal: 14,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(widget.title),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Radio(value: 1, groupValue: selectedValue, 
                    onChanged: (onChanged){
                      setState(() {
                        selectedValue=1;
                        widget.callbackString(widget.option1);
                      });
                    }
                  ),
                  Text(widget.option1)
                ],
              ),
              Column(
                children: [
                  Radio(value: 2, groupValue: selectedValue, 
                    onChanged: (onChanged){
                      setState(() {
                        selectedValue=2;
                        widget.callbackString(widget.option1);
                      });
                    }
                  ),
                  Text(widget.option2)
                ],
              ),
              Column(
                children: [
                  Radio(value: 3, groupValue: selectedValue, 
                    onChanged: (onChanged){
                      setState(() {
                        selectedValue=3;
                        widget.callbackString(widget.option3);
                      });
                    }
                  ),
                  Text(widget.option3),
                ],
              ),
            ],
          ),

        ] 
      ),
    );
  }
}