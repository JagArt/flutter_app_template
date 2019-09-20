import 'package:rxdart/rxdart.dart';

abstract class RowsRepository {
  void save(String row);

  List<String> get();

  Observable<List<String>> getWithUpdates();
}

class RowsRepositoryImpl implements RowsRepository {
  final subject = BehaviorSubject<bool>();

  List<String> _cache = <String>[];

  @override
  void save(String row) {
    _cache.add(row);
    subject.add(true);
  }

  @override
  List<String> get() {
    return List.of(_cache);
  }

  @override
  Observable<List<String>> getWithUpdates() {
    return subject.map((b) => get());
  }
}
