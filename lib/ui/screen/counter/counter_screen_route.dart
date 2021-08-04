import 'package:counter_mwwm/interactor/counter_interactor.dart';
import 'package:counter_mwwm/ui/screen/counter/counter_screen.dart';
import 'package:counter_mwwm/ui/screen/counter/counter_wm.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';


/// маршрут для перехода на экран [CounterScreen]
/// в момент перехода создаём виджет-модель для этого экрана
class CounterScreenRoute extends MaterialPageRoute {
  CounterScreenRoute()
      : super(
          builder: (context) => CounterScreen(
            widgetModelBuilder: _widgetModelBuilder,
          ),
        );
}

CounterWidgetModel _widgetModelBuilder(BuildContext context) =>
    CounterWidgetModel(
      WidgetModelDependencies(),
      context.read<CounterInteractor>(),
    );
