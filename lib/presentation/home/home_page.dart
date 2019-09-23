import 'package:flutter/material.dart';
import 'package:flutter_app_template/presentation/base/mvp_page.dart';
import 'package:flutter_app_template/presentation/di/injection.dart';
import 'home_view.dart';

import 'home_presenter.dart';

class HomePage extends MvpPage<HomeViewState, HomePresenter> {
  HomePage({Key key, String title, Provider provider})
      : super(key: key, title: title, provider: provider);

  @override
  _HomePageState createPageState(
          Provider provider) {
    return _HomePageState(provider, HomeViewState.initial);
  }
}

class _HomePageState extends MvpPageState<HomeViewState, HomePresenter>
    implements HomeView {
  _HomePageState(Provider provider, HomeViewState state) : super(provider, state);

  @override
  HomePresenter createPresenter(Provider provider) => HomePresenterImpl(
      this, provider.getRowsInteractor(), provider.addRowInteractor());

  @override
  Widget build(BuildContext context) {
    var list = state.items
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
        onPressed: presenter.onAddClicked,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
