import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaffold_app/src/inc/comm/WidgetListView.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(14.0, 30.0, 10.0, 0.0),
                  child: Text(
                    "个人中心",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 13.0, 0.0, 20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset("assets/images/touxiang.svg")
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: Text("Admin"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: Text("河北省"),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                WidgetListView().listAccount("我的审批", "assets/images/info-shenqing.svg"),
                WidgetListView().listAccount("用车审批", "assets/images/info-shenpi.svg"),
                WidgetListView().listAccount("使用中的车辆", "assets/images/info-beifen.svg"),
                WidgetListView().listAccount("进行中的工作", "assets/images/inwork.svg"),
                WidgetListView().listAccount("使用中的车辆", "assets/images/info-beifen.svg"),
                WidgetListView().listAccount("设置", "assets/images/info-shezhi.svg"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
