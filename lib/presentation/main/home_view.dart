abstract class MainView {
  void renderState(MainViewState state);
}

class MainViewState{
  List<String> items;

  MainViewState(this.items);
}