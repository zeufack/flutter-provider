import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debounce {
  final int millisecons;

  Debounce({
    this.millisecons = 500,
  });

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisecons), action);
  }
}
