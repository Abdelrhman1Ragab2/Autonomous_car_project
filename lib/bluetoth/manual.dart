import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../Screan/mode Screan.dart';
import 'List_connection1.dart';
import 'automatic.dart';

class manual extends StatefulWidget {
  final BluetoothDevice server;

  const manual({this.server});

  @override
  _ChatPage createState() => new _ChatPage();
}

class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class _ChatPage extends State<manual> {
  static final clientID = 0;
  BluetoothConnection connection;

  List<_Message> messages = List<_Message>();
  String _messageBuffer = '';

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;

  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input?.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      //  connection = null;
    }

    super.dispose();
  }
  var speed=0;
  @override
  Widget build(BuildContext context) {
    final List<Row> list = messages.map((_message) {
      return Row(
        children: <Widget>[
          Container(
            child: Text(
                (text) {
                  return text == '/shrug' ? '??\\_(???)_/??' : text;
                }(_message.text.trim()),
                style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: 222.0,
            decoration: BoxDecoration(
                color:
                    _message.whom == clientID ? Colors.blueAccent : Colors.grey,
                borderRadius: BorderRadius.circular(7.0)),
          ),
        ],
        mainAxisAlignment: _message.whom == clientID
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 204, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 116, 0, 0),
          title: (isConnecting
              ? Text('Connecting chat to ' + widget.server.name + '...',
          style: TextStyle(
          color: Colors.white
          ),
          )
              : isConnected
                  ? Text('Live chat with ' + widget.server.name)
                  : Text('Chat log with ' + widget.server.name)),
          leading: IconButton(icon:Icon(Icons.arrow_back,
          color: Colors.white,),
      onPressed: (){
        setState(() {
          Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context)=>modeScrean()));
        });
      },
          ),


      ),
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Speed is <<< $speed % >>> ",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),


            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                MaterialButton(
                  minWidth: 50,
                  height: 20,
                  onPressed: () {
                    setState(() {
                      _sendMessage('@mu;');
                      if( speed<=80 )
                      {speed=speed+20;}
                    });
                  },
                  child: Icon(Icons.add,
                    size: 60,
                    color: Color.fromARGB(255, 116, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  minWidth: 50,
                  height: 20,
                  onPressed: () {
                    setState(() {
                      _sendMessage('@md;');
                      if( speed>=20 )
                      {speed=speed-20;}

                    });
                  },
                  child: Icon(Icons.remove,
                    size: 60,
                    color: Color.fromARGB(255, 116, 0, 0),
                  ),
                ),
                 ]
            ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(

                      minWidth: 50,
                      height: 20,
                      onPressed: () {
                        setState(() {
                          _sendMessage('@mf;');
                        });
                      },
                      child: Icon(Icons.arrow_upward,
                      size: 40,
                        color: Colors.white,
                      ),
                      color: Color.fromARGB(255, 3, 13, 54),
                    ),
                  ],
                ),

                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 50,
                      height: 20,
                      onPressed: () {setState(() {
                        _sendMessage('@ml;');
                      });
                      },
                      child: Icon(Icons.arrow_back,
                        size: 40,
                        color: Colors.white,),
                      color: Color.fromARGB(255, 3, 13, 54),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MaterialButton(
                      minWidth: 50,
                      height: 20,
                      onPressed: () {
                        setState(() {
                          _sendMessage('@ms;');
                        });
                      },
                      child: Text(
                        "STOP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      color: Color.fromARGB(255, 116, 0, 0),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MaterialButton(
                      minWidth: 50,
                      height: 20,
                      onPressed: () {
                        setState(() {
                          _sendMessage('@mr;');
                        }
                        );

                      },
                      child: Icon(Icons.arrow_forward,
                        size: 35,
                      color: Colors.white,
                      ),
                      color: Color.fromARGB(255, 3, 13, 54),
                    ),
                  ],
                ),

                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 50,
                      height: 20,
                      onPressed: () {
                        setState(() {
                          _sendMessage('@mb;');
                        });
                      },
                      child: Icon(Icons.arrow_downward,
                        size: 40,
                        color: Colors.white,),
                      color: Color.fromARGB(255, 3, 13, 54),
                    ),

              ],
            ),
          ],
        ),

        //],
      ),
      // ),
    );
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      setState(() {
        messages.add(
          _Message(
            1,
            backspacesCounter > 0
                ? _messageBuffer.substring(
                    0, _messageBuffer.length - backspacesCounter)
                : _messageBuffer + dataString.substring(0, index),
          ),
        );
        _messageBuffer = dataString.substring(index);
      });
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
  }

  void _sendMessage(String text) async {
    text = text.trim();
    textEditingController.clear();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(
              listScrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 333),
              curve: Curves.easeOut);
        });
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
