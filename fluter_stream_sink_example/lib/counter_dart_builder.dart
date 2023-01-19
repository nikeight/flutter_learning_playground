import 'dart:async';

import 'package:fluter_stream_sink_example/counter_event.dart';

class CounterBlocBuilder {
  int _counter = 0;

  //** INPUT **//
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCount => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  //** OUTPUT **//
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBlocBuilder() {
    _counterEventController.stream.listen((event) {
      if (event is IncrementCounterEvent) {
        _counter++;
      } else {
        _counter--;
      }
      // Adding the updated item in the Sink
      // Is important Else it will not emit it
      _inCount.add(_counter);
    });
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
