import 'dart:async';
import 'dart:ffi';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:food4all/controller/mycontroller.dart';
import 'package:food4all/model/resturantlocationmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key,}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}
var lan;
var lat;
List<resturantlocation_model> servicedata=[];
late Set <Marker>  myMarker ;
MyController _myController=MyController();
class MapSampleState extends State<MapSample> {
  
  getlangandlatservice() {
  _myController.getallresturant().then((value) {
    myMarker=value!.map(
                         (e) => Marker(
                          onTap: () {
                            showDialog(
                                         context: context,
                                           builder: (context){
                                          return AlertDialog(
                                          title: Text(e.name),
                                          content: Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                Text(e.phone),
                                                Text(e.email),
                                                Text("service"),
                                               
                                              ],
                                            ),
                                          ),
                                           );
                                                }
                                               );
                          },
                           markerId: MarkerId(e.id.toString()),
                           position: LatLng(double.parse(e.lat),double.parse(e.lng))),
                                 ) .toSet();
                                 print(myMarker);
                                 setState(() {
                                 });
  });
}


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  TextEditingController number = TextEditingController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition newposition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129,
          -122.08832357078792), //الاحداثيات القادمة من الباكيند
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
      @override
      
  void initState() {
    getlangandlatservice();
      _determinePosition().then((value) {
      lat= value.latitude;
      lan=value.longitude;
      myMarker.add(Marker(position: LatLng(lat, lan), markerId: MarkerId("myPosition")));
      print("lat +lan ="+lat.toString()+lan.toString());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

       floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        _goToTheNewposition();
      },
      label: const Text('my location'),
      icon: const Icon(Icons.location_on_outlined),
      backgroundColor: Colors.pink,
    ),
      
      body: Container(
        height: height,
        decoration: coustomBox(),
        // padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: _determinePosition(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    
                    snapshot.data == null
                        ? CircularProgressIndicator()
                        : Container(
                            height: height / 1.8,
                            child: GoogleMap(
                              markers:myMarker,
                              mapType: MapType.hybrid,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(snapshot.data!.latitude,
                                    snapshot.data!.longitude),
                                zoom: 14.4746,
                              ),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                          ),

                    // SizedBox(
                    //   height: height / ,
                    // ),
                    Container(
                      margin: EdgeInsets.all(20),
                      
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 220,
                      color: globalcolor,
                      child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-7 / 360),
                  child: Text("look for \n food now",
                  style: TextStyle(
                      shadows:[ Shadow(
                  color: Colors.red,
                  blurRadius: 20,
                                ),],
                      fontSize: 45,fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                      textAlign: TextAlign.center,),
                ),
                    ),
                  ],
                );
              }),
        ),
      ),
      
    );
  }

  Future<void> _goToTheNewposition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, lan),zoom: 14.4746,)));
  }
}
