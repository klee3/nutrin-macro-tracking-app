import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';

class MacroDonut extends StatefulWidget {
  final double carbs;
  final double protein;
  final double fat;
  final TrackedFood food;

  MacroDonut({Key key, @required this.carbs, this.protein, this.fat, this.food}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State(food: food, carbs: carbs, protein: protein, fat: fat);
}

class PieChart2State extends State {
  final double carbs;
  final double protein;
  final double fat;
  final TrackedFood food;
  int touchedIndex;

  PieChart2State({Key key, @required this.carbs, this.protein, this.fat, this.food});

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
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff19647E),
            value: carbs / (carbs + protein + fat),
            title: food.toMap()['carbohydrates'].toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.w200, fontFamily: "Comfortaa",
                color:
//                carbs.toString() == "0" ?
                Colors.transparent
//                    : const Color(0xffffffff)
                    ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff119DA4),
            value: protein / (carbs + protein + fat),
            title: food.toMap()['protein'].toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.w200, fontFamily: "Comfortaa",
                color:
//                protein.toString() == "0" ?
                Colors.transparent
//                    : const Color(0xffffffff)
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: fat / (carbs + protein + fat),
            title: food.toMap()['fat'].toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.w200,
                color:
//                fat.toString() == "0" ?
                Colors.transparent
//                    : const Color(0xffffffff)
            ),
          );
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