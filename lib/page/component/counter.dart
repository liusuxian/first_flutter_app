import 'package:flutter/material.dart';
import 'dart:developer' as developer;

// 计数器 widget
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, this.initValue = 0});

  final int initValue;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  /*
  * 当 widget 第一次插入到 widget 树时会被调用，对于每一个 State 对象，Flutter 框架只会调用一次该回调，
  * 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等。
  * 不能在该回调中调用 BuildContext.dependOnInheritedWidgetOfExactType（该方法用于在 widget 树上获取离当前 widget 最近的一个父级 InheritedWidget），
  * 原因是在初始化完成后， widget 树中的 InheritFrom widget 也可能会发生变化，所以正确的做法应该在在 build（）方法或 didChangeDependencies() 中调用它。
  * */
  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    developer.log('initState', name: 'my.app.counter');
  }

  /*
  * 用于构建 widget 子树的，会在如下场景被调用：
  * 在调用 initState()之后，
  * 在调用 didUpdateWidget()之后，
  * 在调用 setState()之后，
  * 在调用 didChangeDependencies()之后，
  * 在 State 对象从树中一个位置移除后（会调用 deactivate）又重新插入到树的其他位置之后。
  * */
  @override
  Widget build(BuildContext context) {
    developer.log('build', name: 'my.app.counter');
    return Container(
      padding: const EdgeInsets.all(16), // 内边距
      margin: const EdgeInsets.symmetric(horizontal: 20), // 外边距
      decoration: BoxDecoration(
        color: Colors.blue[50], // 背景色
        borderRadius: BorderRadius.circular(12), // 圆角
        border: Border.all(color: Colors.blue, width: 2), // 边框
      ),
      child: TextButton(
        child: Text('$_counter'),
        // 点击后计数器自增
        onPressed: () => setState(() => ++_counter),
      ),
    );
  }

  /*
  * 在 widget 重新构建时，Flutter 框架会调用 widget.canUpdate 来检测 widget 树中同一位置的新旧节点，然后决定是否需要更新，
  * 如果 widget.canUpdate 返回 true 则会调用此回调。
  * widget.canUpdate 会在新旧 widget 的 key 和 runtimeType 同时相等时会返回 true，
  * 也就是说在在新旧 widget 的 key 和 runtimeType 同时相等时 didUpdateWidget() 就会被调用。
  * */
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget', name: 'my.app.counter');
  }

  /*
  * 当 State 对象从树中被移除时，会调用此回调。在一些场景下，Flutter 框架会将 State 对象重新插到树中，
  * 如包含此 State 对象的子树在树的一个位置移动到另一个位置时（可以通过 GlobalKey 来实现）。
  * 如果移除后没有重新插入到树中则紧接着会调用 dispose() 方法。
  * */
  @override
  void deactivate() {
    super.deactivate();
    developer.log('deactivate', name: 'my.app.counter');
  }

  /*
  * 当 State 对象从树中被永久移除时调用；通常在此回调中释放资源。
  * */
  @override
  void dispose() {
    super.dispose();
    developer.log('dispose', name: 'my.app.counter');
  }

  /*
  * 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在 Release 模式下永远不会被调用。
  * */
  @override
  void reassemble() {
    super.reassemble();
    developer.log('reassemble', name: 'my.app.counter');
  }

  /*
  * 当 State 对象的依赖发生变化时会被调用；例如：在之前 build() 中包含了一个 InheritedWidget ，
  * 然后在之后的 build() 中 InheritedWidget 发生了变化，那么此时 InheritedWidget 的子 widget 的 didChangeDependencies() 回调都会被调用。
  * 典型的场景是当系统语言 Locale 或应用主题改变时，Flutter 框架会通知 widget 调用此回调。
  * 需要注意，组件第一次被创建后挂载的时候（包括重创建）对应的 didChangeDependencies 也会被调用。
  * */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log('didChangeDependencies', name: 'my.app.counter');
  }
}
