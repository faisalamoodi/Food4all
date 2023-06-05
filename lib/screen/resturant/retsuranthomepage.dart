
import 'package:flutter/material.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/screen/resturant/addnewservice.dart';
import 'package:food4all/screen/resturant/resturantinfo.dart';
import 'package:food4all/screen/resturant/showorders.dart';
import 'package:food4all/screen/user/googlemaps.dart';
import 'package:food4all/screen/user/resturant.dart';
import 'package:food4all/screen/user/sendcomplaint.dart';
import 'package:food4all/screen/user/userinfo.dart';



class ResturantHomePage extends StatelessWidget {
  const ResturantHomePage({super.key});

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
                Tab(icon: Icon(Icons.add,color:globalcolor2,size: 40,),),
                Tab(icon: Icon(Icons.shopping_cart,color: globalcolor2,size: 40,),),
                Tab(icon: Icon(Icons.settings,color: globalcolor2,size: 40,),),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AddNewServices(),
              ShowOrders(),
              ResturantInfo()
            ],
          ),
        ),
      ),
    );
  }
}