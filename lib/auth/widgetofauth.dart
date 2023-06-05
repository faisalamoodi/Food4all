import 'package:flutter/material.dart';
import 'package:food4all/Color.dart';
Container textform(controllerText, String Title, TextInputType type,void Function()? onTappassword,bool _isHiddenPassword,String? Function(String?)? validator) {
  
    return Container(
      height: 70,
      width: double.infinity,
      child: TextFormField(
        style: TextStyle(color: Color.fromARGB(255, 210, 201, 201)),
        validator: validator,
        textAlign: TextAlign.center,
        obscureText: type == TextInputType.visiblePassword
            ? _isHiddenPassword
            : false,
        keyboardType: type,
        cursorColor: Colors.white,
        controller: controllerText,
        decoration: InputDecoration(
          // labelText: Title,
          // labelStyle: TextStyle(
          //   color: Colors.white),
          suffixIcon: type != TextInputType.visiblePassword
              ? SizedBox()
              : InkWell(
                  onTap:onTappassword,
                  child: Icon(
                    _isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.blue,
                  ),
                ),
          
          filled: true,
          fillColor: globalcolor,
          
          errorBorder: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.black,)),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15),
          //     borderSide: BorderSide(color: Colors.black)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(30),
          //     borderSide: BorderSide(color: Colors.green)),
          hintText: Title,
          hintStyle:TextStyle(
            fontSize: 13,
                color: Colors.white,
                 fontFamily: 'Cobe'
                ),
        ),
      ),
    );
  }

  ElevatedButton loginbutton(String title, void Function()? onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                // side: BorderSide(width: 1.0, color: Colors.black),
                borderRadius: BorderRadius.circular(40)),
            minimumSize: const Size(250, 50),
            primary: globalcolor));
  }

  BoxDecoration coustomBox() {
    return BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(3.14*0.57),
            colors: [
            Color.fromARGB(255, 55, 68, 112),//rgba(55,68,112,255)
            Color.fromARGB(255, 237, 173, 147) //rgba(237,173,147,255)
          ])
        ); 
  }