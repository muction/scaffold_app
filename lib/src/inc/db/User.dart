import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class User {
  final int userId;
  final String userName;
  final String userToken;
  final Object userRoleName;
  final int userProId;
  final String userProTitle;
  final int userCenterId;
  final String userCenterTitle;

  User(
      this.userId,
      this.userName,
      this.userToken,
      this.userRoleName,
      this.userProId,
      this.userProTitle,
      this.userCenterId,
      this.userCenterTitle
      );
}
