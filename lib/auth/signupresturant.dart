
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/user_controller.dart';

class SignupResturant extends StatefulWidget {
  const SignupResturant({super.key});

  @override
  State<SignupResturant> createState() => _SignupResturantState();
}

bool _isHiddenPassword=true;
TextEditingController firstnamecontroller=TextEditingController();
TextEditingController phonenumbercontroller=TextEditingController();
TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
TextEditingController latcontroller=TextEditingController();
TextEditingController langcontroller=TextEditingController();

User_Control _user_control=User_Control();
class _SignupResturantState extends State<SignupResturant> {
  
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
      
                  "resturant name",
      
                   TextInputType.name,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.isEmpty) {
                    return "resturant name is required";
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
      
                  "passowrd",
      
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
                textform(
      
                  latcontroller,
      
                  "latitude",
      
                   TextInputType.number,
      
                   () {},
                
                _isHiddenPassword,
      
                (value) {
                   
                  },
                ),
                  
                SizedBox(height:height/40,),
                textform(
      
                  langcontroller,
      
                  "longtiude",
      
                   TextInputType.number,
      
                   () {
                  setState(() {
                    _isHiddenPassword=!_isHiddenPassword;
                  });
                },
                
                _isHiddenPassword,
      
                (value) {
                   
                  },
                ),
                
                SizedBox(height:height/15,),
                Container(
                  height: height/14,
                  width: width/2,
                  child: loginbutton(
      
                      "sign in",
                      
                      () {
                       var formdata=formstate.currentState;
                      
                       if( formdata!.validate()){
                        _user_control.registerresturant(
                          firstnamecontroller.text, emailcontroller.text, passwordcontroller.text,
                         phonenumbercontroller.text, latcontroller.text, langcontroller.text , context);
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