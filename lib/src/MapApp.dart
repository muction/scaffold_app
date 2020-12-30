import 'package:flutter/material.dart';
import 'package:scaffold_app/src/LayoutPage.dart';
import 'package:scaffold_app/src/account/AccountPage.dart';
import 'package:scaffold_app/src/apply/ApplyPage.dart';
import 'package:scaffold_app/src/demoLayout/Zong.dart';
import 'package:scaffold_app/src/index/IndexPage.dart';
import 'package:scaffold_app/src/index/MessageListPage.dart';
import 'package:scaffold_app/src/login/LoginPage.dart';
import 'package:scaffold_app/src/workbench/WorkbenchPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'LaunchPage.dart';

class MapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Http http = Http();
    //
    // void response = http
    //     .post("/api/auth/login", {"username": "admin", "password": "vz3wC8sS"});

    return MaterialApp(
      title: "脚手架APP",
      showSemanticsDebugger: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => Zong(),
       // '/': (context) => LaunchPage(),
        '/loginPage': (context) => LoginPage(),
        '/layoutPage': (context) => LayoutPage(),
        //'/': (context) => LayoutPage(),
        '/indexPage': (context) => IndexPage(),
        '/messageListPage': (context) => MessageListPage(),
        '/apply': (context) => ApplyPage(),
        '/workbench': (context) => WorkbenchPage(),

        '/account': (context) => AccountPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}
