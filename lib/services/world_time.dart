import 'package:http/http.dart';
import 'dart:convert';//convert json into object visible to our code base
import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  //Has to promise (as in js) the function getTime() async for future use
  Future<void> getTime() async  {

    try{

      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //  get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //  create a DateTime object
      DateTime now = DateTime.parse(datetime);//convert to a DateTime object
      now = now.add(Duration(hours:  int.parse(offset)));

      // set the time property to date_format
      isDaytime = now.hour > 6 && now.hour <20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }


  }


}
