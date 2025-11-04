import 'package:flutter/material.dart';

// ParentWidget 为 TapBoxB 管理状态.
// ------------------------ ParentWidget --------------------------------
class ParentTapBoxCWidget extends StatefulWidget {
  const ParentTapBoxCWidget({super.key});

  @override
  State<ParentTapBoxCWidget> createState() => _ParentTapBoxCWidgetState();
}

class _ParentTapBoxCWidgetState extends State<ParentTapBoxCWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxCWidget(active: _active, onChanged: _handleTapBoxChanged);
  }
}

// ------------------------- TapBoxC ----------------------------------
class TapBoxCWidget extends StatefulWidget {
  const TapBoxCWidget({
    super.key,
    this.title = "混合状态管理",
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
    this.active = false,
    required this.onChanged,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapBoxCWidget> createState() => _TapBoxCWidgetState();
}

class _TapBoxCWidgetState extends State<TapBoxCWidget> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
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
        child: GestureDetector(
          // 处理按下事件
          onTapDown: _handleTapDown,
          // 处理抬起事件
          onTapUp: _handleTapUp,
          onTap: _handleTap,
          onTapCancel: _handleTapCancel,
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _highlight
                  ? Border.all(color: Colors.teal[700]!, width: 10.0)
                  : null,
            ),
            child: Center(
              child: Text(
                widget.active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
