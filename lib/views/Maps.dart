import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:location/location.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Set<Marker>_marker=Set();
  Location location=Location();
  // Completer<GoogleMapController> _controller = Completer();
GoogleMapController _controller;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Select your location',style: TextStyle(color: Color(0XFFABC4A5),),),elevation: 0,backgroundColor: Theme.of(context).scaffoldBackgroundColor,leading:   IconButton(
          icon: Icon(LineIcons.long_arrow_left,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: GoogleMap(
        markers: _marker,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller=controller;
          location.getLocation().then((onValue)
          {
            _marker.add( Marker(
        markerId: MarkerId(onValue.latitude.toString()),
        position:LatLng(onValue.latitude
        , onValue.longitude) ,
        ));
        setState(() {
          longitude=onValue.longitude.toString();
          latitude=onValue.latitude.toString();
        });
controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target:LatLng(onValue.latitude, onValue.longitude)  , zoom: 15.0)));
        // mapController.setMapStyle(mapStyle);
          // _controller.complete(controller);
          
          });
        },
        onTap: (location){
          _marker.clear();
           _marker.add( Marker(
        markerId: MarkerId(location.latitude.toString()),
        position:location ,
        ));
        setState(() {
                    longitude=location.longitude.toString();
          latitude=location.latitude.toString();
        });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0XFF558948),
        onPressed:longitude.isEmpty&&latitude.isEmpty?null: _goTo,
        label: Text('Next'),
        icon: Icon(LineIcons.arrow_circle_right),
      ),
    );
  }

  Future<void> _goTo() async {
     Navigator.pushNamed(context, '$reViewOrder',);
  }
}