import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Model/OpportunityDatabase.dart';
import 'package:flutter_application_1/Views/VolunteerCard.dart';

import 'HomeScreen.dart';

class ChooseScreen extends StatefulWidget {
  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  final _auth = FirebaseAuth.instance;
  List<OpportunityDatabase> _VolunteerList = [];
  List<OpportunityDatabase> _searchResult = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserVolunteers();
  }

  _onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _VolunteerList.forEach((OpportunityDatabase data) {
      if (data.VolunteerName.toString()
          .toLowerCase()
          .contains(text.toLowerCase())) {
        _searchResult.add(data);
      }
    });

    setState(() {});
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
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: _onSearchTextChanged,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _searchResult.length,
                itemBuilder: (context, index) {
                  return VolunteerCard(_searchResult[index]);
                }),
          ),
        ],
      ),
    );
  }

  Future getUserVolunteers() async {
    final uid = _auth.currentUser!.uid;
    var data = await FirebaseFirestore.instance
        .collection('VolunteerOpportunities')
        .get();
    setState(() {
      _VolunteerList = List.from(
          data.docs.map((doc) => OpportunityDatabase.fromSnapshot(doc)));
    });
  }
}
