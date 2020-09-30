import 'package:http/http.dart';
import 'dart:convert';//convert json into object visible to our code base


class WorldTime {

  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  //Has to promise (as in js) the function getTime() async for future use
  Future<void> getTime() async  {

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

    // set the time property to string format
    time = now.toString();

  }


}
