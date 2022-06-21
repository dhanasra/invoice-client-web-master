import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: borderColor,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: borderColor,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: SideTitles(
                  showTitles: false
              ),
              rightTitles: SideTitles(
                  showTitles: false
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                margin: 12,
                interval: 1,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '15/21';
                    case 2:
                      return '16/21';
                    case 3:
                      return '17/21';
                    case 4:
                      return '18/21';
                    case 5:
                      return '19/21';
                    case 6:
                      return '20/21';
                    case 7:
                      return '21/21';
                  }
                  return '';
                },
              ),
              leftTitles: SideTitles(
                interval: 100,
                showTitles: true,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 200:
                      return '200';
                    case 400:
                      return '400';
                    case 600:
                      return '600';
                    case 800:
                      return '800';
                    case 1000:
                      return '1000';
                  }
                  return '';
                },
                reservedSize: 50,
                margin: 12,
              ),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                      color: promptColor
                  ),
                )
            ),
            minX: 0,
            maxX: 7,
            minY: 0,
            maxY: 1000,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 100),
                  FlSpot(1, 200),
                  FlSpot(2, 300),
                  FlSpot(3, 400),
                  FlSpot(4, 500),
                ],
                isCurved: true,
                barWidth: 2,
                isStrokeCapRound: true,
              ),
            ],
          )
    );
  }
}
