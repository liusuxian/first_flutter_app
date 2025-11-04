import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class RouterTestTipRoute extends StatefulWidget {
  const RouterTestTipRoute({
    super.key,
    this.title = "路由传值",
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  State<RouterTestTipRoute> createState() => _RouterTestTipRouteState();
}

class _RouterTestTipRouteState extends State<RouterTestTipRoute> {
  String _backResult = "";

  void _updateBackResult(String result) {
    setState(() {
      _backResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: widget.titleColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: widget.backgroundColor,
        title: Text(widget.title, style: TextStyle(color: widget.titleColor)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("路由返回值: $_backResult"),
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(
                        // 路由参数
                        text: "我是提示xxxx",
                      );
                    },
                  ),
                );
                _updateBackResult(result);
                // 输出 TipRoute 路由返回结果
                developer.log("路由返回值: $result", name: 'my.app.TipRoute');
              },
              child: Text("打开提示页"),
            ),
          ],
        ),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({
    super.key,
    required this.text,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String text;
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
        title: Text("提示", style: TextStyle(color: titleColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
