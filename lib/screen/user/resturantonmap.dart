import 'dart:async';
import 'dart:ffi';
import 'package:food4all/Color.dart';
import 'package:food4all/auth/widgetofauth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapResturantSample extends StatefulWidget {
   final String lat1;
  final String lng1;
  const MapResturantSample({Key? key, required this.lat1, required this.lng1,}) : super(key: key);

  @override
  State<MapResturantSample> createState() => MapResturantSampleState();
}
var lan;
var lat;
class MapResturantSampleState extends State<MapResturantSample> {
  
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
      _determinePosition().then((value) {
      lat= value.latitude;
      lan=value.longitude;
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
        child: FutureBuilder(
            future: _determinePosition(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  snapshot.data == null
                      ? CircularProgressIndicator()
                      : Container(
                          height: height / 2.5,
                          child: GoogleMap(
                            markers: {
                              Marker(
                                 onTap: () {
                                   showDialog(
                                     context: context,
                                       builder: (context){
                                      return AlertDialog(
                                      title: Text("Trucks"),
                                      content: Text('this is ahmad truck'),
                                       );
                                            }
                                           );
                                 },
                                  markerId: MarkerId("1"),
                                  position: LatLng(double.parse(widget.lat1),
                                      double.parse(widget.lng1))
                                      
                                ),
                                Marker(
                                 onTap: () {
                                   
                                 },
                                  markerId: MarkerId("2"),
                                  position: LatLng(snapshot.data!.latitude,
                                      snapshot.data!.longitude)
                                      
                                ),
                               // الاحداثيات القادمة من الباكيند
                            },
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(double.parse(widget.lat1) ,
                                  double.parse(widget.lng1)),
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
                  
                ],
              );
            }),
      ),
      
    );
  }

  Future<void> _goToTheNewposition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, lan),zoom: 14.4746,)));
  }
}
