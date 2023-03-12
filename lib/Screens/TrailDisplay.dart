import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/database.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:flutter_application_1/Screens/CreateScreen.dart';
import 'package:flutter_application_1/Screens/LogInScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrailDisplay extends StatefulWidget {
  const TrailDisplay({Key? key}) : super(key: key);

  @override
  State<TrailDisplay> createState() => _TrailDisplayState();
}

class _TrailDisplayState extends State<TrailDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
