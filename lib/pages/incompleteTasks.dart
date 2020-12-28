import 'package:flutter/material.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/widgets/taskWidget.dart';
import 'package:provider/provider.dart';
import '../myProvider.dart';

// ignore: camel_case_types
class incomplete extends StatefulWidget {
  @override
  _incompleteState createState() => _incompleteState();
}

// ignore: camel_case_types
class _incompleteState extends State<incomplete> {
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
              children: value.where((element) => element.isComplete == false).map((e) => TaskWidget(e, page: widget,)).toList()
          );
        },
      )
    );
  }
}