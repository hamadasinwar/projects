import 'file:///E:/Projects/flutter_app/lib/db/dbHelper.dart';

class Task{
  String name;
  bool isComplete;
  Task({this.name, this.isComplete});

  toJSON(){
    return{
      DBHelper.tasksName : this.name,
      DBHelper.isCompleteTasks : this.isComplete? 1:0
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) => Task(
    name: json['name'],
    isComplete: json['isComplete']==1?true:false
  );

}