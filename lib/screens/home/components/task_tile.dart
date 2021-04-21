import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:todo_list/models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.taskColor,
    required this.onTapAction,
    required this.onDeleteAction,
  }) : super(key: key);

  final Task task;
  final Color taskColor;
  final void Function() onTapAction;
  final void Function() onDeleteAction;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile>
    with SingleTickerProviderStateMixin {
  double _dx = 0;
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller!.addListener(() {
      setState(() {
        _dx = _animation!.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dx += details.primaryDelta!;
        });
      },
      onHorizontalDragEnd: (details) async {
        var springDescription =
            SpringDescription(damping: 1, stiffness: 1, mass: 20);
        var springSimulation = SpringSimulation(springDescription, 0, 1,
            max((details.primaryVelocity! / size.width).abs(), 1));

        if ((_dx / size.width).abs() > .45) {
          _animation = _controller!.drive(
              Tween(begin: _dx, end: _dx >= 0 ? size.width : -size.width));
          await _controller!.animateWith(springSimulation);
          widget.onDeleteAction();
        } else {
          _animation = _controller!.drive(Tween(begin: _dx, end: 0));
          await _controller!.animateWith(springSimulation);
        }
      },
      child: Transform.translate(
        offset: Offset(_dx, 0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            onTap: widget.onTapAction,
            leading: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color:
                        widget.task.completed ? Colors.grey : widget.taskColor,
                  ),
                  shape: BoxShape.circle,
                  color:
                      widget.task.completed ? Colors.grey : Colors.transparent),
              child: Center(
                  child: widget.task.completed
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        )
                      : null),
            ),
            title: Text(
              widget.task.title,
              style: TextStyle(
                  color: widget.task.completed ? Colors.grey : Colors.grey[900],
                  decoration: widget.task.completed
                      ? TextDecoration.lineThrough
                      : null),
            ),
          ),
        ),
      ),
    );
  }
}
