import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';

class SendComplaintResturant extends StatefulWidget {
  const SendComplaintResturant({super.key});

  @override
  State<SendComplaintResturant> createState() => _SendComplaintResturantState();
}
TextEditingController complaintcontroller=TextEditingController();
MyController _myController=MyController();
class _SendComplaintResturantState extends State<SendComplaintResturant> {
  @override
  Widget build(BuildContext context) {
   var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
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
                 child: Text("send complaint",style: 
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),
                  
               SizedBox(height: height/20,),
                    Container(
              height: height/1.8,
              width: double.infinity,
              child: TextFormField(
                controller: complaintcontroller,
                  maxLines: 20,
                  maxLength: 200,
                  keyboardType: TextInputType.text,
                  cursorColor: Color.fromRGBO(0, 0, 0, 1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[100],
                      hintText: "write your complaint here",
                 hintStyle:
                TextStyle(color: Color(0xff8c9289), fontFamily: 'Cobe',fontSize: 20),
              ),
           ),
               ),



                Container(
                  height: height/10,
                  width: width/2.7,
                  decoration: BoxDecoration(
                        color: globalcolor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                  child: MaterialButton(
                  child: Text("send"),
                  onPressed: () {
                    _myController.addcomplaintprovider(complaintcontroller.text, context);
                  },),
                ),


            ],
          ),
        ),
      ),
    );
  }
}