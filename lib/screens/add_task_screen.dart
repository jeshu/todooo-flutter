import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/models/task_notifier.dart';

class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String taskInput;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 117, 117, 117),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskInput = value;
              },
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<TaskData>(context,listen: false).addTask(taskInput);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
