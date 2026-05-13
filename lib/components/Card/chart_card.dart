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
        //如果title为湿度变化，显示数据[60.0,54.0,58.0,58.0,57.0,56.0,55.0,54.0,54.0,52.0,54.0]
        //如果title为温度变化，显示数据[29.0,29.0,27.0,27.0,28.0,28.0,29.0,29.0,28.0,28.0,29.0]
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: title == "湿度变化"
                    ? [
                        FlSpot(0, 60.0),
                        FlSpot(1, 54.0),
                        FlSpot(2, 58.0),
                        FlSpot(3, 58.0),
                        FlSpot(4, 57.0),
                        FlSpot(5, 56.0),
                        FlSpot(6, 55.0),
                        FlSpot(7, 54.0),
                        FlSpot(8, 54.0),
                        FlSpot(9, 52.0),
                        FlSpot(10, 54.0),
                      ]
                    : [
                        FlSpot(0, 29.0),
                        FlSpot(1, 29.0),
                        FlSpot(2, 27.0),
                        FlSpot(3, 27.0),
                        FlSpot(4, 28.0),
                        FlSpot(5, 28.0),
                        FlSpot(6, 29.0),
                        FlSpot(7, 29.0),
                        FlSpot(8, 28.0),
                        FlSpot(9, 28.0),
                        FlSpot(10, 29.0),
                      ],
                isCurved: false, //是否平滑曲线
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
          DataColumn(label: Text("时间")),
          DataColumn(label: Text("湿度(%)")),
          DataColumn(label: Text("温度(℃)")),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(Text("2026-05-12 12:00")),
              DataCell(Text("54.0")),
              DataCell(Text("29.0")),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("2026-05-12 12:01")),
              DataCell(Text("52.0")),
              DataCell(Text("28.0")),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("2026-05-12 12:02")),
              DataCell(Text("54.0")),
              DataCell(Text("28.0")),
            ],
          ),
        ],
      ),
    ];
  }
}
