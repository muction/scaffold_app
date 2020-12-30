import 'package:flutter/material.dart';

///
/// 12/14/20 - 2:28 PM
/// muction
///
///

class AppCommonWidget {


  // 公用AppBar
  static Widget commonAppBar(String pageTitle, bool automaticallyImplyLeading,[ bool showAppBar]) {

    if(showAppBar == false){
      return null;
    }
    var leadingButton;
    if(automaticallyImplyLeading == true){
      leadingButton=BackButton(
        color: Colors.black,
      );
    }else{
      leadingButton=null;
    }
    return AppBar(
      title: Text(pageTitle, style: TextStyle(color: Colors.black)),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      shadowColor: Colors.white,
      elevation: 0, //去掉底部阴影
      leading: leadingButton
    );
  }
}
