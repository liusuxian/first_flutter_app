import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: widget.titleColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: widget.backgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: widget.titleColor,
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 登录
              },
              child: Text("微信登录"),
            ),
          ],
        ),
      ),
    );
  }
}
