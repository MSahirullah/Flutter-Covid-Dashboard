import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid_dashboard/config/palette.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({Key? key, required this.covidCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: const Text('Daliy New Cases',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Palette.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 25.0),
              child: BarChart(
                BarChartData(
                  maxY: 16.0,
                  // minY: ,
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      rotateAngle: 35.0,
                        margin: 20.0,
                        showTitles: true,
                        getTextStyles:  (context, value) => const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        getTitles: (double value){
                          switch (value.toInt()){
                            case 0:
                              return 'Dec 24';
                            case 1:
                              return 'Dec 25';
                            case 2:
                              return 'Dec 26';
                            case 3:
                              return 'Dec 27';
                            case 4:
                              return 'Dec 28';
                            case 5:
                              return 'Dec 29';
                            case 6:
                              return 'Dec 30';
                          }
                          return '';
                        }
                    ),
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                    topTitles: SideTitles(
                      showTitles: false,
                    ),
                    leftTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      getTitles: (value){
                        if (value == 0){
                          return '0';
                        }
                        else if(value % 5 == 0){
                          return '${value ~/ 3 * 5}K';
                        }
                        return '';
                      }
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 3 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black12,
                      strokeWidth: 1.0,
                      dashArray: [5]
                    ),
                    getDrawingVerticalLine: (value) => FlLine(
                      color: Colors.white,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: covidCases.asMap().map((key, value) => MapEntry(
                    key,
                    BarChartGroupData(
                        x:key, barRods: [BarChartRodData(
                      y:value,
                      colors: [Colors.red],
                    )]
                    ),
                  ),).values.toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
