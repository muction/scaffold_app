import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaffold_app/src/inc/comm/WidgetListView.dart';

class IndexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          WidgetListView().listMessage("用车申请", "assets/images/tongyong.svg"),
          WidgetListView().listMessage("用车申请", "assets/images/tongyong.svg")
        ],
      ),
    );
  }
  // 点击消息类别
  _messageOnTap(int i) {
    //print(i);
  }

}