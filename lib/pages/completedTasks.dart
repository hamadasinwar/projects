import 'package:flutter/material.dart';
import 'package:flutter_app/db/dbHelper.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/widgets/taskWidget.dart';

// ignore: camel_case_types
class complete extends StatefulWidget {
  @override
  _completeState createState() => _completeState();
}

// ignore: camel_case_types
class _completeState extends State<complete> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: FutureBuilder<List<Task>>(
            future: DBHelper.dbHelper.selectAllTasks(),
            builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot){
              if(snapshot.hasData){
                return Column(
                  children: snapshot.data.where((element) => element.isComplete == true).map((e) => TaskWidget(e, page: widget,)).toList(),
                );
              }else{
                return Column();
              }
            },
          )
      ),
    );
  }
}