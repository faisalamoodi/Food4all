import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/auth/login.dart';
import 'package:food4all/auth/signupresturant.dart';
import 'package:food4all/auth/singup.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/user_controller.dart';
import 'package:food4all/screen/resturant/retsuranthomepage.dart';
import 'package:food4all/screen/user/googlemaps.dart';
import 'package:food4all/screen/user/homepage.dart';

class ResturantLogin extends StatefulWidget {
  const ResturantLogin({super.key});

  @override
  State<ResturantLogin> createState() => _ResturantLoginState();
}
User_Control _user_control=User_Control();
bool _isHiddenPassword=true;
TextEditingController passwordcontroller=TextEditingController();
TextEditingController emailcontroller=TextEditingController();
class _ResturantLoginState extends State<ResturantLogin> {
  
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
                SizedBox(height:height/8,),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(-7 / 360),
                  child: Text("food4\nall",
                  style: TextStyle(
                    shadows:[ Shadow(
                  color: Colors.red,
                  blurRadius: 20,
                              ),],
                    fontSize: 40,fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                    textAlign: TextAlign.center,),
                ),
                
                
                SizedBox(height:height/15,),
                 RotationTransition(
                  turns: AlwaysStoppedAnimation(-5 / 360),
                   child: Text("Resturant !",style: TextStyle(
                    shadows:[ Shadow(
                    color: Colors.red,
                     blurRadius: 10,
                   ),],
                    fontStyle: FontStyle.italic,
                    fontSize: 20,color: Colors.white),
                    textAlign: TextAlign.center,),
                 ),
                SizedBox(height:height/15,),
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
      
                  "Password",
      
                   TextInputType.visiblePassword,
      
                   () {
                  setState(() {
                    _isHiddenPassword=!_isHiddenPassword;
                  });
                },
                
                _isHiddenPassword,
      
                (value) {
                   if (value!.length < 8) {
                    return "password must be 8 charcters";
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
                        _user_control.loginresturant(context,emailcontroller.text,passwordcontroller.text);
                     
                       }
                    }),
                ),
                SizedBox(height:height/40,),
                Container(
                  height: height/14,
                  width: width/2,
                  child: loginbutton(
      
                      "sign up",
                      
                      () {
                       var formdata=formstate.currentState;
                      
                        Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SignupResturant();
                      }));
                       
                    }),
                ),

                SizedBox(height: height/20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("sign in or sign up like "),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Login();
                      }));
                      },
                      child: Text("user",style: TextStyle(color: Colors.grey),),
                    ),
                  ],
                )
              ],
            ),
          )
          ),
      ),
    );
  }
}