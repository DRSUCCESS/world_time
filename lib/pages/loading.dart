import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //create a new instance of getTime()
  //to use 'await'-keyword inside a function the function has to be declared as async
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos');
    await instance.getTime(); //must be used inside async function
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
    });// push the name-home and replace the loading router

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('Loading...'),
      ),
    );
  }
}
