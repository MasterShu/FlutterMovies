import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/demo/counter/counterSharedView.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Counter Shared preferences View：', () {
    // Because of SharedPreferences, need mock this in first.
    const MethodChannel channel = MethodChannel(
      'plugins.flutter.io/shared_preferences',
    );

    const Map<String, dynamic> kTestValues = <String, dynamic>{
    };

    final List<MethodCall> log = <MethodCall>[];
    SharedPreferences preferences;

    setUp(() async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        if (methodCall.method == 'getAll') {
          return kTestValues;
        }
        return null;
      });
      preferences = await SharedPreferences.getInstance();
    });

    tearDown(() {
      preferences.clear();
    });
    testWidgets('Ensure display text and increment button work normal.', (WidgetTester tester) async {
      await tester.pumpWidget(MockWidget().createWidget(child: CounterSharedView()));

      expect(find.text('0'), findsOneWidget);

      var incrementBtn = find.byKey(Key('increment'));
      expect(incrementBtn, findsOneWidget);

      await tester.tap(incrementBtn);

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
