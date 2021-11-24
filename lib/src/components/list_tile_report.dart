import 'package:flutter/material.dart';

class ListTileReport extends StatefulWidget {
  final String title;
  final int index;
  final int id;
  const ListTileReport({Key? key,required this.title, required this.index,required this.id}) : super(key: key);

  @override
  _ListTileReportState createState() => _ListTileReportState();
}

class _ListTileReportState extends State<ListTileReport> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      title: (widget.title.isNotEmpty)?Text(widget.title): Text("Cliente "+widget.id.toString()),
      leading: Text(widget.index.toString()+".-"),
      onTap: (){

      },
    );
  }
}