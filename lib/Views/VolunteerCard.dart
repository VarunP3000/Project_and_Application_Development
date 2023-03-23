import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/OpportunityDatabase.dart';
import 'package:flutter_application_1/Model/personalDatabase.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolunteerCard extends StatelessWidget {
  final OpportunityDatabase databaseService;

  User? user = FirebaseAuth.instance.currentUser;
  //UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //   });
  // }

  VolunteerCard(this.databaseService);

  @override
  Widget build(BuildContext context) {
    final AddButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 30, 13, 185),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          personalOpportunityDatabase(uid: user!.uid).CreateVolunteer(
            databaseService.VolunteerName,
            databaseService.VolunteerDescription,
            databaseService.experience,
            databaseService.UserName,
            databaseService.ImageUrl,
          );
          Fluttertoast.showToast(msg: 'Volunteer Opportunity Added');
        },
        child: Text(
          "Add",
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
                      databaseService.VolunteerName,
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
                      databaseService.VolunteerDescription,
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
                      "Experience: " + databaseService.experience.toString(),
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
                      "User: " + databaseService.UserName.toString(),
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
                  databaseService.ImageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            AddButton,
          ]),
        ),
      ),
    );
  }
}
