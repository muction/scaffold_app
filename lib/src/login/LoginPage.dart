import 'dart:convert';
import 'dart:ui';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaffold_app/src/inc/AppCommonWidget.dart';
import 'package:scaffold_app/src/inc/tool/Http.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// 12/14/20 - 4:29 PM
/// muction
///
///

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var inputUserName;

  var inputUserPassword;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppCommonWidget.commonAppBar("", false, true),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(
              height: 500,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 60.0),
                    child: Column(
                      children: [
                        Row(children: [
                          SvgPicture.asset("assets/images/logoicon.svg")
                        ]),
                        Row(
                          children: [
                            Text(
                              "平安回家",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "账号",
                              style: TextStyle(
                                  color: Color.fromRGBO(3, 3, 3, 1.0)),
                            )
                          ],
                        ),
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(238, 238, 238, 1.0)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(24, 185, 112, 1.0)),
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              inputUserName = v;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "密码",
                                style: TextStyle(
                                    color: Color.fromRGBO(3, 3, 3, 1.0)),
                              )
                            ],
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(238, 238, 238, 1.0)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(24, 185, 112, 1.0)),
                            ),
                          ),
                          obscureText: true,
                          onChanged: (v) {
                            setState(() {
                              inputUserPassword = v;
                            });
                          },
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: FlatButton(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "登录",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    color: Color.fromRGBO(24, 185, 112, 1.0),
                                    highlightColor:
                                        Color.fromRGBO(25, 186, 113, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    textColor: Colors.white,
                                    onPressed: () {
                                      //在这里不能通过此方式获取FormState，context不对
                                      //print(Form.of(context));

                                      // 通过_formKey.currentState 获取FormState后，
                                      // 调用validate()方法校验用户名密码是否合法，校验
                                      // 通过后再提交数据。
                                      if(inputUserName == null || inputUserPassword == null){
                                        EasyLoading.showInfo("您输入的账号密码不正确");
                                      }else{
                                        _loginApp(inputUserName, inputUserPassword);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
              color: Colors.white,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: SvgPicture.asset(
                "assets/images/logo-bg.svg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 2.0,
              child: Text(
                "当前版本 11.27",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ));
  }

  // 登录系统
  _loginApp( u, p) async {

    //HTTP请求
    EasyLoading.show(status: "加载中...");

    var response = await Http().post("/api/auth/login", {"username" : u, "password":p});
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    EasyLoading.dismiss();

    //设置登录用户名
    _prefs.setString("loginUserName", response['body']['username']);
    _prefs.setInt("loginUserId", response['body']['id']);
    _prefs.setInt("proId", response['body']['pro_id']);
    _prefs.setString("proName", response['body']['pro_name']);
    _prefs.setInt("centerId", response['body']['center_id']);
    _prefs.setString("centerName", response['body']['center_name']);
    _prefs.setString("token", response['body']['token']);
    _prefs.setString("centerTitle", response['body']['center_title']);
    _prefs.setString("userCenterMenu", jsonEncode(response['body']['user_center_menu']));

    List<String> carType =  [];
    response['body']['car_type'].forEach((name){
      carType.add(name);
    });
    _prefs.setStringList("carType", carType);

    // 登录成功，跳转到首页
    Navigator.pushNamed(context, "/layoutPage");
  }
}
