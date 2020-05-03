import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/app.dart';
import 'package:mobileapp/screens/home/settings.dart';

class Birthday extends StatefulWidget{
  @override
  _Birthday createState() => _Birthday();
}

class _Birthday extends State<Birthday> {
  DateTime _dateTime;
  // dates
  List<int> _dates = getDates();
  List<DropdownMenuItem<int>> _dropDownMenudates;
  int _selectedDate;
  // months
  List<String> _months = getMonths();
  List<DropdownMenuItem<String>> _dropDownMenuMonths;
  String _selectedMonth;
  // year
  List<int> _years = getYears();
  List<DropdownMenuItem<int>> _dropDownMenuYears;
  int _selectedYear;

  onChangeDropdownDate(int selectedInt) {
    setState(() {
      _selectedDate = selectedInt;
    });
  }

  onChangeDropdownYear(int selectedYear) {
    setState(() {
      _selectedYear = selectedYear;
    });
  }


  onChangeDropdownMonth(String selectedMonth) {
    setState(() {
      _selectedMonth = selectedMonth;
    });
  }

  @override
  void initState() {
    // dates
    _dropDownMenudates = buildDates(_dates);
    _selectedDate = _dropDownMenudates[0].value;
    // months
    _dropDownMenuMonths = buildMonthes(_months);
    _selectedMonth = _dropDownMenuMonths[0].value;
    // years
    _dropDownMenuYears = buildYears(_years);
    _selectedYear = _dropDownMenuYears[0].value;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text("What's your birthday?", style: TextStyle(fontFamily: "Comfortaa", fontSize: 30.0),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                ),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      DropdownButton(
                        value: _selectedDate,
                        items: _dropDownMenudates,
                        onChanged: onChangeDropdownDate,
                      ),
                      Text("Date", style: TextStyle(fontFamily: "Comfortaa", fontSize: 15.0),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      DropdownButton(
                        value: _selectedMonth,
                        items: _dropDownMenuMonths,
                        onChanged: onChangeDropdownMonth,
                      ),
                      Text("Month", style: TextStyle(fontFamily: "Comfortaa", fontSize: 15.0),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      DropdownButton(
                        value: _selectedYear,
                        items: _dropDownMenuYears,
                        onChanged: onChangeDropdownYear,
                      ),
                      Text("Year", style: TextStyle(fontFamily: "Comfortaa", fontSize: 15.0),),
                    ],
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: 100,
                child: RaisedButton(
                  child: Text("Or choose a date.", style: TextStyle(fontFamily: "Comfortaa",
                      fontSize: 15.0,
                      color: Colors.white),),
                  color: Color(0xFF19647E),
                  splashColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    showDatePicker(context: context,
                        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now()).then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                          onChangeDropdownMonth(findMonth(date.month));
                          onChangeDropdownDate(date.day);
                          onChangeDropdownYear(date.year);
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App()),
                  );
                },
                icon: Icon(Icons.check_circle, size: 30, color: Color(0xFF19647E)),
                highlightColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> buildDates(List<int> dates) {
    List<DropdownMenuItem<int>> items = List();
    for (int num in dates) {
      items.add(DropdownMenuItem(
        value: num,
        child: Text(num.toString()),
      ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> buildMonthes(List<String> months) {
    List<DropdownMenuItem<String>> items = List();
    for (String month in months) {
      items.add(DropdownMenuItem(
        value: month,
        child: Text(month),
      ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<int>> buildYears(List<int> years) {
    List<DropdownMenuItem<int>> items = List();
    for (int num in years) {
      items.add(DropdownMenuItem(
        value: num,
        child: Text(num.toString()),
      ),
      );
    }
    return items;
  }

  static List<int> getDates() {
    List<int> years = List.generate(31, (i) => i + 1);
    return years;
  }

  static List<String> getMonths() {
    return <String> [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "November",
      "October",
      "December"
    ];
  }

  static List<int> getYears() {
    List<int> years = List.generate(100, (i) => i + 1920);
    return years;
  }

  String findMonth(int month) {
    switch (month) {
      case 1: return "January";
      case 2: return "February";
      case 3: return "March";
      case 4: return "April";
      case 5: return "May";
      case 6: return "June";
      case 7: return "July";
      case 8: return "August";
      case 9: return "September";
      case 10: return "October";
      case 11: return "November";
      case 12: return "December";
    }
    return "January";
  }
}