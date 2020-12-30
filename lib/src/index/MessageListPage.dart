
import 'package:flutter/material.dart';
import 'package:scaffold_app/src/inc/AppCommonWidget.dart';


class MessageListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessageListState();
}


class MessageListState extends State<MessageListPage>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCommonWidget.commonAppBar("消息列表", true),
      body: Text("====="),
    );
  }

}