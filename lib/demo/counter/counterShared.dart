import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedModel{
  int _value = 0;
  int get value => _value;
  static SharedPreferences _preferences;

  Future<void> getValue() async {
    _preferences = await SharedPreferences.getInstance();
    _value = (_preferences.getInt('counter') ?? 0);
  }

  Future<void> increment() async {
    _preferences = await SharedPreferences.getInstance();
    _value++;
    _preferences.setInt('counter', _value);
  }

}
