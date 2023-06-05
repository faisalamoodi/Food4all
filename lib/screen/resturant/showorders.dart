
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/model/oreder_resturant_model.dart';
import 'package:food4all/model/mealmodel.dart';
import 'package:food4all/screen/resturant/ordersdetails.dart';

class ShowOrders extends StatefulWidget {
  const ShowOrders({super.key});

  @override
  State<ShowOrders> createState() => _ShowOrdersState();
}
List <order_resturant_model> data=[];
MyController _controll=MyController();
class _ShowOrdersState extends State<ShowOrders> {
  @override
  void initState() {
      _controll.getOrderdResturant().then((value) {
        setState(() {
        data=value!;
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
                 child: Text("Orders",style:
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: height/50,),

               Container(
                
                height: height/1.4,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return 
                    data[index].status==0?
                    Container(
                      color: globalcolor,
                    margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Text("user name:",style: TextStyle(color: Colors.white),),
                           
                            Text(data[index].customers["firstname"]+" "+
                            data[index].customers["lastname"],style: TextStyle(color: Colors.white),),
                           
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Text("email:",style: TextStyle(color: Colors.white),),
                           
                            Text(data[index].customers["email"],style: TextStyle(color: Colors.white),),
                           
                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Text("phone:",style: TextStyle(color: Colors.white),),
                           
                            Text(data[index].customers["phone"],style: TextStyle(color: Colors.white),),
                           
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.restaurant_menu_rounded,size:40,color: globalcolor2,),
                            Text(data[index].customers["firstname"],style: TextStyle(color: Colors.white),),
                            MaterialButton(
                              child: Text("accept"),
                              color: Colors.green,
                              onPressed: () {
                              _controll.acceptOrder(data[index].id.toString(),data[index].meal_id.toString(),context);
                            },),
                            MaterialButton(
                              child: Text("refuse"),
                              color: Colors.red,
                              onPressed: () {
                              _controll.refuseOrder(data[index].id.toString(),data[index].meal_id.toString(),context);
                            },),
                            
                          ],
                        ),
                      ],
                    ),
                    ):SizedBox();
                  },),
              )
            ],
          )
          ),
      ),
    );
  }
}