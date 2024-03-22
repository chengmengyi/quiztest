import 'package:event_bus/event_bus.dart';

class EventBusUtil{
  static EventBus? _eventBus;

  static EventBus? getInstance() {
    _eventBus ??= EventBus();
    return _eventBus;
  }
}

class EventCode{
  static const updateHeartNum=0;
  static const updateCoinNum=1;
  static const updateHomeTaskList=2;
}

class EventData{
  int code;
  EventData({required this.code});

  send() {
    EventBusUtil.getInstance()?.fire(this);
  }
}