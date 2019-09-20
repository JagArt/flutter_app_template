class HomeEditModel {
  int counter;
  List<String> items;

  HomeEditModel({this.counter, this.items});

  static HomeEditModel initial = HomeEditModel(counter: 0, items: <String>[]);
}