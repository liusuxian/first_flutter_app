import 'package:flutter/material.dart';

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text("子树中获取State对象"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    // 查找父级最近的Scaffold对应的ScaffoldState对象
                    ScaffoldState state = context
                        .findAncestorStateOfType<ScaffoldState>()!;
                    // 打开抽屉菜单
                    state.openDrawer();
                  },
                  child: Text('打开抽屉菜单1'),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    // 直接通过of静态方法来获取ScaffoldState
                    ScaffoldState state = Scaffold.of(context);
                    // 打开抽屉菜单
                    state.openDrawer();
                  },
                  child: Text('打开抽屉菜单2'),
                );
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("我是SnackBar")));
                  },
                  child: Text('显示SnackBar'),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
