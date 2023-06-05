import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/user_controller.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool _isHiddenPassword=true;
TextEditingController firstnamecontroller=TextEditingController();
TextEditingController lastnamecontroller=TextEditingController();
TextEditingController phonenumbercontroller=TextEditingController();
TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
TextEditingController departmentcontroller=TextEditingController();
TextEditingController destrictcontroller=TextEditingController();
User_Control _user_control=User_Control();
class _SignupState extends State<Signup> {
  
    GlobalKey<FormState> formstate= new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   var width= MediaQuery.of(context).size.width;
   var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        height: height,
        decoration: coustomBox(),
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                SizedBox(height:height/15,),
                textform(
      
                  firstnamecontroller,
      
                  "first name",
      
                   TextInputType.name,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.isEmpty) {
                    return "firstname is required";
                   }
                  },
                ),
               SizedBox(height:height/40,),
                textform(
      
                  lastnamecontroller,
      
                  "last name",
      
                   TextInputType.name,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.isEmpty) {
                    return "last name is required";
                   }
                  },
                ),
                SizedBox(height:height/40,),
                textform(
      
                  phonenumbercontroller,
      
                  "phone number",
      
                   TextInputType.number,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.length!=10) {
                    return "phone number must be 10 digits";
                   }
                  },
                ),
                SizedBox(height:height/40,),
                textform(
      
                  emailcontroller,
      
                  "Email",
      
                   TextInputType.emailAddress,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (!value!.contains("@")) {
                    return "enter a valid email";
                   }
                  },
                ),
               SizedBox(height:height/40,),
                textform(
      
                  passwordcontroller,
      
                  "create passowrd",
      
                   TextInputType.visiblePassword,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.length<8) {
                    return "password must be more than 8 charecters";
                   }
                  },
                ),
                SizedBox(height:height/40,),
               
                Container(
                  height: height/14,
                  width: width/2,
                  child: loginbutton(
      
                      "sign in",
                      
                      () {
                       var formdata=formstate.currentState;
                      
                       if( formdata!.validate()){
                        _user_control.registercoustmer(firstnamecontroller.text, lastnamecontroller.text, 
                        emailcontroller.text, passwordcontroller.text, phonenumbercontroller.text, context);
                       }
                    }),
                ),
                SizedBox(height:height/30,),
               
              ],
            ),
          )
          ),
      ),
    );
  }
}