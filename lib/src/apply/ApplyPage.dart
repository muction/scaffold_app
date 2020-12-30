import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset("assets/images/user_car_bg.png"),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [SvgPicture.asset("assets/images/qiche.svg")],
                    ),
                    Row(
                      children: [Text("私车公用申请")],
                    )
                  ],
                ),
              ),
              InkWell(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/nongyong.svg")
                      ],
                    ),
                    Row(
                      children: [Text("农车使用申请")],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
