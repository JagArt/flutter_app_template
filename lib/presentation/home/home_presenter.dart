import 'package:flutter_app_template/domain/interactors/rows/add_row_interactor.dart';
import 'package:flutter_app_template/domain/interactors/rows/get_rows_interactor.dart';
import 'package:rxdart/rxdart.dart';

import 'home_edit_model.dart';
import 'home_view.dart';

abstract class HomePresenter {
  void onAddClicked();

  void onDestroy();
}

class HomePresenterImpl implements HomePresenter {
  HomeView _view;

  GetRowsInteractor getRowsInteractor;
  AddRowInteractor addRowInteractor;

  HomePresenterImpl(this._view, this.getRowsInteractor, this.addRowInteractor) {
    subscribeToEditModelUpdates();
  }

  HomeEditModel _editModel = HomeEditModel.initial;
  CompositeSubscription compositeSubscription = CompositeSubscription();

  @override
  void onAddClicked() {
    addRowInteractor.addRow("123");
  }

  void subscribeToEditModelUpdates() {
    void listen(List<String> items) {
      print("size test " + items.length.toString());
      _editModel.items = items;
      _notifyEditModelUpdate();
    }

    var sub = getRowsInteractor.get().listen((items) => listen(items));
    compositeSubscription.add(sub);
  }

  void _notifyEditModelUpdate() {
    var state =
        HomeViewState(quantity: _editModel.counter, items: _editModel.items);

    _view.renderState(state);
  }

  @override
  void onDestroy() {
    _view = null;

    compositeSubscription.dispose();
  }
}
