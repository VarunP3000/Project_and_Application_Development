import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Model/database.dart';
import 'package:flutter_application_1/Views/TrailCard.dart';

import 'HomeScreen.dart';

class TrailViewScreen extends StatefulWidget {
  @override
  State<TrailViewScreen> createState() => _TrailViewScreenState();
}

class _TrailViewScreenState extends State<TrailViewScreen> {
  final _auth = FirebaseAuth.instance;
  List<Object> _historyList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserTrails();
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
          title: const Text('Trails'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: _historyList.length,
            itemBuilder: (context, index) {
              return TrailCard(_historyList[index] as DatabaseService);
            },
          ),
        ));
  }

  Future getUserTrails() async {
    final uid = _auth.currentUser!.uid;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('User Trails')
        .get();
    setState(() {
      _historyList =
          List.from(data.docs.map((doc) => DatabaseService.fromSnapshot(doc)));
    });
  }
}
