import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoo/models/task_notifier.dart';
import 'package:todoo/screens/add_task_screen.dart';
import 'package:todoo/widgets/task_list.dart';
import 'package:provider/provider.dart';


class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Todooo',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: TaskList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
