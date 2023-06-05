
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food4all/URL/general_URL.dart';
import 'package:food4all/model/resurant_model.dart';
import 'package:food4all/model/user_model.dart';
import 'package:food4all/screen/resturant/retsuranthomepage.dart';
import 'package:food4all/screen/user/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';



// ignore: camel_case_types
class User_Control {
  logincoustmer(context, String username, String password) async {
    var myUrl = Uri.parse("$serverUrl/auth/login");
    final response = await http.post(myUrl, body: {
      "email": "$username",
      "password": "$password",
      "role_id":"3"
    });
   print(response.body);
    if ((response.statusCode == 200 || response.statusCode == 201)&&(json.decode(response.body)['account']['role_id']==3)) {
        _save(json.decode(response.body)['account']['id'].toString(),json.decode(response.body)['account']['firstname']);
        Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage();
                    }));
    } else
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'الحساب غير موجود',
        desc: 'تأكد من صحة البيانات',
        btnOkOnPress: () {},
      )..show();
  }


loginresturant(context, String username, String password) async {
    var myUrl = Uri.parse("$serverUrl/auth/login");
    final response = await http.post(myUrl, body: {
      "email": "$username",
      "password": "$password",
      "role_id":"2"
    });
    print(response.body);
   print(username+password);
    if ((response.statusCode == 200 || response.statusCode == 201)&&(json.decode(response.body)['account']['role_id']==2)) {
        _save(json.decode(response.body)['account']['id'].toString()
        ,json.decode(response.body)['account']['name'].toString());
        Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ResturantHomePage();
                    }));
    } else
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'الحساب غير موجود',
        desc: 'تأكد من صحة البيانات',
        btnOkOnPress: () {},
      )..show();
  }



  Future registercoustmer(
      String firstname,lastname, String email, String password,
      String phone, context) async {
    var myUrl = Uri.parse("$serverUrl/auth/register");
    final response = await http.post(myUrl, body: {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
      "password": password,
      'role_id': "3",
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done!',
        // btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }


Future registerresturant(
      String name, String email, String password,
      String phone,String lat,String lng, context) async {
    var myUrl = Uri.parse("$serverUrl/auth/register");
    final response = await http.post(myUrl, body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      'role_id': "2",
      "lat": lat,
      'lng': lng,
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done!',
        // btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'ERROR',
        // btnOkOnPress: () {},
      ).show();
    }
  }
  _save(String token,String tokenname) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final keyname = 'name';
    final value = token;
    final valuename = tokenname;
    prefs.setString(key, value);
    prefs.setString(keyname, valuename);
  }

   Future<user_model?> getprofileCom(String role_id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    String myUrl = "$serverUrl/auth/profile";

    http.Response response =
        await http.post(Uri.parse(myUrl), body: {
          'id': '$value',
          "role_id":role_id,
          });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      try {
        user_model user =
            user_model.fromJson(jsonDecode(response.body)['user']);
        return user;
      } catch (error) {
        print(error);
      }
    } else if (response.statusCode == 404) {
    } else {
      //  login_status = true;
      throw "Error While getting profile";
    }
  }



  Future<resturant_model?> getprofileComResturant(String role_id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);

    String myUrl = "$serverUrl/auth/profile";

    http.Response response =
        await http.post(Uri.parse(myUrl), body: {
          'id': '$value',
          "role_id":role_id,
          });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      try {
        resturant_model user =
            resturant_model.fromJson(jsonDecode(response.body)['user']);
        return user;
      } catch (error) {
        print(error);
      }
    } else if (response.statusCode == 404) {
    } else {
      //  login_status = true;
      throw "Error While getting profile";
    }
  }

}
