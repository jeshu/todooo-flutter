import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/models/task.dart';
import 'package:todoo/models/task_notifier.dart';
import 'package:todoo/widgets/task_tiles.dart';

class TaskList extends StatelessWidget {
  TaskList({this.onChange});

  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                  taskData.deleteTask(index);
              },
              child: TaskTile(
                  taskTitle: taskData.tasks[index].name,
                  isChecked: taskData.tasks[index].isDone,
                  onChange: (value) {
                    taskData.toggleDone(index);
                  }),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
