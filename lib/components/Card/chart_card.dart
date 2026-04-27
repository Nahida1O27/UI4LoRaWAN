//数据展示的卡片，可放置图表组件等
import 'package:flutter/material.dart';
import 'package:lorawan/components/Card/card_base.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as Math;

//放置折线图的卡片
class ChartCard extends CardBase {
  const ChartCard({super.key, required super.title, super.onRefresh});
  @override
  List<Widget> buildCardContent(BuildContext context) {
    //先放一个y=e^x(-5<x<5)的图，后续再完善
    return [
      SizedBox(
        height: 500,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(100, (index) {
                  double x = index / 10 - 5;
                  return FlSpot(x, Math.exp(x));
                }),
                isCurved: true,
                barWidth: 1,
                color: Colors.blue,
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
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
    return [Container()];
  }
}
