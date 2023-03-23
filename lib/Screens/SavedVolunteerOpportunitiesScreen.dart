import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Model/OpportunityDatabase.dart';
import 'package:flutter_application_1/Model/personalDatabase.dart';
import 'package:flutter_application_1/Views/PersonalVolunteerCard.dart';

import 'HomeScreen.dart';

class SavedVolunteerOpportunitiesScreen extends StatefulWidget {
  @override
  State<SavedVolunteerOpportunitiesScreen> createState() =>
      _SavedVolunteerOpportunitiesScreenState();
}

class _SavedVolunteerOpportunitiesScreenState
    extends State<SavedVolunteerOpportunitiesScreen> {
  final _auth = FirebaseAuth.instance;
  List<Object> SavedOpportunitiesList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserpersonalVolunteers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 9, 28, 197),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 244, 54, 63),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
          title: const Text('Saved Volunteer Opportunities'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: SavedOpportunitiesList.length,
            itemBuilder: (context, index) {
              return personalVolunteerCard(
                  SavedOpportunitiesList[index] as personalOpportunityDatabase);
            },
          ),
        ));
  }

  Future getUserpersonalVolunteers() async {
    final uid = _auth.currentUser!.uid;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('SavedOpportunities')
        .get();
    setState(() {
      SavedOpportunitiesList = List.from(data.docs
          .map((doc) => personalOpportunityDatabase.fromSnapshot(doc)));
    });
  }
}
