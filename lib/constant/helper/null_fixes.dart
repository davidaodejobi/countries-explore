import 'package:flutter/material.dart';

extension NullFixWidget on Widget? {
  Widget get fixWidget {
    if (this == null) {
      return const SizedBox.shrink();
    }
    return this!;
  }
}
