import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/dbHelper.dart';
import 'package:flutter_app/models/tasks.dart';

// ignore: must_be_immutable
class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskName;
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new task'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (value) {
                taskName = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task Completed'),
                Checkbox(
                    value: isComplete,
                    onChanged: (value) {
                      this.isComplete = value;
                      setState(() {});
                    }),
              ],
            ),
            RaisedButton(
              child: Text('Add New Task'),
              onPressed: () {
                DBHelper.dbHelper.insertNewTask(
                    Task(name: this.taskName, isComplete: this.isComplete));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
