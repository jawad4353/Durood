








import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User_home extends StatefulWidget{
  @override
  State<User_home> createState() => _User_homeState();
}

class _User_homeState extends State<User_home> {
  var features=['Qibla','Azan','Quran','Tasbhih','Others'];
  var myicons=[Icons.directions,Icons.volume_down,Icons.description,Icons.star,Icons.map];
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
   return  Scaffold(
       backgroundColor:Color(0xFF176C8C) ,
       body: ListView(children: [
        Stack(
          children: [
            Container(
           height: size.height*0.4,
              child: Opacity(
                  opacity: 0.2,
                    child:  Image.asset('images/a.jpg',fit: BoxFit.fill,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                SizedBox(height: 8,),
                Text(' 9 Ramdhan    ',style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w500),),
                Text('  Lahore , Pakistan',style: TextStyle(color: Colors.white,fontSize: 17),),
              ],),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,))
              ],
            ),

            Positioned(
              top: size.height*0.13,
              left: 0,
              right: 0,
              child: Column(
                children: [
                   Text('04:41',style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: Colors.white),),
                   Text('Asr 13 minutes left',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
              ],),
            ),

            Positioned(
              top: size.height*0.29,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' '),
                 Column(children: [
                   Text('Fajr',style: TextStyle(color: Colors.white),),
                   Icon(Icons.wb_sunny_outlined,color: Colors.white,),
                   Text('04:12',style: TextStyle(color: Colors.white),),
                 ],),
                  Column(children: [
                    Text('Dzuhar',style: TextStyle(color: Colors.white),),
                    Icon(Icons.wb_sunny_outlined,color: Colors.white,),
                    Text('01:10',style: TextStyle(color: Colors.white),),
                  ],),
                  Column(children: [
                    Text('Asr',style: TextStyle(color: Colors.white),),
                    Icon(Icons.wb_sunny_outlined,color: Colors.white,),
                    Text('04:54',style: TextStyle(color: Colors.white),),
                  ],),
                  Column(children: [
                    Text('Mahjrib',style: TextStyle(color: Colors.white),),
                    Icon(Icons.wb_sunny_outlined,color: Colors.white,),
                    Text('06:54',style: TextStyle(color: Colors.white),),
                  ],),
                  Column(children: [
                    Text('Isha',style: TextStyle(color: Colors.white),),
                    Icon(Icons.wb_sunny_outlined,color: Colors.white,),
                    Text('08:14',style: TextStyle(color: Colors.white),),
                  ],),
                  Text(' '),

                ],
              ),
            ),

          ],
        ),



         Container(
           height: size.height*0.58,
           decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
           ),
           child: ListView(
             children: [
               Text('    Features',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
               Container(
                   height: 80,
                   child: Padding(
                     padding:  EdgeInsets.only(top: 10),
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                         itemCount: 5,
                         itemBuilder: (context,index){
                           return Padding(
                             padding:  EdgeInsets.only(left: 5,right: 5),
                             child: Container(
                                 width: 70,
                               decoration: BoxDecoration(
                                   color: Color(0xFF176C8C),
                                 borderRadius: BorderRadius.circular(18)
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(myicons[index],color: Colors.white,),
                                 Text('${features[index]}',style: TextStyle(color: Colors.white),)
                               ],
                             ),),
                           );
                         }),
                   )),
               Text('\n   News',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
               Container(
                   height: 180,
                   child: Padding(
                     padding:  EdgeInsets.only(top: 10),
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: 5,
                         itemBuilder: (context,index){
                           return Padding(
                             padding:  EdgeInsets.only(left: 5,right: 5),
                             child: Container(
                               width: 260,
                               decoration: BoxDecoration(
                                   color: Color(0xFF176C8C),
                                   borderRadius: BorderRadius.circular(18)
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(myicons[index],color: Colors.white,),
                                   Text('${features[index]}',style: TextStyle(color: Colors.white),)
                                 ],
                               ),),
                           );
                         }),
                   )),
             ],
           ),
         ),
       ],),



     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.white,
       elevation: 0,
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
         BottomNavigationBarItem(icon: Icon(Icons.report),label: ''),
       ],
     ),

   );
  }
}