import 'package:rxdart/rxdart.dart';

abstract class MvpPresenter {
  void onDestroy();
}

class BaseMvpPresenter<V> implements MvpPresenter {
  V view;

  BaseMvpPresenter(this.view);

  CompositeSubscription compositeSubscription = CompositeSubscription();

  @override
  void onDestroy() {
    view = null;
    compositeSubscription.dispose();
  }
}