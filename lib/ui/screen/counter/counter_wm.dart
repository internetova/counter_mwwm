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
  final decrementAction = VoidAction();

  @override
  void onLoad() {
    _getCounter();

    super.onLoad();
  }

  @override
  void onBind() {
    subscribe(incrementAction.stream, _onIncrementAction);
    subscribe(decrementAction.stream, _onDecrementAction);

    super.onBind();
  }

  /// загрузить значение счётчика из хранилища
  /// используем при старте
  void _getCounter() {
    counterState.accept(interactor.getCounter());
  }

  /// обрабатываем нажатие Увеличить
  void _onIncrementAction(_) {
    int currentValue = interactor.getCounter();
    _changeCounter(currentValue, isIncrement: true);
  }

  /// обрабатываем нажатие Уменьшить
  void _onDecrementAction(_) {
    int currentValue = interactor.getCounter();

    if (currentValue == 0) return;

    _changeCounter(currentValue, isIncrement: false);
  }

  /// меняем значение счетчика
  void _changeCounter(int value, {required bool isIncrement}) {
    int currentValue = isIncrement ? value + 1 : value - 1;

    counterState.accept(currentValue);
    interactor.setCounter(currentValue);
  }
}
