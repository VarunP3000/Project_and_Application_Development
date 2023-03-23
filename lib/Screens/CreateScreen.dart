import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/OpportunityDatabase.dart';
import 'package:flutter_application_1/Model/personalDatabase.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final VolunteerDescriptionEditingController = new TextEditingController();
  final VolunteerNameEditingController = new TextEditingController();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  late File _imageFile;
  String? _uploadedFileURL;

  double _ExperienceSliderValue = 0;

  double _SafetySliderValue = 0;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Widget build(BuildContext context) {
    final ExperienceSlider = Slider(
      value: _ExperienceSliderValue,
      max: 5,
      divisions: 5,
      label: _ExperienceSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _ExperienceSliderValue = value;
        });
      },
    );

    final VolunteerNameField = TextFormField(
      autofocus: false,
      controller: VolunteerNameEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Place Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid name(Min 3 characters)");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (value) {
        VolunteerNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Volunteer Place Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final VolunteerDescriptionField = TextFormField(
      autofocus: false,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Description of work is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid name(Min 3 characters)");
        }
        return null;
      },
      controller: VolunteerDescriptionEditingController,
      keyboardType: TextInputType.multiline,
      onSaved: (value) {
        VolunteerDescriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Volunteer work description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final UploadButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 30, 13, 185),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          // ignore: unnecessary_null_comparison
          onPressed: () async {
            _pickImage(ImageSource.gallery);
          },
          child: Text(
            "Upload Image",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));

    final CreateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 30, 13, 185),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          final String fileName = _imageFile.path.split('/').last;
          final Reference ref = _storage.ref().child(fileName);
          final UploadTask uploadTask = ref.putFile(_imageFile);
          final TaskSnapshot downloadUrl = (await uploadTask);
          final String url = (await downloadUrl.ref.getDownloadURL());
          setState(() {
            _uploadedFileURL = url;
          });
          postDetailsToFirestore(
            VolunteerDescriptionEditingController,
            VolunteerNameEditingController,
            ExperienceSlider,
            _uploadedFileURL!,
          );
          Fluttertoast.showToast(msg: 'Volunteer Opportunity Created');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Create",
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
        backgroundColor: Color.fromARGB(255, 240, 241, 243),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 95, 54, 244),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 45),
                      VolunteerNameField,
                      SizedBox(height: 20),
                      VolunteerDescriptionField,
                      SizedBox(
                        height: 20,
                      ),
                      Text("Experience"),
                      ExperienceSlider,
                      SizedBox(
                        height: 20,
                      ),
                      Text("Safety"),
                      SizedBox(
                        height: 20,
                      ),
                      UploadButton,
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CreateButton,
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  postDetailsToFirestore(
    TextEditingController VolunteerDescriptionEditingController,
    TextEditingController VolunteerNameEditingController,
    Slider experienceSlider,
    String url,
  ) async {
    //   User? user = _auth.currentUser;
    OpportunityDatabase(uid: user!.uid).CreateVolunteer(
      VolunteerNameEditingController.text,
      VolunteerDescriptionEditingController.text,
      experienceSlider.value,
      "${loggedInUser.firstName} ${loggedInUser.secondName}",
      url,
    );
    personalOpportunityDatabase(uid: user!.uid).CreateVolunteer(
      VolunteerNameEditingController.text,
      VolunteerDescriptionEditingController.text,
      experienceSlider.value,
      "${loggedInUser.firstName} ${loggedInUser.secondName}",
      url,
    );
  }
}
