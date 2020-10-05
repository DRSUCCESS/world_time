import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; // initialize an empty data map function

  @override
  Widget build(BuildContext context) {

    //receive the arguments from loading/ home_context
    //set the argument as Map function
    //if data isNotEmpty return the data received from setState dynamic result
    //else triggers a ModalRoute context settings
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover, //Let the image cover entire screen
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget> [
                  FlatButton.icon(
                    onPressed:() async {
                      //push the context of /location, /home etc.. on top of each stack as new ui
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      //setState update the data and triggers to rebuild
                      setState(() {
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'isDaytime' : result['isDaytime'],
                          'flag' : result['flag'],
                        };
                      });
                    },
                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                    ),
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
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
                          color: Colors.white,
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
