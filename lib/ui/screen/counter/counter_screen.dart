import 'package:counter_mwwm/ui/screen/counter/counter_wm.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

/// экран CounterScreen
class CounterScreen extends CoreMwwmWidget<CounterWidgetModel> {
  CounterScreen({
    required WidgetModelBuilder<CounterWidgetModel> widgetModelBuilder,
  }) : super(widgetModelBuilder: widgetModelBuilder);

  @override
  WidgetState<CounterScreen, CounterWidgetModel> createWidgetState() =>
      _CounterScreenState();
}

class _CounterScreenState
    extends WidgetState<CounterScreen, CounterWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Тут будет счетчик',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
