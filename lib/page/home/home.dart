import 'package:flutter/material.dart';
import 'package:first_flutter_app/page/counter/counter.dart';
import 'package:first_flutter_app/page/state/state.dart';
import 'package:first_flutter_app/page/state/tap_box_a.dart';
import 'package:first_flutter_app/page/state/tap_box_b.dart';
import 'package:first_flutter_app/page/state/tap_box_c.dart';
import 'package:first_flutter_app/page/cupertino/cupertino.dart';
import 'package:first_flutter_app/page/route/tip_route.dart';

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
            TextButton(
              child: Text("Open State Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GetStateObjectRoute();
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("Open TapBoxA Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TapBoxAWidget();
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("Open Parent TapBoxB Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ParentTapBoxBWidget();
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("Open Parent TapBoxC Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ParentTapBoxCWidget();
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("Open Cupertino Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CupertinoTestRoute();
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("Open Test TipRoute Page"),
              onPressed: () {
                // 导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RouterTestTipRoute();
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
