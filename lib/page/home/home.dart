import 'package:flutter/material.dart';
import 'package:first_flutter_app/page/component/echo.dart';
import 'package:first_flutter_app/page/component/counter.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({
    super.key,
    required this.title,
    this.backgroundColor = Colors.grey,
  });

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundColor, title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 添加间距
            const SizedBox(height: 20),
            // 将 Echo 和 CounterWidget 放到一个容器中
            Container(
              padding: const EdgeInsets.all(16), // 内边距
              margin: const EdgeInsets.symmetric(horizontal: 20), // 外边距
              decoration: BoxDecoration(
                color: Colors.blue[50], // 背景色
                borderRadius: BorderRadius.circular(12), // 圆角
                border: Border.all(color: Colors.blue, width: 2), // 边框
              ),
              child: Column(
                // 垂直排列
                children: [
                  Echo(
                    text: "Hello Flutter Counter",
                    textColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 16), // 两个组件之间的间距
                  CounterWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
