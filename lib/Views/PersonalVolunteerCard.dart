import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/Model/database.dart';
import 'package:flutter_application_1/Model/personalDatabase.dart';

import 'package:flutter_application_1/Model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class personalVolunteerCard extends StatelessWidget {
  final personalOpportunityDatabase PersonalDatabaseService;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    });
  }

  personalVolunteerCard(this.PersonalDatabaseService);

  @override
  Widget build(BuildContext context) {
    final RemoveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 30, 13, 185),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .collection('SavedOpportunities')
              .doc(PersonalDatabaseService.VolunteerName)
              .delete();
          Fluttertoast.showToast(msg: 'Volunteer Opportunity Removed');
        },
        child: Text(
          "Remove",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      PersonalDatabaseService.VolunteerName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      PersonalDatabaseService.VolunteerDescription,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      "Experience: " +
                          PersonalDatabaseService.experience.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      "Creator: " +
                          PersonalDatabaseService.creatorUserName.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.red,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  PersonalDatabaseService.ImageURL,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            RemoveButton,
          ]),
        ),
      ),
    );
  }
}
