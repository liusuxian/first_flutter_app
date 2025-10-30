import 'package:flutter/material.dart';

// 回显字符串的Echo widget
class Echo extends StatelessWidget {
  const Echo({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
          ),
        ),
      ),
    );
  }
}
