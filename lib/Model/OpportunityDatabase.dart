import 'package:cloud_firestore/cloud_firestore.dart';

class OpportunityDatabase {
  late final String uid;
  late String VolunteerName;
  late String VolunteerDescription;
  late double experience;
  late String UserName;
  late String ImageUrl;

  OpportunityDatabase({required this.uid});
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference VolunteerOpportunities =
      FirebaseFirestore.instance.collection('VolunteerOpportunities');

  Future CreateVolunteer(
    String VolunteerName,
    String VolunteerDescription,
    double experience,
    String UserName,
    String ImageUrl,
  ) async {
    return await firebaseFirestore
        .collection('VolunteerOpportunities')
        .doc(VolunteerName)
        .set({
      'VolunteerName': VolunteerName,
      'VolunteerDescription': VolunteerDescription,
      'experience': experience,
      'UserName': UserName,
      'ImageUrl': ImageUrl,
    });
  }

  Map<String, dynamic> toJson(
    String VolunteerName,
    String VolunteerDescription,
    double safety,
    double experience,
    String UserName,
    String ImageUrl,
  ) =>
      {
        'VolunteerName': VolunteerName,
        'VolunteerDescription': VolunteerDescription,
        'experience': experience,
        'UserName': UserName,
        'ImageUrl': ImageUrl,
      };

  OpportunityDatabase.fromSnapshot(snapshot) {
    VolunteerName = snapshot.data()['VolunteerName'];
    VolunteerDescription = snapshot.data()['VolunteerDescription'];
    experience = snapshot.data()['experience'];
    UserName = snapshot.data()['UserName'];
    ImageUrl = snapshot.data()['ImageUrl'];
  }
}
