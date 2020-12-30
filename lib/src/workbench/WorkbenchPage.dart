import 'package:flutter/material.dart';
import 'package:scaffold_app/src/inc/comm/WidgetListView.dart';

class WorkbenchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[SliverAppBar(
          title: Text('老孟'),
        )];
      },
      body: ListView.builder(itemBuilder: (BuildContext context,int index){
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },itemCount: 20,),
    );
  }
}
