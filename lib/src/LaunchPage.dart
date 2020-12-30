import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scaffold_app/src/index/IndexPage.dart';

///
/// ----------------------------------------------------------------------------
/// 默认启动页
/// ----------------------------------------------------------------------------
///
///
class LaunchPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => LaunchDefaultState();
}

///
/// 默认启动页面
///  倒计时3秒后进入APP首页面
///
class LaunchDefaultState extends State<LaunchPage>{

  int maxWaitTime=3;
  Timer _timer;

  @override
  void initState(){
    super.initState();

    // 启动定时器
    timeInterval(maxWaitTime);
  }

  /// 计时器
  timeInterval(int maxWaitTimeInit){
    _timer =Timer.periodic( Duration(seconds: maxWaitTimeInit) , (timer){
      maxWaitTime--;
      cancelTimer(maxWaitTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    //显示图片
    return Scaffold(
       body: Center(
         child: Image.asset("assets/images/launch.png",
         fit: BoxFit.fitHeight, height: double.infinity,width: double.infinity,),
       ),
    );
  }


  @override
  // ignore: must_call_super
  void dispose(){
    if(_timer != null && _timer.isActive){
      _timer.cancel();
      _timer=null;
    }
    super.dispose();
  }

  /// 取消定时器
  /// 取消后，自动跳转到App首页
  cancelTimer(nowWaitTime){
    if(nowWaitTime <=0 && _timer !=null && _timer.isActive){
      _timer.cancel();
      _timer=null;
      Navigator.pushNamed(context, '/layoutPage');
    }

    if(_timer == null){
      Navigator.pushNamed(context, '/loginPage');
    }
  }
}