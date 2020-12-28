import 'package:flutter/material.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/widgets/taskWidget.dart';
import 'package:provider/provider.dart';
import '../myProvider.dart';

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
      child: Selector<MyProvider, List<Task>>(
        selector: (c , a){
          return a.tasks;
        },
        builder: (context, value, child){
          return Column(
            children: value.where((element) => element.isComplete == true).map((e) => TaskWidget(e, page: widget,)).toList()
          );
        },
      )
    );
  }
}