import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:flutter_application_1/Screens/CreateScreen.dart';
import 'package:flutter_application_1/Screens/LogInScreen.dart';
import 'package:flutter_application_1/Screens/ChooseScreen.dart';
import 'package:flutter_application_1/Screens/SavedVolunteerOpportunitiesScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/Model/personalDatabase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
    final CreateOpportunityButton = Material(
      elevation: 5,
      color: Color.fromARGB(255, 185, 62, 13),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => CreateScreen()));
        },
        child: const Text(
          "Create a Volunteer Opportunity",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final AddOpportunityButton = Material(
      elevation: 5,
      //borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 185, 62, 13),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ChooseScreen()));
        },
        child: const Text(
          "Look for volunteer opportunities and save them!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final SavedOpportunityButton = Material(
      elevation: 5,
      //borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 185, 62, 13),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SavedVolunteerOpportunitiesScreen()));
        },
        child: const Text(
          "Saved Opportunities",
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
              Text(
                'Volunteer Hour',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              CreateOpportunityButton,
              SizedBox(height: 15),
              AddOpportunityButton,
              SizedBox(height: 15),
              SavedOpportunityButton,
              ActionChip(
                  label: Text("Log Out"),
                  onPressed: () {
                    logout(context);
                  }),
              SizedBox(height: 60),
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
