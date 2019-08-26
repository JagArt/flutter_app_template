import 'package:rxdart/rxdart.dart';

abstract class GetRowsInteractor {
  Observable<String> get();
}

class GetRowsInteractorImpl implements GetRowsInteractor {
  @override
  Observable<String> get() {
    return Observable.fromIterable(List<String>.from(['a', 'b', 'c']));
  }
}
