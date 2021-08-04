import 'package:counter_mwwm/interactor/counter_interactor.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

/// Виджет-модель для экрана [CounterScreen]
class CounterWidgetModel extends WidgetModel {
  final CounterInteractor interactor;

  CounterWidgetModel(WidgetModelDependencies baseDependencies, this.interactor)
      : super(baseDependencies);

  /// СОСТОЯНИЯ
  /// -------------------------
  /// состояние счетчика
  final counterState = StreamedState<int>(0);

  /// СОБЫТИЯ
  /// -------------------------
  /// клик по кнопкам Увеличить / Уменьшить
  final incrementAction = VoidAction();

  // final decrementAction = VoidAction();

  @override
  void onLoad() {
    _getCounter();

    super.onLoad();
  }

  @override
  void onBind() {
    subscribe(incrementAction.stream, _onIncrementAction);
    // subscribe(incrementAction.stream, _onDecrementAction);

    super.onBind();
  }

  /// загрузить значение счётчика из хранилища
  /// используем при старте
  void _getCounter() {
    counterState.accept(interactor.getCounter());
  }

  void _onIncrementAction(_) {
    int currentValue = interactor.getCounter();

    counterState.accept(currentValue + 1);
    interactor.setCounter(currentValue + 1);

    print('------onIncrement: currentValue - ${currentValue + 1}');
  }

  void _onDecrementAction(_) {
    int currentValue = interactor.getCounter();

    if (currentValue == 0) return;

    counterState.accept(currentValue - 1);
    interactor.setCounter(currentValue - 1);

    print('------onDecrement: currentValue - ${currentValue - 1}');
  }
}
