import 'package:flutter_app_template/domain/gateways/repositories/rows_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class GetRowsInteractor {
  Observable<List<String>> get();
}

class GetRowsInteractorImpl implements GetRowsInteractor {
  RowsRepository rowsRepository;

  GetRowsInteractorImpl(this.rowsRepository);

  @override
  Observable<List<String>> get() {
    return rowsRepository.getWithUpdates();
  }
}
