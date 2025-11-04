import 'package:flutter/material.dart';

// ParentWidget 为 TapBoxB 管理状态.
// ------------------------ ParentWidget --------------------------------
class ParentTapBoxBWidget extends StatefulWidget {
  const ParentTapBoxBWidget({super.key});

  @override
  State<ParentTapBoxBWidget> createState() => _ParentTapBoxBWidgetState();
}

class _ParentTapBoxBWidgetState extends State<ParentTapBoxBWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxBWidget(active: _active, onChanged: _handleTapBoxChanged);
  }
}

// ------------------------- TapBoxB ----------------------------------
class TapBoxBWidget extends StatelessWidget {
  const TapBoxBWidget({
    super.key,
    this.title = "父Widget管理子Widget的状态",
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

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: titleColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: backgroundColor,
        title: Text(title, style: TextStyle(color: titleColor)),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
