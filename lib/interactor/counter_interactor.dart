import 'package:counter_mwwm/repository/local_repository.dart';

/// интерактор для работы со значением счетчика
class CounterInteractor {
  final LocalRepository repository;

  CounterInteractor(this.repository);

  // получить текущее значение
  int getCounter() => repository.counter;

  // записать новое значение
  void setCounter(int value) => repository.value = value;
}