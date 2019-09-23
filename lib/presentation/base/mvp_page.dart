import 'package:flutter/material.dart';
import 'package:flutter_app_template/presentation/di/injection.dart';

import 'mvp_presenter.dart';
import 'mvp_view.dart';

abstract class MvpPage<S, P extends MvpPresenter> extends StatefulWidget {
  final Provider provider;
  final String title;

  MvpPage({Key key, this.title, this.provider}) : super(key: key);

  MvpPageState<S, P> createPageState(Provider provider);

  @override
  MvpPageState<S, P> createState() => createPageState(provider);
}

abstract class MvpPageState<S, P extends MvpPresenter> extends State<MvpPage> implements MvpView<S> {
  S state;
  P presenter;

  MvpPageState(Provider provider, S s) {
    presenter = createPresenter(provider);
    state = s;
  }

  P createPresenter(Provider provider);

  @override
  void renderState(S state) {
    setState(() {
      this.state = state;
    });
  }

  @override
  void dispose() {
    presenter.onDestroy();
    super.dispose();
  }
}