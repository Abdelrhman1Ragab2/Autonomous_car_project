import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/bluetoth/tests2.dart';
import 'AutomaticScrean.dart';
import 'FirstScrean.dart';
import 'ManualScrean.dart';
class modeScrean extends StatefulWidget {
  const modeScrean({Key key}) : super(key: key);

  @override
  _modeScreanState createState() => _modeScreanState();
}

class _modeScreanState extends State<modeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 204, 204),
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),
      onPressed: (){
        setState(() {
          Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context)=>firstScrean()));
        });
      },),
        title: Text("Autonomous Car",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
        backgroundColor: Color.fromARGB(255, 116, 0, 0),

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextLiquidFill(

              text: "Select Car Mode",
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Color.fromARGB(250, 127, 0, 21),
              textStyle: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 50.0,
              boxWidth: 300.0,
            ),
            SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(

                  onPressed:(){
                  setState(() {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>ManualScrean()));

                  });
                },
                 child:Image(
                   width: 145,
                   height: 145,
                   image: AssetImage("assets/images/logo2.PNG"),

                 ),
                ),

                MaterialButton(onPressed:(){
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>AutomaticScrean()));
                  });
                },
                  child:Image(
                    width: 145,
                    height: 145,
                    image: AssetImage("assets/images/logo5.PNG"),
                    fit: BoxFit.contain,
                  ),
                ),
                
              ],
              
            ),
          ],
          
        )
        ,
      ),
    );
    
  }
}
