import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:flutter_application_1/Screens/CreateScreen.dart';
import 'package:flutter_application_1/Screens/LogInScreen.dart';
import 'package:flutter_application_1/Screens/TrailDisplay.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/Screens/TrailViewScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  LatLng tappedPoint = LatLng(42.7477863, -71.1699932);

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600)),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600)),
              SizedBox(height: 15),
              ActionChip(
                  label: Text("Log Out"),
                  onPressed: () {
                    logout(context);
                  }),
              SizedBox(height: 15),
              ActionChip(
                  label: Text("Create Trail"),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CreateScreen()));
                  }),
              SizedBox(height: 15),
              ActionChip(
                  label: Text("See Trails!"),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => TrailViewScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LogInScreen()));
}
