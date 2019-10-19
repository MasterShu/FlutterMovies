import 'package:flutter_movies/api/dio.dart';
import 'package:flutter_movies/api/hello.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Api {}

void main() {
  group('hello', () {
    test('sayHello', () async {
      final client = new MockClient();
      when(client.get("https://www.baidu.com"))
        .thenAnswer((_) async => '{"title": "hello"}');
      var hello = new Hello(client);
      var result = await hello.sayHello();
      print(result);
    });
  });
}
