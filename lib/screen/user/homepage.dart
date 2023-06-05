
import 'package:flutter/material.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/screen/user/googlemaps.dart';
import 'package:food4all/screen/user/resturant.dart';
import 'package:food4all/screen/user/sendcomplaint.dart';
import 'package:food4all/screen/user/userinfo.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 10,
             backgroundColor: globalcolor,
            bottom:  TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Tab(icon: Icon(Icons.home_outlined,color:globalcolor2,size: 40,),),
                Tab(icon: Icon(Icons.restaurant,color: globalcolor2,size: 40,),),
                Tab(icon: Icon(Icons.report_problem,color: globalcolor2,size: 40,),),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MapSample(),
              Resturant(),
              UserInfo()
            ],
          ),
        ),
      ),
    );
  }
}