import 'package:flutter/material.dart';
import 'package:flutter_app_template/presentation/di/injection.dart';
import 'home_view.dart';

import 'home_presenter.dart';

class HomePage extends StatefulWidget {
  final Provider provider;
  final String title;

  HomePage({Key key, this.title, this.provider}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(provider);
}

class _HomePageState extends State<HomePage> implements HomeView {
  HomeViewState _state = HomeViewState.initial;
  HomePresenter _presenter;

  _HomePageState(Provider provider) {
    _presenter = HomePresenterImpl(
        this, provider.getRowsInteractor(), provider.addRowInteractor());
  }

  @override
  void renderState(HomeViewState state) {
    setState(() {
      _state = state;
    });
  }

  @override
  void dispose() {
    _presenter.onDestroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = _state.items
        .map((item) => ListTile(
              title: Text(item),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: list,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _presenter.onAddClicked,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
