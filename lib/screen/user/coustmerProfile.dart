
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/controller/user_controller.dart';
import 'package:food4all/model/user_model.dart';

late user_model data;
class CoustmerProfile extends StatefulWidget {
  const CoustmerProfile({super.key});

  @override
  State<CoustmerProfile> createState() => _CoustmerProfileState();
}
bool isloading=false;
List <String> myprofile=["first name","last name","phone","email"];
class _CoustmerProfileState extends State<CoustmerProfile> {
  @override
  User_Control user_controller=User_Control();
  void initState() {
   user_controller.getprofileCom("3").then((value) {
     data=value!;
     print(value);
     setState(() {
       
     isloading=true;
     });
   },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: height/20,),
            
               Text("Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             
               SizedBox(height: height/20,),
              isloading?
              Container(
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: height/40,),
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              
                              height: height/10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(myprofile[0],style: TextStyle(fontSize: 20),),
                                  Text(data.firstname,style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                          
                          SizedBox(height: height/30,),
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              height: height/10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(myprofile[1],style: TextStyle(fontSize: 20,),),
                                  Text(data.lastname,style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                          
                          
                          SizedBox(height: height/30,),
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              height: height/10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(myprofile[2],style: TextStyle(fontSize: 20,),),
                                  Text(data.phone,style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                          
                          SizedBox(height: height/30,),
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              height: height/10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(myprofile[3],style: TextStyle(fontSize: 20,),),
                                  Text(data.email,style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
               :CircularProgressIndicator(),       
            ],
          )
          ),
      ),
    );
  }
}