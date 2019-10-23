import 'package:flutter/cupertino.dart';
import 'package:flutter_movies/demo/counter/counterModel.dart';
import 'package:flutter_movies/demo/counter/counterProView.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../widget.dart';

void main() {
  testWidgets('Counter Provider widget: increment counter', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider<CounterModel>.value(
      value: CounterModel(),
      child: MockWidget().createWidget(child: CounterProView()),
    ));

    final textKey = Key('counter');

    expect(find.byKey(textKey), findsOneWidget);

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(Key('increment')));

    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

  });
}
