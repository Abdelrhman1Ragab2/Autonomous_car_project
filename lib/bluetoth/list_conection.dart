import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../Screan/mode Screan.dart';
import 'connection.dart';
import 'manual.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(

              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          } else if (future.connectionState == ConnectionState.done) {
            // return MyHomePage(title: 'Flutter Demo Home Page');
            return Home();
          } else {
            return Home();
          }
        },
        // child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class  Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 226, 204, 204),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 116, 0, 0),
            leading: IconButton(icon:Icon(Icons.arrow_back,
            color: Colors.white,
            ),
              onPressed: (){
                setState(() {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>modeScrean()));
                });
              },),
            title: Text('Connection',
            style: TextStyle(
              color: Colors.white
            ),),
          ),
          body: SelectBondedDevicePage(

            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return manual(server: device);
                  },
                ),
              );
            },
          ),
        ));
  }
}

/*class MyHomePage extends StatefulWidget {
   MyHomePage({Key key, this.title}) : super(key: key);
   final String title;

   @override
   _MyHomePageState createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
   int _currentStep = 0;
   BluetoothDevice device;

   void onStepContinue() async {

     if (_currentStep == 0) {
       setState(() {
         _currentStep = 1;
       });
     }
   }

   void onStepCancel() {
     if (_currentStep == 1) {
       setState(() {
         _currentStep = 0;
       });
     }
   }

   @override
   Widget build(BuildContext context) {
     List<Step> _steps = [
       Step(
         title: Text('Connection'),
         content: Container(
           height: 500,
           child: SelectBondedDevicePage(
             onCahtPage: (BluetoothDevice device) {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) {
                     return ChatPage(server: device);
                   },
                 ),
               );
             },
           ),
         ),
         state: StepState.editing,
         isActive: true,
       ),
       Step(
         title: Text('Led'),
         content: Container(
          child: onCahtPage,
            ),
       ),
     ];
     return Scaffold(
      appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Stepper(
         steps: _steps,
         type: StepperType.horizontal,
         currentStep: _currentStep,
         onStepContinue: onStepContinue,
         onStepCancel: onStepCancel,
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
//           //
         },
         tooltip: 'Increment',
         child: Icon(Icons.search),
       ), // This trailing comma makes auto-formatting nicer for build methods.
     );
   }
}*/
