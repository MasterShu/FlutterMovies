import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterLocal {
  int _value;
  int get value => _value;

  Future<void> getLocalValue() async{
    try {
      final file = await _initFile;
      String counter = await file.readAsString();
      _value = int.parse(counter);
    } catch(e) {
      _value = 0;
    }
  }

  Future<void> increment() async {
    _value++;
    final file = await _initFile;
    await file.writeAsString('$_value');
  }

  Future<File> get _initFile async{
    final tempDirectory = await getTemporaryDirectory();
    final path = tempDirectory.path;
    return File('$path/counterLocal.txt');
  }
}
