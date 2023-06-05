import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';

class AddNewServices extends StatefulWidget {
  const AddNewServices({super.key});

  @override
  State<AddNewServices> createState() => _AddNewServicesState();
}
MyController _myController=MyController();
TextEditingController description=TextEditingController();
String type="in the resturant";
class _AddNewServicesState extends State<AddNewServices> {
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
                 SizedBox(height: height/20,),
                Container(
                 alignment: Alignment.center,
                 child: Text("Add New Service",style: 
                    TextStyle(color:globalcolor2,fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: height/20,),
              Container(
              height: height/2.5,
              width: double.infinity,
              child: TextFormField(
                controller: description,
                  maxLines: 10,
                  maxLength: 200,
                  keyboardType: TextInputType.text,
                  cursorColor: Color.fromRGBO(0, 0, 0, 1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[100],
                      hintText: "write type of food you have here.",
                 hintStyle:
                TextStyle(color: Color(0xff8c9289), fontFamily: 'Cobe',fontSize: 20),
              ),
           ),
               ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60,
                  child: DropdownButton(
                    
                    style: TextStyle(
                      //te
                       color: Color.fromARGB(255, 96, 86, 86), //Font color
                          fontSize: 20, //font size on dropdown button
                          
                      ),
                    items: ["delivery" , "in the resturant",].map((e) => DropdownMenuItem(child: Text("$e"),value: e)).toList(),
                   onChanged: (value) {
                    setState(() {
                     type=value!;
                    });
                  },
                  value: type,
                  ),
                ),
                SizedBox(height:height/50,),
                 loginbutton("confirm",() {
                  _myController.addservices(description.text,type=="in the resturant"?"2":"1", context);
                 }, )
            ],
          )
          ),
      ),
    );
  }
}