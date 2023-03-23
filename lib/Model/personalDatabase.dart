import 'package:cloud_firestore/cloud_firestore.dart';

class personalOpportunityDatabase {
  late final String uid;
  late String VolunteerName;
  late String VolunteerDescription;
  late double experience;
  late String creatorUserName;
  late String ImageURL;

  personalOpportunityDatabase({required this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future CreateVolunteer(
    String VolunteerName,
    String VolunteerDescription,
    double experience,
    String creatorUserName,
    String ImageURL,
  ) async {
    return await users
        .doc(uid)
        .collection('SavedOpportunities')
        .doc(VolunteerName)
        .set({
      'VolunteerName': VolunteerName,
      'VolunteerDescription': VolunteerDescription,
      'experience': experience,
      'creatorUserName': creatorUserName,
      'ImageURL': ImageURL,
    });
  }

  Map<String, dynamic> toJson(
    String VolunteerName,
    String VolunteerDescription,
    double safety,
    double experience,
    String creatorUserName,
    String ImageURL,
  ) =>
      {
        'VolunteerName': VolunteerName,
        'VolunteerDescription': VolunteerDescription,
        'experience': experience,
        'creatorUserName': creatorUserName,
        'ImageURL': ImageURL,
      };

  personalOpportunityDatabase.fromSnapshot(snapshot) {
    VolunteerName = snapshot.data()['VolunteerName'];
    VolunteerDescription = snapshot.data()['VolunteerDescription'];
    experience = snapshot.data()['experience'];
    creatorUserName = snapshot.data()['creatorUserName'];
    ImageURL = snapshot.data()['ImageURL'];
  }
}
