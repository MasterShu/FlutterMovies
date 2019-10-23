import 'package:flutter/material.dart';

class MockWidget {
  Widget createWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
}
