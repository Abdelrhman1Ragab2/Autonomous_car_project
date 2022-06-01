import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'FirstScrean.dart';
class splashScrean extends StatefulWidget
{
  const splashScrean({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>Mysplash();

}
class Mysplash extends State<splashScrean>
{

  initState()
  {
    super.initState();
    Timer(Duration(milliseconds:5000),
            (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>firstScrean()),);
        }
    );
  }
  @override
  Widget build(BuildContext context) {

     return Container(
       width: double.infinity,
       height: double.infinity,
       child: Expanded(
         child: Image(

           image: AssetImage("assets/images/giphy.gif"),
           fit: BoxFit.cover,
         ),
       ),
     );
  }
  }

