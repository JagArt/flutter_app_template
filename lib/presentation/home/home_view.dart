import 'package:flutter_app_template/presentation/base/mvp_view.dart';

abstract class HomeView implements MvpView<HomeViewState> {

}

class HomeViewState {
  List<String> items;
  int quantity = 0;

  HomeViewState({this.quantity, this.items});

  static HomeViewState initial =
      HomeViewState(quantity: 0, items: List(0));
}