import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/counter/counterLocalView.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';

import '../widget.dart';

/// Because of this test used of io operation, so you need run this test use true.
/// such as this command.
/// flutter run test/demo/counter_local_test.dart
void main() {

  testWidgets('Counter with local file storage', (WidgetTester tester) async {
    await tester.pumpWidget(MockWidget().createWidget(child: CounterLocalView()));

    await restCounter();

    await tester.pumpAndSettle();
    var incrementBtn =find.byKey(Key('increment'));
    expect(incrementBtn, findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    await tester.tap(incrementBtn);

    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
  });
}

Future restCounter() async {
  final path = (await getTemporaryDirectory()).path;
  final file = File('$path/counterLocal.txt');
  await file.writeAsString('0');
}
