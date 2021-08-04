/// имитация локального хранилища для сохранения данных
class LocalRepository {
  LocalRepository();

  static int _counterValue = 4;

  int get counter => _counterValue;

  set value(int value) => _counterValue = value;
}
