import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/constants/colors.dart';

// ignore: must_be_immutable
class ToDoItem extends StatefulWidget {
  ToDoItem({
    super.key,
    required this.name,
    required this.detail,
    required this.isComplete,
    required this.onPressed,
    required this.onChanged,
  });

  final String name;
  final String detail;
  bool isComplete;
  final Function() onPressed;
  final void Function(bool?)? onChanged;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(22)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ListTile(
              leading: Checkbox(
                  shape: CircleBorder(),
                  side: BorderSide(color: AppColors.primaryColor),
                  value: widget.isComplete,
                  activeColor: AppColors.primaryColor,
                  checkColor: Colors.white,
                  onChanged: widget.onChanged),
              title: Text(
                widget.name,
                style: TextStyle(
                    color:
                        widget.isComplete ? Colors.grey : AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    decoration:
                        widget.isComplete ? TextDecoration.lineThrough : null),
              ),
              subtitle: Text(
                widget.detail,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: widget.isComplete ? Colors.grey : Colors.grey,
                    decoration:
                        widget.isComplete ? TextDecoration.lineThrough : null),
              ),
              trailing: TextButton(
                onPressed: widget.onPressed,
                child: Text(
                  "Delete",
                  style: TextStyle(color: AppColors.redColor),
                ),
              )),
        ));
  }
}
