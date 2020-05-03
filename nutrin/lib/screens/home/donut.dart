import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesDonut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff19647E),
            value: 1200/1800,
            title: '1200',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.w200, fontFamily: "Comfortaa", color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff119DA4),
            value: 600/1800,
            title: '600',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.w200, fontFamily: "Comfortaa", color: const Color(0xffffffff)),
          );
//        case 2:
//          return PieChartSectionData(
//            color: const Color(0xff845bef),
//            value: 15,
//            title: '15%',
//            radius: radius,
//            titleStyle: TextStyle(
//                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
//          );
//        case 3:
//          return PieChartSectionData(
//            color: const Color(0xff13d38e),
//            value: 15,
//            title: '15%',
//            radius: radius,
//            titleStyle: TextStyle(
//                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
//          );
        default:
          return null;
      }
    });
  }
}