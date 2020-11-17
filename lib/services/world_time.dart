import 'package:http/http.dart'; //get and response keyword starts working from here
import 'dart:convert'; //json-decode works from here
import 'package:intl/intl.dart';


class WorldTime
{
  String location; //location for UI
  String time; //time in the location
  String flag; //url to asset flag icon
  String url; //location url for API endpoint
  bool isDaytime; //true if it a day, false otherwise

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

//    //Response is a part of http
//    //to decode the json string in the get keyword "jsonDecode" is used
//    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
//    Map data = jsonDecode(response.body);
//    print(data);
//    print(data['title']);

    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = (now.hour > 7 && now.hour < 20) ? true : false ;
      time = DateFormat.jm().format(now);
    }

    catch(e) {
      print('caught error $e');
    }
  }
}

