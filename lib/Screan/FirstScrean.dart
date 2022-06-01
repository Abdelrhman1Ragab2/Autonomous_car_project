import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'mode Screan.dart';
class firstScrean extends StatefulWidget {
  const firstScrean({Key key}) : super(key: key);

  @override
  _firstScreanState createState() => _firstScreanState();
}

class _firstScreanState extends State<firstScrean> {
  var marjn=20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 226, 204, 204),
      appBar: AppBar(
        leading: Icon(Icons.account_balance),
        title: Text("CI Project",
          style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
          ),
        ),
        backgroundColor: Color.fromARGB(255, 116, 0, 0),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(marjn),
        duration: Duration(milliseconds: 1000),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedTextKit(

                isRepeatingAnimation: true,
        animatedTexts: [
        TyperAnimatedText('Supervisor: Dr /Maher Mansour',
        textStyle:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color.fromARGB(250, 68, 18, 11),
        ), ),

          ]
    ),
            SizedBox(height: 15,),
            AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText('Year: 4th Computer department',
                    textStyle:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(250, 68, 18, 11),
                    ), ),

                ]
            ),
            SizedBox(height: 15,),
            AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText('Project Title:Autonomous Car',
                    textStyle:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(250, 68, 18, 11),
                    ), ),

                ]
            ),
            SizedBox(height: 30,),
            AnimatedTextKit(
              isRepeatingAnimation: true,
              animatedTexts: [
                WavyAnimatedText('Team Member',
                    textStyle:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.blueAccent,
                    ),
                )
              ],
              repeatForever: true,
            ),
            SizedBox(height: 15,),
            Text("Abdelrahman Ragab",
              style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(250, 7, 14, 94),
              ),
            ),
            SizedBox(height: 15,),
            Text("Abdelrahman Adel",
              style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                color: Color.fromARGB(250, 7, 14, 94),
              ),
            ),
            SizedBox(height: 15,),
            Text("Rania Mostafa",
              style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                color: Color.fromARGB(250, 7, 14, 94),
              ),
            ),
            SizedBox(height: 15,),
            Text("Hozaifa Zaki",
              style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                color: Color.fromARGB(250, 7, 14, 94),
              ),
            ),
            SizedBox(height: 15,),
            MaterialButton(onPressed: (){
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>modeScrean()));
              });
            },
            child: TextLiquidFill(

              text: "Let's Start",
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Color.fromARGB(250, 127, 0, 21),
              textStyle: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 50.0,
              boxWidth: 300.0,
            ),
            )
          ],

        )
        ,
      ),
    );
  }
}
