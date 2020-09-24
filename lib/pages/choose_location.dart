import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    //simulate network request for a username
    //await keywords runs the code first b4 another
    //we can assign value to the builtFunction 'await'
    //we use 'await' because each code depends on each other
    String username = await Future.delayed(Duration(seconds: 3), () {
      return('drSuccess');
    });

    //simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return ('Bio: vegan, musician & egg collector');
    });

    print('$username - $bio');
  }

  int counter = 0;

  @override
  void initState() {
    //Override and call the original function State<Choose..>
    //iniState function runs once
    super.initState();
    getData();
    print('Hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}