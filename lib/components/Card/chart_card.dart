//数据展示的卡片，可放置图表组件等
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/card_base.dart';
import 'package:fl_chart/fl_chart.dart';

//放置折线图的卡片
class ChartCard extends CardBase {
  const ChartCard({super.key, required super.title, super.onRefresh});
  @override
  List<Widget> buildCardContent(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.all(8),
        height: 200,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(11, (index) {
                  double x = index - 5;
                  return FlSpot(x, 2 * x);
                }),
                isCurved: true,
                barWidth: 3,
                color: Colors.blue,
              ),
            ],
            titlesData: FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
          ),
        ),
      ),
    ];
  }
}

//放置表格的卡片
class TableCard extends CardBase {
  const TableCard({super.key, required super.title});
  @override
  List<Widget> buildCardContent(BuildContext context) {
    return [
      DataTable(
        columns: [
          DataColumn(label: Text("列1")),
          DataColumn(label: Text("列2")),
          DataColumn(label: Text("列3")),
          DataColumn(label: Text("列4")),
          DataColumn(label: Text("列5")),
        ],
        rows: List.generate(10, (index) {
          return DataRow(
            cells: [
              DataCell(Text("行$index")),
              DataCell(Text("行$index")),
              DataCell(Text("行$index")),
              DataCell(Text("行$index")),
              DataCell(Text("行$index")),
            ],
          );
        }),
      ),
    ];
  }
}
