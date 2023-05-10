import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration delay;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 300)});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(delay, action);
  }
}
