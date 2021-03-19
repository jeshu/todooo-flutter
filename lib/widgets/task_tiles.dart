import 'package:flutter/material.dart';
import 'package:todoo/models/task.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.taskTitle, this.onChange});
  final Function onChange;
  final bool isChecked;
  final String taskTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            taskTitle,
          style: TextStyle(
            decoration: isChecked ?
                TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: TaskCheckbox(
          checkboxState:isChecked,
          onChange: onChange,
        ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({this.checkboxState, this.onChange});
  final bool checkboxState;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checkboxState,
        onChanged: onChange,
    );
  }
}
