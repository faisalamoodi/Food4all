
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/screen/user/paymenysuccess.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}
MyController _controller=MyController();
bool _isHiddenPassword=false;
TextEditingController cardnumbercontroller=TextEditingController();
TextEditingController amountontroller=TextEditingController();
class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
   var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new,size: 30,))
                ],
              ),
                SizedBox(height:height/40,),
                Text("Add",style: TextStyle(color:globalcolor,fontSize: 35,fontWeight: FontWeight.bold),),
                
                SizedBox(height:height/50,),
              textform(
                 cardnumbercontroller,
                  "Card Number",
                   TextInputType.name,
                   () {
                   
                },
                _isHiddenPassword,
                (value) {
                   
                  },
                ),
                SizedBox(height:height/50,),

                textform(
                  amountontroller,
                  "amount",
                   TextInputType.number,
                   () {
                   
                },
                _isHiddenPassword,
                (value) {
                   if (value!.isEmpty) {
                    return "Company name required";
                   }
                  },
                ),
                
                SizedBox(height:height/50,),
                loginbutton("Submit",
                 () {
                  _controller.pay(cardnumbercontroller.text,amountontroller.text,context);
               },),

               MaterialButton(
                  child: Text("skip",style: TextStyle(color: globalcolor,fontSize: 15),),
                  onPressed: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Success();
                      }));
                  },),
            ],
          ),
        ),
      ),
    );
  }
}