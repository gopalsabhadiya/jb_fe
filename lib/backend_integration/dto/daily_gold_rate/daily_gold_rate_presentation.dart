import 'package:jb_fe/backend_integration/domain/entities/daily_gold_rate/daily_gold_rate.dart';

class DailyGoldRatePresentation {
  String? _id;
  late int _rate;
  int? _newRate;
  late DateTime _date;

  DailyGoldRatePresentation(DailyGoldRateEntity entity)
      : _id = entity.id,
        _rate = entity.rate,
        _newRate = entity.rate,
        _date = entity.date,
        super();

  DateTime get date => _date;

  int? get newRate => _newRate;

  int get rate => _rate;

  String? get id => _id;

  void setNewRate(String value) {
    _newRate = int.tryParse(value) ?? _newRate;
  }

  DailyGoldRatePresentation.empty()
      : _date = DateTime.now(),
        super();

  void updateValues() {
    _rate = _newRate ?? 0;
  }

  DailyGoldRateEntity getEntity() {
    return DailyGoldRateEntity(
      id: _id,
      rate: _rate,
      date: _date,
    );
  }

  @override
  String toString() {
    return 'DailyGoldRatePresentation{_id: $_id, _rate: $_rate, _newRate: $_newRate, _date: $_date}';
  }
}
