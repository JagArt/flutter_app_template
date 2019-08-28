import 'package:flutter/material.dart';
import 'home_view.dart';

import 'home_presenter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView {
  HomeViewState _state = HomeViewState.initial;
  HomePresenter _presenter;

  _HomePageState() {
    _presenter = HomePresenterImpl(this);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_state.quantity}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _presenter.onAddClicked,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
