import 'package:flutter_app_template/domain/gateways/repositories/rows_repository.dart';

abstract class AddRowInteractor {
  void addRow(String row);
}

class AddRowInteractorImpl implements AddRowInteractor {
  RowsRepository rowsRepository;

  AddRowInteractorImpl(this.rowsRepository);

  @override
  void addRow(String row) {
    rowsRepository.save(row);
  }
}
