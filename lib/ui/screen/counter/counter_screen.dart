import 'package:counter_mwwm/ui/component/round_button.dart';
import 'package:counter_mwwm/ui/screen/counter/counter_wm.dart';
import 'package:counter_mwwm/ui/screen/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

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
      appBar: AppBar(
        title: Text(AppStrings.counterAppBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BuildResult(wm.counterState),
          const SizedBox(height: 80),
          _BuildButtons(
            onIncrement: wm.incrementAction,
            onDecrement: () {},
            // onDecrement: wm.decrementAction,
          ),
        ],
      ),
    );
  }
}

/// результат кликов по кнопкам
class _BuildResult extends StatelessWidget {
  final StreamedState<int> state;

  const _BuildResult(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<int>(
        streamedState: state,
        builder: (_, value) {
          return Text(
            value.toString(),
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          );
        });
  }
}

/// кнопки увеличить уменьшить
class _BuildButtons extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _BuildButtons({
    Key? key,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundButton(
          size: 30,
          icon: Icons.add,
          onPressed: onIncrement,
        ),
        const SizedBox(width: 20),
        RoundButton(
          size: 30,
          icon: Icons.remove,
          onPressed: onDecrement,
        ),
      ],
    );
  }
}
