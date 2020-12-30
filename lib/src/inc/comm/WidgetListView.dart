import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetListView {
  /// 单击事件
  Widget listAccount(title, svg) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 3.0, 0.0, 23.0),
      child: InkWell(
        onTap: () {
          // todo 跳转到对应页面
          print(title);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              svg,
              width: 22,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(13.0, 3.0, 0.0, 0.0),
              child: Text(title, style: TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }

  /// 首页消息列表
  Widget listMessage(title, svg) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 23.0),
      child: InkWell(
        onTap: () {
          // todo 跳转到对应页面
          print(title);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              svg,
              width: 40,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 工作台
  Widget listWorkBench() {
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [Text("===")],
          ),
        ),
        Expanded(
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ]))
      ],
    ));
  }
}
