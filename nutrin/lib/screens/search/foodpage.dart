import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/tracked_food.dart';
import 'package:flutter/services.dart';

class FoodPage extends StatefulWidget {
  final String mealName;
  final TrackedFood food;

  FoodPage(this.mealName, this.food);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    int nutrients = 3;
    final _foodFormKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF3C7A89)),
        title: Text(
          'Add Food',
          style: TextStyle(color: Color(0xFF3C7A89)),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFF3C7A89),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            textMacros("Carbohydrates",
                                widget.food.carbohydrates + " g"),
                            textMacros("Protein", widget.food.protein + " g"),
                            textMacros("Fat", widget.food.fat + " g"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: _foodFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              servings(
                                  "Number of Servings",
                                  TextEditingController(
                                      text: widget.food.serving)),
                              servingSize("Serving Size"),
                              GestureDetector(
                                child: Icon(Icons.check, color: Colors.white),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 2,
              child: SizedBox.expand(
                child: DraggableScrollableSheet(
                  minChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.food.name,
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Percent Daily Goals',
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.grey[200]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Nutritional Facts',
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.grey[200]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textMacros(String text, String macro) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold),
        ),
        Text(
          macro,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget servingSize(String text) {
    var dropDownValue = "g";
    var dropDownValues = ["g", "cups", "mL"];
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold),
        ),
        DropdownButton(
          underline: Container(
            color: Theme.of(context).primaryColor,
          ),
          dropdownColor: Color(0xFF3C7A89),
          iconDisabledColor: Colors.white,
          value: dropDownValue,
          onChanged: (String unit) {
            dropDownValue = unit;
            print(dropDownValue);
          },
          items: dropDownValues.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget servings(String text, TextEditingController servingsController) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: 50,
          child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            cursorColor: Colors.white,
            controller: servingsController,
          ),
        )
      ],
    );
  }
}
