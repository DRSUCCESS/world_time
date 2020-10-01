import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //receive the arguments from loading/ home_context
    //set the argument as Map function
    data = ModalRoute.of(context).settings.arguments;
    print(data);


    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget> [
                FlatButton.icon(
                  onPressed:(){
                    //push the context of /location, /home etc.. on top of each stack as new ui
                    Navigator.pushNamed(context, '/location');
                  },
                  label: Text('Edit Location'),
                  icon: Icon(Icons.edit_location),
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                      )
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0
                  )
                ),
              ],
            ),
          ),
      ),
    );
  }
}
