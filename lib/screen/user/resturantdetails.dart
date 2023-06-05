import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/screen/user/donation.dart';

class ResturantDetails extends StatefulWidget {
  final String lat;
  final String lng;
  final String name;
  final String description;
  final String meal_id;
  
  const ResturantDetails({super.key, required this.lat, required this.lng, required this.name, required this.description, required this.meal_id});

  @override
  State<ResturantDetails> createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  @override
  Widget build(BuildContext context) {
   var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: globalcolor2,
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
              SizedBox(height: height/50,),
              Container(
                width: width,
                height: height/10,
                color: globalcolor,
                alignment: Alignment.center,
                child: Text(widget.name,style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: height/20,),
              
              Container(
                padding: EdgeInsets.all(10),
                width: width,
                color: globalcolor2,
                alignment: Alignment.topLeft,

                child: Column(
                  children: [
                    Container(
                padding: EdgeInsets.all(10),
                width: width,
                color: globalcolor,
                alignment: Alignment.topLeft,
                child: Text("the food served by the resturant:",style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              ),
                    Container(
                            padding: EdgeInsets.all(10),
                            width: width,
                            color: globalcolor,
                            alignment: Alignment.topLeft,
                            child: Text(widget.description,style: TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
                          ),
                  ],
                ),
              ),

              SizedBox(height: height/30,),
              Container(
                height: height/15,
                width: width/2,
                child: MaterialButton(
                  color: globalcolor,
                  child: Text("Reserve Now",style: TextStyle(color: Colors.white),),
                  onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Donation(lat:widget.lat ,lng: widget.lng,meal_id: widget.meal_id,);
                      }));
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}