import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food4all/Color.dart';
import 'package:food4all/screen/user/homepage.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.done,size: 150,color: globalcolor2,),
              SizedBox(height: 20,),
              Text("Reserve Successful",style: TextStyle(color: globalcolor,fontSize: 20)),
              SizedBox(height: 20,),
              MaterialButton(
                color: globalcolor,
                child: Text("return to home page"),
                onPressed: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomePage();
                      }));
              },)
            ],
          ),
        ),
      ),
    );
  }
}