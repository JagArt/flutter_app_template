import 'package:flutter_app_template/domain/interactors/rows/add_row_interactor.dart';
import 'package:flutter_app_template/domain/interactors/rows/get_rows_interactor.dart';
import 'package:flutter_app_template/presentation/base/mvp_presenter.dart';

import 'home_edit_model.dart';
import 'home_view.dart';

abstract class HomePresenter implements MvpPresenter {
  void onAddClicked();
}

class HomePresenterImpl extends BaseMvpPresenter<HomeView> implements HomePresenter {

  GetRowsInteractor getRowsInteractor;
  AddRowInteractor addRowInteractor;

  HomePresenterImpl(HomeView view, this.getRowsInteractor, this.addRowInteractor) : super(view) {
    subscribeToEditModelUpdates();
  }

  HomeEditModel _editModel = HomeEditModel.initial;

  @override
  void onAddClicked() {
    addRowInteractor.addRow("123");
  }

  void subscribeToEditModelUpdates() {
    void listen(List<String> items) {
      _editModel.items = items;
      _notifyEditModelUpdate();
    }

    var sub = getRowsInteractor.get().listen((items) => listen(items));
    compositeSubscription.add(sub);
  }

  void _notifyEditModelUpdate() {
    var state = HomeViewState(quantity: _editModel.counter, items: _editModel.items);

    view.renderState(state);
  }
}
