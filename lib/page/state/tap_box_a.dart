import 'package:flutter/material.dart';

// TapBoxA 管理自身状态.
// ------------------------- TapBoxA ----------------------------------
class TapBoxAWidget extends StatefulWidget {
  const TapBoxAWidget({
    super.key,
    this.title = "管理自身状态",
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blueAccent,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  State<TapBoxAWidget> createState() => _TapBoxAWidgetState();
}

class _TapBoxAWidgetState extends State<TapBoxAWidget> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
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
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
