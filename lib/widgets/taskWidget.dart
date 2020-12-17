import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/dbHelper.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/tasks.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  Task task;
  Function function;
  Widget page;

  TaskWidget(this.task, {this.function, this.page});

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  _showMyDialog(context, this.widget.task.name, this.widget.page);
                });
              },
                child: Icon(Icons.delete, color: Colors.grey[850],)),
            Text(widget.task.name),
            Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) {
                  this.widget.task.isComplete = !(this.widget.task.isComplete);
                  DBHelper.dbHelper.updateTask(this.widget.task.name, Task(name: this.widget.task.name, isComplete: value));
                  setState(() {});
                  widget.function();
                })
          ],
        ),
      ),
    );
  }
}

_showMyDialog(BuildContext context, String name, Widget page) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure you want to delete $name task?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('once the task is deleted its GONE'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.grey),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('DELETE', style: TextStyle(color: Colors.red),),
            onPressed: () {
              DBHelper.dbHelper.deleteTask(name);
              Navigator.push(context, MaterialPageRoute(builder: (context) => myPage()));
            },
          ),
        ],
      );
    },
  );
}
