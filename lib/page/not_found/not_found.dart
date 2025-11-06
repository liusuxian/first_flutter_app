import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: titleColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("404 页面不存在")],
        ),
      ),
    );
  }
}
