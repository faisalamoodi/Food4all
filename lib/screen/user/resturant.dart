
import 'package:flutter/material.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/model/mealmodel.dart';
import 'package:food4all/screen/user/resturantdetails.dart';

class Resturant extends StatefulWidget {
  const Resturant({super.key});

  @override
  State<Resturant> createState() => _ResturantState();
}
bool islooading=false;
late List <meal_model> data;
MyController _controller=MyController();
class _ResturantState extends State<Resturant> {
  @override
  void initState() {
    _controller.getmeals().then((value) {
      data=value!;
      print("data is $data");
      setState(() {
        
      islooading=true;
      });
    },);
    super.initState();
  }
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
                 child: Text("availble Resturant",style: 
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: height/50,),
              islooading?
              Container(
                
                height: height/1.4,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return 
                    data[index].status==0?
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ResturantDetails(lat:data[index].providers["lat"] ,lng:data[index].providers["lng"],
                      name: data[index].name,description: data[index].description  ,meal_id: data[index].id.toString(),);
                    }));
                      },
                      child: Container(
                        color: globalcolor,
                        height: height/9,
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.restaurant_menu_rounded,size:40,color: globalcolor2,),
                          Text(data[index].name,style: TextStyle(color: Colors.white),),
                          MaterialButton(
                            color: globalcolor2,
                            child: Text("location"),
                            onPressed: () {
                            
                          },)
                        ],
                      ),
                      )
                    ):SizedBox();
                  },),
              ):SizedBox(),
            ],
          )
          ),
      ),
    );
  }
}