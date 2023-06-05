import 'package:flutter/material.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/resturantlogin.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/screen/resturant/complaintreplayres.dart';
import 'package:food4all/screen/resturant/resturantProfile.dart';
import 'package:food4all/screen/user/sendcomplaint.dart';

class ResturantInfo extends StatefulWidget {
  const ResturantInfo({super.key});

  @override
  State<ResturantInfo> createState() => _ResturantInfoState();
}

class _ResturantInfoState extends State<ResturantInfo> {
  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: coustomBox(),
        child: SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(height: height/50,),
                Container(
                 alignment: Alignment.center,
                 child: Text("settings",style: 
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),

                    
                  Divider(thickness: 3,color: globalcolor2,),

                  

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SendComplaint();
                    }));
                    },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Icon(Icons.send,size: 40,color: globalcolor2,),
                      SizedBox(width: width/15,),
                        Text("send complaint",style: TextStyle(color: globalcolor2,fontSize: 20),),
                      ],
                    ),
                  ),


Divider(thickness: 3,color: globalcolor2,),

                  

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ComplaintReplay();
                    }));
                    },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Icon(Icons.noise_aware,size: 40,color: globalcolor2,),
                      SizedBox(width: width/15,),
                        Text("old complaint",style: TextStyle(color: globalcolor2,fontSize: 20),),
                      ],
                    ),
                  ),

                    Divider(thickness: 3,color: globalcolor2,),

                  

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ResturantProfile();
                    }));
                    },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Icon(Icons.person,size: 40,color: globalcolor2,),
                      SizedBox(width: width/15,),
                        Text("Profile",style: TextStyle(color: globalcolor2,fontSize: 20),),
                      ],
                    ),
                  ),



                  Divider(thickness: 3,color: globalcolor2,),

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ResturantLogin();
                    }));
                    },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Icon(Icons.logout,size: 40,color:globalcolor2),
                      SizedBox(width: width/15,),
                        Text("Log Out",style: TextStyle(color: globalcolor2,fontSize: 20),),
                      ],
                    ),
                  ),
                   Divider(thickness: 3,color: globalcolor2,),


            ],
          ),
        ),
      ),
    );
  }
}