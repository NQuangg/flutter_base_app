import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  /// Giữ cho trạng thái của widget child không bị thay đổi
  /// Dùng để wrap widget child của PageView
  const KeepAliveWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
