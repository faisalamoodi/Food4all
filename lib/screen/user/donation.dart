import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/screen/user/payment.dart';
import 'package:food4all/screen/user/paymenysuccess.dart';
import 'package:food4all/screen/user/resturantonmap.dart';

class Donation extends StatefulWidget {
  final String lat;
  final String lng;
  final String meal_id;
  const Donation({super.key, required this.lat, required this.lng, required this.meal_id});

  @override
  State<Donation> createState() => _DonationState();
}
MyController _controller= MyController(); 
class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
   var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: coustomBox(),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new,size: 30,color: globalcolor,))
                ],
              ),

               Container(
                width: width/1.1,
                height: height/2.5,
                child: MapResturantSample(lat1: widget.lat,lng1: widget.lng,),
               ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(0 / 360),
                  child: Text("Available Food\nNearpy",
                  style: TextStyle(
                    shadows:[ Shadow(
                  color: Colors.pink,
                  blurRadius: 20,
                              ),],
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 172, 199)),
                    textAlign: TextAlign.center,),
                ),
                SizedBox(height:height/50,),
                Text("Click here to donate for charity",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                SizedBox(height:height/50,),
                Container(
                  height: height/10,
                  width: width/2.7,
                  decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 139, 175),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                  child: MaterialButton(
                  child: Text("click me"),
                  onPressed: () {
                   _controller.coutmerorder(widget.meal_id,context);
                  },),
                ),


                RotationTransition(
                  turns: AlwaysStoppedAnimation(0 / 360),
                  child: Text("all Dontaions\nwill be recorded",
                  style: TextStyle(
                    shadows:[ Shadow(
                  color: Colors.pink,
                  blurRadius: 20,
                              ),],
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 172, 199)),
                    textAlign: TextAlign.center,),
                ),


                

            ],
          ),
        ),
      ),
    );
  }
}