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
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
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
    );
  }
}
