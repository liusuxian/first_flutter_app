import 'package:flutter/cupertino.dart';

class CupertinoTestRoute extends StatelessWidget {
  const CupertinoTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Cupertino Demo"),
        // 添加返回按钮
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: const Text("Press"),
          onPressed: () {},
        ),
      ),
    );
  }
}
