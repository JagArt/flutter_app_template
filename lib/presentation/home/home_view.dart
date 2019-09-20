abstract class HomeView {
  void renderState(HomeViewState state);
}

class HomeViewState {
  List<String> items;
  int quantity = 0;

  HomeViewState({this.quantity, this.items});

  static HomeViewState initial =
      HomeViewState(quantity: 0, items: List(0));
}