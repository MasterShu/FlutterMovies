
import 'package:flutter_movies/movies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Movies widget has a title and description", (WidgetTester tester) async {
    await tester.pumpWidget(Movies(title: "One Piece", description: "The romatic of sea",));
    final titleFinder = find.text("One Piece");
    final descFinder = find.text("The romatic of sea");

    expect(titleFinder, findsOneWidget);
    expect(descFinder, findsOneWidget);
  });
}
