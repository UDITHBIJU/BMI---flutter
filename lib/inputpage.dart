import 'package:bmi/cards.dart';
import 'package:bmi/gender.dart';
import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomheight = 60;
const activecolour = Color(0xFF1D1E33);
const inactivecolour = Color(0xFF111328);

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  gender? selectedgender;
  int weight = 30;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Cards(
                  onPress: () {
                    setState(() {
                      selectedgender = gender.male;
                    });
                  },
                  //instead of if loop we use this. not in the all cases
                  // ternary operator in flutter
                  // condition ? DoThisIfTrue : DoThisIfFalse
                  colour: selectedgender == gender.male
                      ? activecolour
                      : inactivecolour,
                  cardChild: Gender(
                    icon: FontAwesomeIcons.mars,
                    sex: 'MALE',
                  ),
                )),
                Expanded(
                    child: Cards(
                  onPress: () {
                    setState(() {
                      selectedgender = gender.female;
                    });
                  },
                  //instead of if loop we use
                  // ternary operator in flutter
                  // condition ? DoThisIfTrue : DoThisIfFalse
                  colour: selectedgender == gender.female
                      ? activecolour
                      : inactivecolour,
                  cardChild:
                      Gender(icon: FontAwesomeIcons.venus, sex: 'FEMALE'),
                ))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Cards(
                  colour: const Color(0xFF1E1D33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Height',
                          style: TextStyle(
                              fontSize: 19, color: Color(0xFF8D8E98))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF8D8E98)),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            trackHeight: 1,
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 25)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          inactiveColor: const Color(0xFF81DE98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Cards(
                  colour: const Color(0xFF1E1D33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WEIGHT',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFF8D8E98))),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                            fontSize: 70, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.remove,
                            onpressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Cards(
                  colour: const Color(0xFF1E1D33),
                  cardChild: Column(
                    children: [
                      const Text('AGE',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFF8D8E98))),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                            fontSize: 70, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.remove,
                            onpressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onpressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            BottomButton()
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle,@required this.onTap })

final String ?buttonTitle;
Function ?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap;
      child: Container(

        child: const Center(child: Text(buttonTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
        width: double.infinity,
        color: const Color(0xFFEB1555),
        height: bottomheight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.icon,
    @required this.onpressed,
  });
  final IconData? icon;
  final onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(width: 52, height: 52),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF8D8E98),
    );
  }
}
