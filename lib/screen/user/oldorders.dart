import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/model/oreder_resturant_model.dart';

class OldOrders extends StatefulWidget {
  const OldOrders({super.key});
  @override
  State<OldOrders> createState() => _OldOrdersState();
}
bool islooading=false;
MyController _controller=MyController();
List <order_resturant_model> data=[];
class _OldOrdersState extends State<OldOrders> {
  @override
  void initState() {
    _controller.getOrderdcoustmer().then((value) {
      data=value!;
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
                 alignment: Alignment.center,
                 child: Text("availble Resturant",style: 
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: height/30,),

              islooading?
               Container(
                height: height/1.2,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: globalcolor,
                    margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.restaurant_menu_rounded,size:40,color: globalcolor2,),
                        Text(data[index].providers["name"],style: TextStyle(color: Colors.white,fontSize: 22),),
                        Text(getText(data[index].status.toString()),style: TextStyle(color:getColor(data[index].status.toString()),fontSize: 20),)
                      ],
                    ),
                    );
                  },),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
  String getText(String s){
    if (s=="0") {
      return "processing";
    } else if(s=="1") {
      return "accepted";
    }else{
        return "refuesed";
    }
  }
  Color getColor(String s){
    if (s=="0") {
      return Colors.grey;
    } else if(s=="1") {
      return Colors.green;
    }else{
        return Colors.red;
    }
  }
}