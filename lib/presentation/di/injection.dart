import 'package:flutter_app_template/domain/gateways/repositories/rows_repository.dart';
import 'package:flutter_app_template/domain/interactors/rows/add_row_interactor.dart';
import 'package:flutter_app_template/domain/interactors/rows/get_rows_interactor.dart';

class Provider {
  RowsRepository _rowsRepository;

  RowsRepository rowsRepository() {
    if (_rowsRepository == null) _rowsRepository = RowsRepositoryImpl();

    return _rowsRepository;
  }

  GetRowsInteractor getRowsInteractor() {
    return GetRowsInteractorImpl(rowsRepository());
  }

  AddRowInteractor addRowInteractor() {
    return AddRowInteractorImpl(rowsRepository());
  }
}
