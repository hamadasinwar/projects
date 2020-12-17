import 'package:flutter/material.dart';
import 'package:flutter_app/db/dbHelper.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/widgets/taskWidget.dart';

// ignore: camel_case_types
class allTasks extends StatefulWidget {

  @override
  _allTasksState createState() => _allTasksState();
}

// ignore: camel_case_types
class _allTasksState extends State<allTasks> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: FutureBuilder<List<Task>>(
            future: DBHelper.dbHelper.selectAllTasks(),
            builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot){
              if(snapshot.hasData){
                return Column(
                  children: snapshot.data.map((e) => TaskWidget(e, page: widget,)).toList(),
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
