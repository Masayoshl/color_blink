import 'package:color_blink/app.dart';
import 'package:color_blink/app/di/dependency_scope.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const DependencyScope(
      child: App(),
    ),
  );
}
