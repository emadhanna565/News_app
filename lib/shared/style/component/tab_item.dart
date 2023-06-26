import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool selected;
  String sourceTitle;

  TabItem({required this.selected, required this.sourceTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Text(
        sourceTitle,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: selected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
