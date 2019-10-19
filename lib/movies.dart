import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  final String title;
  final String description;

  const Movies({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShiShiOU",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(description),
        ),
      ),
    );
  }

}
