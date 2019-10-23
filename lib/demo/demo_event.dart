import 'package:event_bus/event_bus.dart';

class DemoEvent {
  factory DemoEvent() => _getInstance();
  static DemoEvent get instance => _getInstance();
  static DemoEvent _instance;
  EventBus eventBus;

  DemoEvent._internal() {
    if(null == eventBus) {
      eventBus = EventBus();
    }
  }

  static DemoEvent _getInstance() {
    if(null == _instance) {
      _instance = DemoEvent._internal();
    }
    return _instance;
  }
}

class BackClickEvent {
  String event;
  BackClickEvent(this.event);
}
