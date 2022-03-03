import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  const SimpleTimeSeriesChart(this.seriesList,
      {Key? key, required this.animate})
      : super();

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2017, 1, 19), 5),
      TimeSeriesSales(DateTime(2017, 3, 26), 25),
      TimeSeriesSales(DateTime(2017, 6, 3), 50),
      TimeSeriesSales(DateTime(2017, 11, 10), 90),
      TimeSeriesSales(DateTime(2018, 5, 19), 30),
      TimeSeriesSales(DateTime(2018, 6, 26), 55),
      TimeSeriesSales(DateTime(2018, 10, 3), 40),
      TimeSeriesSales(DateTime(2018, 12, 10), 60),
      TimeSeriesSales(DateTime(2019, 8, 19), 25),
      TimeSeriesSales(DateTime(2019, 9, 26), 40),
      TimeSeriesSales(DateTime(2019, 10, 3), 60),
      TimeSeriesSales(DateTime(2019, 11, 10), 50),
      TimeSeriesSales(DateTime(2020, 4, 19), 25),
      TimeSeriesSales(DateTime(2020, 6, 26), 20),
      TimeSeriesSales(DateTime(2020, 10, 3), 30),
      TimeSeriesSales(DateTime(2020, 11, 10), 30),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
