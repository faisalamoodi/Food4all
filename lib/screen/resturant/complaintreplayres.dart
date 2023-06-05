
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/model/complaint_model.dart';

class ComplaintReplay extends StatefulWidget {
  const ComplaintReplay({super.key});

  @override
  State<ComplaintReplay> createState() => _ComplaintReplayState();
}
MyController _mycontroller=MyController();
List <complaint_model> data=[];
bool isloading=false;
class _ComplaintReplayState extends State<ComplaintReplay> {
  @override
  void initState() {
    _mycontroller.getcomplaintres().then((value) {
      data=value!;
      setState(() {
        
      isloading=true;
      });
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            
            children: [
               SizedBox(height: height/20,),
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new,size: 30,color: globalcolor,))
                ],
              ),
              
               SizedBox(height: height/10,),
                Container(
                 alignment: Alignment.center,
                 child: Text("My Complaint",style: TextStyle(color:globalcolor,fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: height/50,),
               Container(
                margin: EdgeInsets.symmetric(horizontal:10),
                alignment: Alignment.centerLeft,
                child: Text("click to show replay:",style: TextStyle(color:globalcolor,fontSize: 15,fontWeight: FontWeight.bold),)),
              isloading?
              Container(
                
                height: height/1.4,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: height/6,
                                  child: Column(
                                    children: [
                                       Text("content: "+data[index].content),
                                      SizedBox(height: 20,),
                                      Text(data[index].replay==null?"replay: "+"{didnt replay yet}":"replay: "+data[index].replay),
                                    ],
                                  ),
                                ),
                              );
                            },);
                        },
                        child: Card(
                          color: globalcolor2,
                          child: Container(
                            height: height/7,
                            child: ListTile(
                             title: Text(data[index].name,style: TextStyle(color: Colors.green),), 
                              leading: Text(data[index].name,style: TextStyle(color: Colors.grey[800])),
                              trailing: Text(data[index].admins==null?"didnt replay yet":data[index].admins["firstname"],style: TextStyle(color: Colors.grey)),
                            
                            ),
                          ),
                        ),
                      ),
                    );
                  },),
              ):SizedBox(),
            ],
          )
          ),
      ),
    );
  }
}