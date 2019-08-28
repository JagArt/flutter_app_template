import 'home_edit_model.dart';
import 'home_view.dart';

abstract class HomePresenter {
  void onAddClicked();

  void onDestroy();
}

class HomePresenterImpl implements HomePresenter {
  HomeView _view;
  HomeEditModel _editModel = HomeEditModel.initial;

  HomePresenterImpl(this._view);

  @override
  void onAddClicked() {
    _editModel.counter++;

    _notifyEditModelUpdate();
  }

  void _notifyEditModelUpdate() {
    var state = HomeViewState(quantity: _editModel.counter);

    _view.renderState(state);
  }

  @override
  void onDestroy() {
    _view = null;
  }
}
