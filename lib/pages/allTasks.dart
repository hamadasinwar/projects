import 'package:flutter/material.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/myProvider.dart';
import 'package:flutter_app/widgets/taskWidget.dart';
import 'package:provider/provider.dart';

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
      child: Selector<MyProvider, List<Task>>(
        selector: (c , a){
          return a.tasks;
        },
        builder: (context, value, child){
          return Column(
            children: value.map((e) => TaskWidget(e, page: widget,)).toList(),
          );
        },
      )
    );
  }
}