import 'package:flutter/material.dart';

import '../counter/counter.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({
    super.key,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            TextButton(
              child: Text("Open Counter Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CounterPage(title: 'Flutter Counter Page');
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
