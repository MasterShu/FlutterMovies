import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/todo_list/todolist.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget.dart';

void main() {
  testWidgets("TodoList test: Add and remove a todo", (WidgetTester tester) async {
    await tester.pumpWidget(MockWidget().createWidget(child: TodoList()));

    await tester.enterText(find.byType(TextField), 'first');

    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget with the new item.
    await tester.pump();

    expect(find.text('first'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    expect(find.text('first'), findsNothing);

  });
}
