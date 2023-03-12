import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DatabaseService {
  late final String uid;
  late String TrailName;
  late String TrailDescription;
  late double safety;
  late double experience;
  late String ImageUrl;

  DatabaseService({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future CreateTrail(
    String TrailName,
    String TrailDescription,
    double safety,
    double experience,
    String ImageUrl,
  ) async {
    return await users.doc(uid).collection('User Trails').doc(TrailName).set({
      'TrailName': TrailName,
      'TrailDescription': TrailDescription,
      'safety': safety,
      'experience': experience,
    });
  }

  Map<String, dynamic> toJson(
    String TrailName,
    String TrailDescription,
    double safety,
    double experience,
  ) =>
      {
        'TrailName': TrailName,
        'TrailDescription': TrailDescription,
        'safety': safety,
        'experience': experience,
      };

  DatabaseService.fromSnapshot(snapshot) {
    TrailName = snapshot.data()['TrailName'];
    TrailDescription = snapshot.data()['TrailDescription'];
    safety = snapshot.data()['safety'];
    experience = snapshot.data()['experience'];
  }

  Future getTrailList() async {
    List trailList = [];
    final querySnapshot = await FirebaseFirestore.instance
        .collection('User Trails')
        .doc(uid)
        .get();
    try {
      await users.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          trailList.add(element.data);
        });
      });
      return trailList;
    } catch (e) {
      null;
    }
  }
}
