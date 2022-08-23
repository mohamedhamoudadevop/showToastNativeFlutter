import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

static const Channel=MethodChannel('com.example.nativecode/toast');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('call native code to show toast message'),
            ElevatedButton(onPressed: (){
              _showToast();
            }, child: Text('show Toast'))
          ],
        ),
      ),
    );
  }
Future<void> _showToast() async{
  final int batteryLevel = await Channel.invokeMethod('showToast',<String,String>{
    'message':'This is a Toast from From Flutter to Android Native Code Yes, It is working'
  });
  print(batteryLevel);
}
}
