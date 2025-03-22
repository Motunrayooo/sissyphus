import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// class CandleStickChart extends StatefulWidget {
//   @override
//   _CandleStickChartState createState() => _CandleStickChartState();
// }
//
// class _CandleStickChartState extends State<CandleStickChart> {
//   List<ChartData> chartData = [
//     ChartData(DateTime(2022, 3, 1), 36400, 36600, 36300, 36550, 65000),
//     ChartData(DateTime(2022, 3, 2), 36550, 36800, 36450, 36650, 54000),
//     ChartData(DateTime(2022, 3, 3), 36650, 37000, 36500, 36850, 72000),
//     ChartData(DateTime(2022, 3, 4), 36850, 36900, 36600, 36750, 68000),
//     ChartData(DateTime(2022, 3, 5), 36750, 37200, 36650, 37050, 75000),
//     ChartData(DateTime(2022, 3, 6), 37050, 37400, 36900, 37250, 82000),
//     ChartData(DateTime(2022, 3, 7), 37250, 37450, 37000, 37150, 79000),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SfCartesianChart(
//           backgroundColor: Colors.black,
//           primaryXAxis: DateTimeAxis(
//             edgeLabelPlacement: EdgeLabelPlacement.shift,
//             intervalType: DateTimeIntervalType.days,
//             dateFormat: DateFormat.Md(),
//             axisLine: AxisLine(width: 0),
//             majorGridLines: MajorGridLines(width: 0),
//             labelStyle: TextStyle(color: Colors.white),
//           ),
//           primaryYAxis: NumericAxis(
//             opposedPosition: true,
//             labelStyle: TextStyle(color: Colors.white),
//             majorGridLines: MajorGridLines(width: 0),
//             axisLine: AxisLine(width: 0),
//           ),
//           series: <CartesianSeries>[
//             // Candlestick Series
//             CandleSeries<ChartData, DateTime>(
//               dataSource: chartData,
//               xValueMapper: (ChartData data, _) => data.time,
//               lowValueMapper: (ChartData data, _) => data.low,
//               highValueMapper: (ChartData data, _) => data.high,
//               openValueMapper: (ChartData data, _) => data.open,
//               closeValueMapper: (ChartData data, _) => data.close,
//               enableSolidCandles: true,
//               bullColor: Colors.green,
//               bearColor: Colors.red,
//             ),
//
//             // Volume Bar Chart (Using Column Series)
//             ColumnSeries<ChartData, DateTime>(
//               dataSource: chartData,
//               xValueMapper: (ChartData data, _) => data.time,
//               yValueMapper: (ChartData data, _) => data.volume,
//               color: Colors.orangeAccent,
//             ),
//           ],
//           crosshairBehavior: CrosshairBehavior(
//             enable: true,
//             lineType: CrosshairLineType.both,
//             lineColor: Colors.white,
//             lineDashArray: [5, 5],
//           ),
//           trackballBehavior: TrackballBehavior(
//             enable: true,
//             activationMode: ActivationMode.singleTap,
//             tooltipSettings: InteractiveTooltip(
//               color: Colors.grey[800],
//               format: 'point.x : point.y',
//               textStyle: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ChartData {
//   final DateTime time;
//   final double open;
//   final double high;
//   final double low;
//   final double close;
//   final int volume;
//
//   ChartData(this.time, this.open, this.high, this.low, this.close, this.volume);
// }

class CandleStickChart extends StatefulWidget {
  const CandleStickChart({super.key});

  @override
  State<CandleStickChart> createState() => _CandleStickChartState();
}

class _CandleStickChartState extends State<CandleStickChart> {
  late List<ChartSampleData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <CandleSeries>[
        CandleSeries<ChartSampleData, DateTime>(
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          lowValueMapper: (ChartSampleData sales, _) => sales.low,
          highValueMapper: (ChartSampleData sales, _) => sales.high,
          openValueMapper: (ChartSampleData sales, _) => sales.open,
          closeValueMapper: (ChartSampleData sales, _) => sales.close,
          dataSource: _chartData,
        ),
      ],
      primaryYAxis: const NumericAxis(
        minimum: 0,
        maximum: 36400.0,
      ),
      primaryXAxis: const DateTimeAxis(
       majorGridLines: MajorGridLines(width: 0,),
      ),
    );
  }

  List<ChartSampleData> getChartData() {
    return <ChartSampleData>[
      // ChartSampleData(
      //   x: DateTime(2024, 01, 18),
      //   open: 92.39,
      //   high: 95.43,
      //   low: 91.65,
      //   close: 95.22,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 01, 26),
      //   open: 95.87,
      //   high: 100.73,
      //   low: 96.63,
      //   close: 100.35
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 02, 10),
      //   open: 99.6,
      //   high: 100.4,
      //   low: 96.63,
      //   close: 97.92,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 03, 1),
      //   open: 106.1,
      //   high: 110.66,
      //   low: 107.43,
      //   close: 109.82,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 03, 29),
      //   open: 110,
      //   high: 114.7,
      //   low: 108.25,
      //   close: 113.95,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 04, 10),
      //   open: 113.29,
      //   high: 116.73,
      //   low: 112.49,
      //   close: 115.97,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 05, 18),
      //   open: 115.8,
      //   high: 117.5,
      //   low: 115.59,
      //   close: 116.52,
      // ),
      // ChartSampleData(
      //   x: DateTime(2024, 06, 5),
      //   open: 116.52,
      //   high: 118.0166,
      //   low: 115.43,
      //   close: 115.82,
      // ),

      ChartSampleData(
        x: DateTime(2022, 1, 10),
        open: 16400,
        high: 36600,
        low: 36300,
        close: 36550,
      ),
      ChartSampleData(
        x: DateTime(2022, 2, 23),
        open: 26550,
        high: 6800,
        low: 16450,
        close: 36650,
      ),
      ChartSampleData(
        x: DateTime(2022, 3, 13),
        open: 36650,
        high: 37000,
        low: 36500,
        close: 36850,
      ),
      ChartSampleData(
        x: DateTime(2022, 4, 1),
        open: 24850,
        high: 26900,
        low: 25600,
        close: 26750,
      ),
      ChartSampleData(
        x: DateTime(2022, 5, 15),
        open: 36750,
        high: 37200,
        low: 36650,
        close: 37050,
      ),
      ChartSampleData(
        x: DateTime(2022, 5, 26),
        open: 37050,
        high: 37400,
        low: 36900,
        close: 37250,
      ),
      ChartSampleData(
        x: DateTime(2022, 6, 7),
        open: 27250,
        high: 27450,
        low: 34000,
        close: 30150,
      ),
    ];
  }
}

class ChartSampleData {
  ChartSampleData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });

  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}
