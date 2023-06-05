import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food4all/URL/general_URL.dart';
import 'package:food4all/model/complaint_model.dart';
import 'package:food4all/model/mealmodel.dart';
import 'package:food4all/model/resturantlocationmodel.dart';
import 'package:food4all/model/resurant_model.dart';
import 'package:food4all/screen/user/payment.dart';
import 'package:food4all/screen/user/paymenysuccess.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/oreder_resturant_model.dart';
class MyController {
  Future<List<meal_model>?> getmeals() async {
    String myUrl = "$serverUrl/auth/meals/all";
    http.Response response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<meal_model> orders = body
            .map(
              (dynamic item) => meal_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }


Future addservices(String description, String type, context) async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'name';
        final keyid = 'token';
        final valuename = prefs.get(key);
        final valueid = prefs.get(keyid);

    print("$valuename"+"$description"+"$valueid"+"$type");
    var myUrl = Uri.parse("$serverUrl/auth/meals/send");
    final response = await http.post(myUrl, body: {
      "name": valuename,
      "description": description,
      "provider_id": valueid,
      "type": type,
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

  Future pay(String card, String ammount, context) async {
        final prefs = await SharedPreferences.getInstance();
        
        final keyid = 'token';
        final valueid = prefs.get(keyid);

    var myUrl = Uri.parse("$serverUrl/auth/payments/send");
    final response = await http.post(myUrl, body: {
      "card": card,
      "ammount": ammount,
      "customer_id": valueid,
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Success();
                      }));
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


  Future coutmerorder(String meal_id,context) async {
        final prefs = await SharedPreferences.getInstance();
        final keyid = 'token';
        final valueid = prefs.get(keyid);

    var myUrl = Uri.parse("$serverUrl/auth/orders/send");
    final response = await http.post(myUrl, body: {
      "customer_id": valueid,
      "meal_id": meal_id,
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Payment();
                      }));
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


Future<List<order_resturant_model>?> getOrderdResturant() async {
  final prefs = await SharedPreferences.getInstance();
        final keyid = 'token';
        final valueid = prefs.get(keyid);

    String myUrl = "$serverUrl/auth/orders/provider";
    http.Response response = await http.post(Uri.parse(myUrl),body:{
      "provider_id":valueid,
    } );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<order_resturant_model> orders = body
            .map(
              (dynamic item) => order_resturant_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }

  Future<List<order_resturant_model>?> getOrderdcoustmer() async {
  final prefs = await SharedPreferences.getInstance();
        final keyid = 'token';
        final valueid = prefs.get(keyid);
     print(valueid);
    String myUrl = "$serverUrl/auth/orders/customer";
    http.Response response = await http.post(Uri.parse(myUrl),body:{
      "customer_id":valueid,
    } );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<order_resturant_model> orders = body
            .map(
              (dynamic item) => order_resturant_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }


 Future acceptOrder(String order_id,String meal_id,context) async {
        
    var myUrl = Uri.parse("$serverUrl/auth/orders/accept");
    final response = await http.post(myUrl, body: {
      "id": order_id,
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
    //   var myUrl1 = Uri.parse("$serverUrl/auth/meals/delete");
    // final response = await http.post(myUrl1, body: {
    //   "id": meal_id,
    // });
     AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'order accepted',
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


  Future refuseOrder(String order_id,String meal_id,context) async {
        
    var myUrl = Uri.parse("$serverUrl/auth/orders/refuse");
    final response = await http.post(myUrl, body: {
      "id": order_id,
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
    //   var myUrl1 = Uri.parse("$serverUrl/auth/meals/delete");
    // final response = await http.post(myUrl1, body: {
    //   "id": meal_id,
    // });
     AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'order accepted',
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



Future addcomplaintprovider(String content, context) async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'name';
        final valuename = prefs.get(key);
        final keyid = 'token';
        final valueid = prefs.get(keyid);
        print(valuename);
    var myUrl = Uri.parse("$serverUrl/auth/comp/send");
    final response = await http.post(myUrl, body: {
      "name": valuename,
      "content": content,
      "user_id": valueid,
      "role_id": "2" 
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Complaint sent',
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



  Future addcomplaintcoustmer(String content, context) async {
    
        final prefs = await SharedPreferences.getInstance();
        final key = 'name';
        final valuename = prefs.get(key);
        final keyid = 'token';
        final valueid = prefs.get(keyid);
      print("$valuename+$keyid+$content");
    var myUrl = Uri.parse("$serverUrl/auth/comp/send");
    final response = await http.post(myUrl, body: {
      "name": valuename,
      "content": content,
      "user_id": valueid,
      "role_id": "3" 
    });
    print(response.body);
    print(response.statusCode);
    if (json.decode(response.body)['status'] == 1) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Complaint sent',
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

  Future<List<complaint_model>?> getcomplaint() async {
  final prefs = await SharedPreferences.getInstance();
        final keyid = 'token';
        final valueid = prefs.get(keyid);

    String myUrl = "$serverUrl/auth/comp/user";
    http.Response response = await http.post(Uri.parse(myUrl),body:{
      "customer_id":valueid,
    } );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<complaint_model> orders = body
            .map(
              (dynamic item) => complaint_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }


    Future<List<complaint_model>?> getcomplaintres() async {
  final prefs = await SharedPreferences.getInstance();
        final keyid = 'token';
        final valueid = prefs.get(keyid);

    String myUrl = "$serverUrl/auth/comp/user";
    http.Response response = await http.post(Uri.parse(myUrl),body:{
      "provider_id":valueid,
    } );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<complaint_model> orders = body
            .map(
              (dynamic item) => complaint_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }



    Future<List<resturantlocation_model>?> getallresturant() async {
   String myUrl = "$serverUrl/auth/providers/all";
    http.Response response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['data'];
      print(response.body);
      try {
        List<resturantlocation_model> orders = body
            .map(
              (dynamic item) => resturantlocation_model.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }
}