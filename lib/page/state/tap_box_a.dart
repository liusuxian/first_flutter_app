import 'package:flutter/material.dart';

// TapBoxA 管理自身状态.
// ------------------------- TapBoxA ----------------------------------
class TapBoxAWidget extends StatefulWidget {
  const TapBoxAWidget({super.key});

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
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
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
    );
  }
}
