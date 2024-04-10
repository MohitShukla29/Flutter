import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Constants.dart';

class NewPage extends StatefulWidget {
  final int weightvalue;
  final int height;

  const NewPage({required this.height, required this.weightvalue});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  late double bmi;
  late String _bmiCategory;

  void calculateBMI() {
    setState(() {
      bmi = widget.weightvalue / (widget.height * widget.height) * 10000;
      _bmiCategory = calculateBMICategory();
    });
  }

  String calculateBMICategory() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  void initState() {
    super.initState();
    calculateBMI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'YOUR RESULT',
        ),
      ),
      body: Column(
        children: [
          Expanded(flex:2,child: Text('')),
          Expanded(
            flex: 9,
            child: Text('$_bmiCategory',style: TextStyle(color:Colors.green,fontSize: 20.0 ),),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NewPage(height: height, weightvalue: weightvalue)),
                  // );
                  Navigator.pop(context);
                },
                child: Text('Your BMI is $bmi',style: TextStyle(fontSize: 20.0 )),
              ),
            ),
          ),
          Expanded(flex:2,child: Text('')),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: kBottomContainercolor,
        child: GestureDetector(
          child: const Text(
            'RE-CALCULATE',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            );
          },
        ),
      ),
    );
  }
}
