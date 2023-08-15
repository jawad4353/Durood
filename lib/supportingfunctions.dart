
import 'package:pray_times/pray_times.dart';
import 'package:timezone/timezone.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//  getTimezone(double latitude, double longitude) async {
//  var tz = tzmap.latLngToTimezoneString(latitude, longitude);
//  final location = getLocation(latitude, longitude);
//  final timeZone = await getLocationTimeZone(location);
//  final timeZoneOffset = timeZone.currentTimeZoneOffset(DateTime.now());
//  final timeZoneOffsetHours = timeZoneOffset.inHours;
//
// }
// Location getLocation(double latitude, double longitude) {
//  final location = Location();
//  location.latitude = latitude;
//  location.longitude = longitude;
//  return location;
// }

 get_Prayer_time(long,lat){
  double latitude = lat;
  double longitude = long;
  double timezone = 5;

  PrayerTimes prayers = new PrayerTimes();
  prayers.setTimeFormat(prayers.Time24);
  prayers.setCalcMethod(prayers.MWL);
  prayers.setAsrJuristic(prayers.Shafii);
  prayers.setAdjustHighLats(prayers.AngleBased);
  var offsets = [0, 0, 0, 0, 0, 0, 0];
  prayers.tune(offsets);

  final date = DateTime.now();
  List<String> prayerTimes =
  prayers.getPrayerTimes(date, latitude, longitude, timezone);
  List<String> prayerNames = prayers.getTimeNames();

  return prayerTimes;
}





class show_progress_indicator extends StatelessWidget{
  var color1,color2;
  show_progress_indicator({required this.color1,required this.color2 });
 @override
 Widget build(BuildContext context) {
  return
   Center(child: Container(
    color: color1,
    child: SpinKitFoldingCube(
     size: 50.0,
     duration: Duration(milliseconds: 700),
     itemBuilder: ((context, index) {
      var Mycolors=[color2,color1];
      var Mycol=Mycolors[index%Mycolors.length];
      return DecoratedBox(decoration: BoxDecoration(
          color: Mycol,
          border: Border.all(color: color2,)

      ));
     }),
    ),
   ),

   );

 }

}