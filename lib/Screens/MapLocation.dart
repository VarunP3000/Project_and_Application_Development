import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MapUserBadge.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'CreateScreen.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
LatLng FirstPoint = LatLng(42.7477863, -71.1699932);

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> myMarker = [];
  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);

    final SaveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //    builder: (context) => CreateScreen(value: FirstPoint)));
        },
        // ignore: prefer_const_constructors
        child: Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 95, 54, 244),
            ),
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) => CreateScreen(value: FirstPoint)));
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              mapType: MapType.hybrid,
              initialCameraPosition: initialCameraPosition,
              markers: Set.from(myMarker),
              onTap: _handleTap,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )),
          ],
        ));
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
      FirstPoint = tappedPoint;
    });
  }
}
