import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'Constants.dart';
import 'new_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weightvalue = 60;
  int agevalue = 20;
  void increase(int icon) {
    if (icon == 1) {
      weightvalue--;
    }
    if (icon == 2) {
      weightvalue++;
    }
  }

  void age(int age) {
    if (age == 1) {
      agevalue--;
    }
    if (age == 2) {
      agevalue++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor:
            Theme.of(context).primaryColor, // Ensure primary color is used
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardChild: Iconwidget(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: selectedGender == Gender.male
                          ? kActivecardcolor
                          : kInactivecardcolor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: Iconwidget(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: selectedGender == Gender.female
                          ? kActivecardcolor
                          : kInactivecardcolor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLlabelTextstyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kFontweight),
                        Text('cm')
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x30EB1555),
                      activeTrackColor:   Colors.white
                      ,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 140.0,
                        max: 200.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
              colour: kActivecardcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLlabelTextstyle),
                        Text(weightvalue.toString(), style: kFontweight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              // Wrap the icon in GestureDetector for onTap functionality
                              onTap: () {
                                setState(() {
                                  increase(
                                      1); // Call the increase function with parameter 1 for decrease
                                });
                              },
                              child: ClipOval(
                                  child: Container(
                                      color: Color(0xFF686776),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesomeIcons.minus,
                                        size: 25.0,
                                      ))),

                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              // Wrap the icon in GestureDetector for onTap functionality
                              onTap: () {
                                setState(() {
                                  increase(
                                      2); // Call the increase function with parameter 2 for increase
                                });
                              },
                              child: ClipOval(
                                  child: Container(
                                      color: Color(0xFF686776),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 25.0,
                                      ))),
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActivecardcolor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLlabelTextstyle),
                        Text(agevalue.toString(), style: kFontweight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              // Wrap the icon in GestureDetector for onTap functionality
                              onTap: () {
                                setState(() {
                                  age(1); // Call the increase function with parameter 2 for increase
                                });
                              },
                              child: ClipOval(
                                  child: Container(
                                      color: Color(0xFF686776),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesomeIcons.minus,
                                        size: 25.0,
                                      ))),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              // Wrap the icon in GestureDetector for onTap functionality
                              onTap: () {
                                setState(() {
                                  age(2); // Call the increase function with parameter 2 for increase
                                });
                              },
                              child: ClipOval(
                                  child: Container(
                                      color: Color(0xFF686776),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 25.0,
                                      ))),
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActivecardcolor,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: kBottomContainercolor,
            child: Center(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage(height: height, weightvalue: weightvalue)),
                );
              },
              child: Text(
                'CALCULATE',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
              ),
            )),
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild});
  final Color colour;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



