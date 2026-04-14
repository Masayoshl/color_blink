import 'package:color_blink/features/home/ui/page/home_page.dart';

import 'package:flutter/material.dart';

/// The root widget of the application.
///
/// This widget configures the global [MaterialApp]
class App extends StatelessWidget {
  /// The root widget constructor of the application.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
