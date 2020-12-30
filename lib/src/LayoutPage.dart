import 'package:flutter/material.dart';
import 'package:scaffold_app/src/account/AccountPage.dart';
import 'package:scaffold_app/src/apply/ApplyPage.dart';
import 'package:scaffold_app/src/inc/AppCommonWidget.dart';
import 'package:scaffold_app/src/index/IndexPage.dart';
import 'package:scaffold_app/src/workbench/WorkbenchPage.dart';

class LayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LayoutPageState();
}

class LayoutPageState extends State {
  //定义服务变量
  var _selectedIndex = 0;
  var _automaticallyImplyLeading = false;
  var _iconSize = 22.0;
  var _pageTitle = "消息";
  var _page;
  var _showAppBar;

  @override
  void initState() {
    super.initState();
    _pressTabBar(0);
  }

  /// tabbar点击后
  _onItemTapped(index) {
    _pressTabBar(index);
  }

  //按钮点击
  _pressTabBar(int index) {
    this.setState(() {
      _selectedIndex = index;
      _automaticallyImplyLeading = false ;
      if (_selectedIndex == 0) {
        _pageTitle = "消息";
        _page = IndexPage();
        _showAppBar=true;
      } else if (_selectedIndex == 1) {
        _pageTitle = "用车";
        _page = ApplyPage();
        _showAppBar=false;
      } else if (_selectedIndex == 2) {
        _pageTitle = "工作台";
        _showAppBar=false;
        _page = WorkbenchPage();
      } else if (_selectedIndex == 3) {
        _pageTitle = "个人中心";
        _page = AccountPage();
        _showAppBar = false;
      } else {
        _pageTitle = "消息";
        _page = IndexPage();
        _showAppBar = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 关闭自动重置页面大小
      resizeToAvoidBottomPadding: false,

      // 顶部状态栏
      appBar: AppCommonWidget.commonAppBar(_pageTitle, _automaticallyImplyLeading, _showAppBar),

      //页面主视图
      body: _page,

      //页面底部按钮栏
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar/icon6.png",
              width: _iconSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar/icon1.png",
              width: _iconSize,
            ),
            label: "消息",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar/icon10.png",
              width: _iconSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar/icon3.png",
              width: _iconSize,
            ),
            label: "用车",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar/icon8.png",
              width: _iconSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar/icon4.png",
              width: _iconSize,
            ),
            label: "工作台",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/tabbar/icon9.png",
              width: _iconSize,
            ),
            activeIcon: Image.asset(
              "assets/tabbar/icon5.png",
              width: _iconSize,
            ),
            label: '个人中心',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        selectedFontSize: 12,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}
