import 'package:bmi/cards.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
                flex: 5,
                child: Cards(
                  colour: const Color(0xFF1D1E33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Normal',
                          style: TextStyle(
                              color: Color(0xFF24D876),
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Text('18.0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100,),),
                      Text('Your BMI is result is qute low, you should eat more!',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
